
resource "random_string" "password" {
  length = 15
  special = false
  number = true
}
module "redshift" {
  source  = "terraform-aws-modules/redshift/aws"
  version =  "~> 2.0"

  cluster_identifier      = var.redshift_cluster_identifier
  cluster_node_type       = var.redshift_node_type
  cluster_number_of_nodes = var.redshift_cluster_node_number

  cluster_database_name   = var.redshift_cluster_name
  cluster_master_username = var.redshift_user_name
  cluster_master_password = random_string.password.result

  # Group parameters
  wlm_json_configuration = "[{\"query_concurrency\": 5}]"

  # DB Subnet Group Inputs
  subnets = module.vpc.redshift_subnets

  # IAM Roles
  cluster_iam_roles = ["${var.rds_role_arn}"]
  vpc_security_group_ids = [module.redshift_sg.this_security_group_id]
}
