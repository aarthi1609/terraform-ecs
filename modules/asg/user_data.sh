#!/bin/bash
echo "ECS_CLUSTER=${ecs_cluster_name}" >> /etc/ecs/ecs.config
echo "ECS_INSTANCE_ATTRIBUTES={\"role\": \"${role}\"}" >> /etc/ecs/ecs.config
