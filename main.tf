module "ecr" {
  source = "./modules/ecr"
  repo_name = "test-ecr-repo"
  image_count = 10
}

module "network"{
    source = "./modules/network"
    vpc_cidr_block = "10.0.0.0/16"
    availability_zones = ["ap-south-1a", "ap-south-1b"]
    public_subnets_cidr  = ["10.0.1.0/24", "10.0.2.0/24"]
    private_subnets_cidr = ["10.0.3.0/24", "10.0.4.0/24"]
    project_name = var.project_name 
    environment = var.environment
    ecs_sg_name = "ecs-sg"
    alb_sg_name = "alb-sg"
    alb_sg_description = "ALB Security Group"
    ecs_sg_description = "ECS Security Group"
    vpc_id = module.network.vpc_id
}

module "iam"{
    source = "./modules/iam"
}

module "asg"{
    source = "./modules/asg"
    project_name = var.project_name
    environment = var.environment     
    launch_template_name = "test-launch-template"
    launch_template_description = "test-launch-template-description"
    instance_type = "t2.micro"  
    autoscaling_max_size = 2
    autoscaling_min_size = 1
    autoscaling_desired_capacity = 1
    ami_id = "ami-0024206fed5c99368"  
    vpc_security_group_ids = module.network.vpc_security_group_ids
    private_subnet_ids = module.network.private_subnet_ids
    ec2_instance_profile_name = module.iam.ec2_instance_profile_name
    ecs_cluster_name = "test-ecs-cluster"
    role = "test-project"
}

module "alb" {
    source = "./modules/alb"
    project_name = var.project_name
    environment = var.environment
    security_groups = [module.network.alb_security_group_id]
    subnets = module.network.public_subnet_ids
    vpc_id = module.network.vpc_id
    healthcheck_endpoint = "/"
    certificate_arn = "arn:aws:acm:ap-south-1:767828731847:certificate/03d33a3e-56d3-4afe-a11b-fa9954ae7efe"
    domain_name = "mako-tf.stagingenv.co"
}


module "ecs" {
  source = "./modules/ecs"
  task_definition_family_name = "test-tdf-family"
  operating_system_family = "LINUX"
  cpu_architecture = "X86_64"
  network_mode = "bridge"
  cpu = "512"
  memory = "512"
  container_name = "test-container"
  tag = "latest"
  container_port = 80
  host_port = 80 
  retention_in_days = 7
  aws_region = var.aws_region
  task_role_arn = module.iam.task_role_arn
  execution_role_arn = module.iam.task_role_arn
  role = "test-project"
  service_name = "test-ecs-service"
  ecs_cluster_name = "test-ecs-cluster"
  capacity_provider_name = "test-ecs-capacity-provider"
  target_group_arn = module.alb.alb_target_group_arn
  asg_arn = module.asg.asg_arn
  ecr_repo_url = module.ecr.ecr_repo_url
}