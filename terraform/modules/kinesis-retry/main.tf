
resource "aws_cloudformation_stack" "kinesis_retry_stack" {
  name = var.kinesis_retry_cfn_stack_name
  parameters = {
    DockerImage      = var.kinesis_retry_cfn_docker_image
    AwsDefaultRegion = var.awslogs_region
    EcsClusterName   = var.ecs_cluster_name
  }

  template_body = file("../cloudformation/kinesis-retry-template.yaml")
  capabilities  = ["CAPABILITY_NAMED_IAM"]
  on_failure    = "DELETE"
}
