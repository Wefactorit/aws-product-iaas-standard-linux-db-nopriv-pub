module "ssh_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "3.4"

  name                = "emobg-gbi-${var.application}-${var.env}-${var.region_trigram}-ssh-sg"
  description         = "Security group for ssh access"
  vpc_id              = module.vpc.vpc_id
  ingress_cidr_blocks = sort(compact(distinct(concat(var.auto_ingress_rules, var.ingress_rules, [""]))))

  ingress_with_cidr_blocks = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      description = "User-ssh ports"
      cidr_blocks = "0.0.0.0/0"
    },
  ]
}

module "http_sg" {
  source = "terraform-aws-modules/security-group/aws"

  name                = "emobg-gbi-${var.application}-${var.env}-${var.region_trigram}-http-sg"
  description         = "Security group for http"
  vpc_id              = module.vpc.vpc_id
  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules       = ["http-80-tcp", "all-icmp"]
  egress_rules        = ["all-all"]

  ingress_with_cidr_blocks = [
    {
      from_port   = 10000
      to_port     = 10000
      protocol    = "tcp"
      description = "http ports"
      cidr_blocks = module.vpc.vpc_cidr_block
    },
  ]
}

# TODO: Refactor this SG for RDS
module "rds_sg" {
  source = "terraform-aws-modules/security-group/aws"

  name                = "${var.prefix}-gbi-${var.application}-${var.env}-${var.region_trigram}-rds-sg"
  description         = "Security group for http "
  vpc_id              = module.vpc.vpc_id
  ingress_cidr_blocks = [module.vpc.vpc_cidr_block]

  ingress_with_cidr_blocks = [
    {
      rule        = "postgresql-tcp"
      cidr_blocks = module.vpc.vpc_cidr_block
    },
  ]

  egress_with_cidr_blocks = [
    {
      rule        = "postgresql-tcp"
      cidr_blocks = "0.0.0.0/0"
    },
  ]
}




module "redshift_sg" {
  source = "terraform-aws-modules/security-group/aws"

  name                = "${var.prefix}-gbi-${var.application}-${var.env}-${var.region_trigram}-redshift-sg"
  description         = "Security group for Redshift "
  vpc_id              = module.vpc.vpc_id
  ingress_cidr_blocks = [module.vpc.vpc_cidr_block]
  ingress_with_cidr_blocks = [
    {
      from_port   = 5439
      to_port     = 5439
      protocol    = "tcp"
      description = "redshift ports"
      cidr_blocks = module.vpc.vpc_cidr_block
    },
  ]
  egress_rules = ["all-all"]

}
