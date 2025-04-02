resource "aws_launch_template" "ecs_launch_template" {
  name                   = var.launch_template_name
  description = var.launch_template_description
  image_id = var.ami_id
  network_interfaces {
    associate_public_ip_address = false
    security_groups             = var.vpc_security_group_ids
  }
  instance_type          = var.instance_type
  user_data              = base64encode(templatefile("${path.module}/user_data.sh", {
    ecs_cluster_name = var.ecs_cluster_name
    role = var.role
  }))
  
  iam_instance_profile {
    name = var.ec2_instance_profile_name
  }
  update_default_version = true
}

resource "aws_autoscaling_group" "ecs_autoscaling_group" {
  name                  = "${var.project_name}-autoscaling-${var.environment}"
  max_size              = var.autoscaling_max_size
  min_size              = var.autoscaling_min_size
  desired_capacity      = var.autoscaling_desired_capacity
  vpc_zone_identifier   = var.private_subnet_ids
  health_check_type     = "EC2"

  launch_template {
    id      = aws_launch_template.ecs_launch_template.id
    version = aws_launch_template.ecs_launch_template.latest_version
  }

  instance_refresh {
    strategy = "Rolling"
  }

  lifecycle {
    create_before_destroy = true
  }


  tag {
    key                 = "Name"
    value               = "${var.project_name}-ecs-${var.environment}"
    propagate_at_launch = true
  }
}
