module "vpc_flow_logs" {
  source  = "binbashar/vpc-flowlogs/aws"
  version = "1.0.0"

  vpc_id             = module.vpc.vpc_id
  bucket_name_prefix = "${var.prefix}-gba-${var.application}-${var.region_trigram}-inf-s3"
  bucket_region      = var.region
  tags = {
    label     = "${var.prefix}-gba-${var.application}-${var.env}"
    env       = var.env
    AppRole   = "Bucket for dataiku flow logs"
    Cluster   = module.vpc.vpc_id
    ManagedBy = "devopsteamParis"
  }

}
