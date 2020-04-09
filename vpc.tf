data "aws_vpc" "dev_dataiku" {
  default = true
}

data "aws_security_group" "default" {
  name   = "default"
  vpc_id = data.aws_vpc.dev_dataiku.id
}

resource "aws_eip" "nat" {
  count = 1

  vpc = true
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "${var.prefix}-gbi-${var.application}-${var.env}-${var.region_trigram}-vpc"
  cidr = "10.9.16.0/21"

  azs                 = var.azs
  public_subnets      = var.public_subnets
  private_subnets     = var.private_subnets
  database_subnets    = var.database_subnets
  redshift_subnets    = var.redshift_subnets
  external_nat_ip_ids = aws_eip.nat.*.id

  enable_nat_gateway     = true
  single_nat_gateway     = true
  enable_dns_hostnames   = true
  enable_dns_support     = true
  reuse_nat_ips          = true
  one_nat_gateway_per_az = false

  # EC2 Configuration
  #enable_ec2_endpoint = truet
  #ec2_endpoint_private_dns_enabled = true
  #ec2_endpoint_security_group_ids  = [data.aws_security_group.default.id]

  # ECS Configuration
  #enable_ecs_endpoint = true
  #ecs_endpoint_private_dns_enabled = true
  #ecs_endpoint_security_group_ids  = [data.aws_security_group.default.id]

  public_subnet_tags = {
    Name = "emobg-gbi-${var.env}-${var.region_trigram}-pub"
  }


  tags = {
    Owner     = "Devopsteam"
    Env       = "dev"
    Project   = var.application
    AppRole   = "VPC"
    ManagedBy = "Devopsteam"
  }

  # vpc_tags = {
  #   Name = ""
  #}
}
