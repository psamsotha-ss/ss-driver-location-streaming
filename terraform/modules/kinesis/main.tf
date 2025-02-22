
provider "aws" {
  region = var.aws_region
}

resource "aws_kinesis_stream" "driver_location_stream" {
  name             = var.stream_name
  shard_count      = var.shard_count
  retention_period = var.retention_period

  tags = {
    Project = "ss-driver-location-streaming"
    Team    = "Data-Engineers"
  }
}
