######### common_name

variable "prefix" {
  description = "The defined prefix to build pattern "
  default     = ""
}


variable "region_trigram" {
  description = "The region trigram to build pattern"
  default = ""
}


variable "region" {
  description = "The region name"
  default = ""
}


variable "env" {
  description = "The environnement name"
  default     = ""
}



variable "image_id" {
  description = "The image ID to deploy"
  default     = ""
}


variable "instance_type" {
  description = "The instance type"
  default     = "t2.medium"
}

variable "vpc_cidr" {
  description = "The main CIDR for VPC"
  default     = "10.9.16.0/21"
}

variable "azs" {
  description = "The zone targeted"
  type        = list
  default     = ["eu-west-3a", "eu-west-3b"]
}

variable "public_subnets" {
  description = "the public subnet"
  type        = list
  default     = ["10.9.16.0/24", "10.9.20.0/24"]
}

variable "private_subnets" {
  description = "The private subnets"
  type        = list
  default     = ["10.9.17.0/24", "10.9.21.0/24"]
}

variable "database_subnets" {
  description = "The database subnet"
  type        = list
  default     = ["10.9.19.0/24", "10.9.23.0/24"]
}

variable "redshift_subnets" {
  description = "The redshift subnets"
  type        = list
  default     = ["10.9.18.0/24", "10.9.22.0/24"]
}

variable "application" {
  type    = string
  default = "generic"
}







## Account ID
###Project main Configuration#####
variable "account_id" {
  description = "The AWS account ID"
  type        = string
  default     = "arn:aws:iam::936645143561:role/OrganizationAccountAccessRole"
}

#ALB

variable "alb_frontend_port" {
  description = "The listener frontend port"
  type = number
}

variable "alb_backend_port" {
  description = "The backend port"
  type = number
}

#NLB

variable "nlb_frontend_port" {
  description = "The listener frontend port"
  type = number
}

variable "nlb_backend_port" {
  description = "The backend port"
  type = number
}



##########
# Ingress
##########
variable "ingress_rules" {
  description = "List of ingress rules to create by name"
  type        = list(string)
  default     = []
}

variable "ingress_with_self" {
  description = "List of ingress rules to create where 'self' is defined"
  type        = list(map(string))
  default     = []
}

variable "ingress_with_cidr_blocks" {
  description = "List of ingress rules to create where 'cidr_blocks' is used"
  type        = list(map(string))
  default     = []
}

variable "ingress_with_ipv6_cidr_blocks" {
  description = "List of ingress rules to create where 'ipv6_cidr_blocks' is used"
  type        = list(map(string))
  default     = []
}

variable "ingress_with_source_security_group_id" {
  description = "List of ingress rules to create where 'source_security_group_id' is used"
  type        = list(map(string))
  default     = []
}

variable "ingress_cidr_blocks" {
  description = "List of IPv4 CIDR ranges to use on all ingress rules"
  type        = list(string)
  default = [
  "0.0.0.0/0"]
}

variable "ingress_ipv6_cidr_blocks" {
  description = "List of IPv6 CIDR ranges to use on all ingress rules"
  type        = list(string)
  default     = []
}

variable "ingress_prefix_list_ids" {
  description = "List of prefix list IDs (for allowing access to VPC endpoints) to use on all ingress rules"
  type        = list(string)
  default     = []
}

###################
# Computed Ingress
###################
variable "computed_ingress_rules" {
  description = "List of computed ingress rules to create by name"
  type        = list(string)
  default     = []
}

variable "computed_ingress_with_self" {
  description = "List of computed ingress rules to create where 'self' is defined"
  type        = list(map(string))
  default     = []
}

variable "computed_ingress_with_cidr_blocks" {
  description = "List of computed ingress rules to create where 'cidr_blocks' is used"
  type        = list(map(string))
  default     = []
}

variable "computed_ingress_with_ipv6_cidr_blocks" {
  description = "List of computed ingress rules to create where 'ipv6_cidr_blocks' is used"
  type        = list(map(string))
  default     = []
}

variable "computed_ingress_with_source_security_group_id" {
  description = "List of computed ingress rules to create where 'source_security_group_id' is used"
  type        = list(map(string))
  default     = []
}

variable "computed_ingress_cidr_blocks" {
  description = "List of IPv4 CIDR ranges to use on all computed ingress rules"
  type        = list(string)
  default     = []
}

variable "computed_ingress_ipv6_cidr_blocks" {
  description = "List of IPv6 CIDR ranges to use on all computed ingress rules"
  type        = list(string)
  default     = []
}

variable "computed_ingress_prefix_list_ids" {
  description = "List of prefix list IDs (for allowing access to VPC endpoints) to use on all computed ingress rules"
  type        = list(string)
  default     = []
}

###################################
# Number of computed ingress rules
###################################
variable "number_of_computed_ingress_rules" {
  description = "Number of computed ingress rules to create by name"
  type        = number
  default     = 0
}

variable "number_of_computed_ingress_with_self" {
  description = "Number of computed ingress rules to create where 'self' is defined"
  type        = number
  default     = 0
}

variable "number_of_computed_ingress_with_cidr_blocks" {
  description = "Number of computed ingress rules to create where 'cidr_blocks' is used"
  type        = number
  default     = 0
}

variable "number_of_computed_ingress_with_ipv6_cidr_blocks" {
  description = "Number of computed ingress rules to create where 'ipv6_cidr_blocks' is used"
  type        = number
  default     = 0
}

variable "number_of_computed_ingress_with_source_security_group_id" {
  description = "Number of computed ingress rules to create where 'source_security_group_id' is used"
  type        = number
  default     = 0
}

variable "number_of_computed_ingress_cidr_blocks" {
  description = "Number of IPv4 CIDR ranges to use on all computed ingress rules"
  type        = number
  default     = 0
}

variable "number_of_computed_ingress_ipv6_cidr_blocks" {
  description = "Number of IPv6 CIDR ranges to use on all computed ingress rules"
  type        = number
  default     = 0
}

variable "number_of_computed_ingress_prefix_list_ids" {
  description = "Number of prefix list IDs (for allowing access to VPC endpoints) to use on all computed ingress rules"
  type        = number
  default     = 0
}

#########
# Egress
#########
variable "egress_rules" {
  description = "List of egress rules to create by name"
  type        = list(string)
  default     = []
}

variable "egress_with_self" {
  description = "List of egress rules to create where 'self' is defined"
  type        = list(map(string))
  default     = []
}

variable "egress_with_cidr_blocks" {
  description = "List of egress rules to create where 'cidr_blocks' is used"
  type        = list(map(string))
  default     = []
}

variable "egress_with_ipv6_cidr_blocks" {
  description = "List of egress rules to create where 'ipv6_cidr_blocks' is used"
  type        = list(map(string))
  default     = []
}

variable "egress_with_source_security_group_id" {
  description = "List of egress rules to create where 'source_security_group_id' is used"
  type        = list(map(string))
  default     = []
}

variable "egress_cidr_blocks" {
  description = "List of IPv4 CIDR ranges to use on all egress rules"
  type        = list(string)
  default = [
  "0.0.0.0/0"]
}

variable "egress_ipv6_cidr_blocks" {
  description = "List of IPv6 CIDR ranges to use on all egress rules"
  type        = list(string)
  default = [
  "::/0"]
}

variable "egress_prefix_list_ids" {
  description = "List of prefix list IDs (for allowing access to VPC endpoints) to use on all egress rules"
  type        = list(string)
  default     = []
}

##################
# Computed Egress
##################
variable "computed_egress_rules" {
  description = "List of computed egress rules to create by name"
  type        = list(string)
  default     = []
}

variable "computed_egress_with_self" {
  description = "List of computed egress rules to create where 'self' is defined"
  type        = list(map(string))
  default     = []
}

variable "computed_egress_with_cidr_blocks" {
  description = "List of computed egress rules to create where 'cidr_blocks' is used"
  type        = list(map(string))
  default     = []
}

variable "computed_egress_with_ipv6_cidr_blocks" {
  description = "List of computed egress rules to create where 'ipv6_cidr_blocks' is used"
  type        = list(map(string))
  default     = []
}

variable "computed_egress_with_source_security_group_id" {
  description = "List of computed egress rules to create where 'source_security_group_id' is used"
  type        = list(map(string))
  default     = []
}

variable "computed_egress_cidr_blocks" {
  description = "List of IPv4 CIDR ranges to use on all computed egress rules"
  type        = list(string)
  default = [
  "0.0.0.0/0"]
}

variable "computed_egress_ipv6_cidr_blocks" {
  description = "List of IPv6 CIDR ranges to use on all computed egress rules"
  type        = list(string)
  default = [
  "::/0"]
}

variable "computed_egress_prefix_list_ids" {
  description = "List of prefix list IDs (for allowing access to VPC endpoints) to use on all computed egress rules"
  type        = list(string)
  default     = []
}

##################################
# Number of computed egress rules
##################################
variable "number_of_computed_egress_rules" {
  description = "Number of computed egress rules to create by name"
  type        = number
  default     = 0
}

variable "number_of_computed_egress_with_self" {
  description = "Number of computed egress rules to create where 'self' is defined"
  type        = number
  default     = 0
}

variable "number_of_computed_egress_with_cidr_blocks" {
  description = "Number of computed egress rules to create where 'cidr_blocks' is used"
  type        = number
  default     = 0
}

variable "number_of_computed_egress_with_ipv6_cidr_blocks" {
  description = "Number of computed egress rules to create where 'ipv6_cidr_blocks' is used"
  type        = number
  default     = 0
}

variable "number_of_computed_egress_with_source_security_group_id" {
  description = "Number of computed egress rules to create where 'source_security_group_id' is used"
  type        = number
  default     = 0
}

variable "number_of_computed_egress_cidr_blocks" {
  description = "Number of IPv4 CIDR ranges to use on all computed egress rules"
  type        = number
  default     = 0
}

variable "number_of_computed_egress_ipv6_cidr_blocks" {
  description = "Number of IPv6 CIDR ranges to use on all computed egress rules"
  type        = number
  default     = 0
}

variable "number_of_computed_egress_prefix_list_ids" {
  description = "Number of prefix list IDs (for allowing access to VPC endpoints) to use on all computed egress rules"
  type        = number
  default     = 0
}


# This file was generated from defaults defined in rules.tf using update_groups.sh.
###################################
# DO NOT CHANGE THIS FILE MANUALLY
###################################

variable "auto_ingress_rules" {
  description = "List of ingress rules to add automatically"
  type        = list(string)
  default = [
  "http-80-tcp"]
}

variable "auto_ingress_with_self" {
  description = "List of maps defining ingress rules with self to add automatically"
  type        = list(map(string))
  default = [
    {
      "rule" = "all-all"
  }]
}

variable "auto_egress_rules" {
  description = "List of egress rules to add automatically"
  type        = list(string)
  default = [
  "all-all"]
}

variable "auto_egress_with_self" {
  description = "List of maps defining egress rules with self to add automatically"
  type        = list(map(string))
  default     = []
}

# Computed
variable "auto_computed_ingress_rules" {
  description = "List of ingress rules to add automatically"
  type        = list(string)
  default     = []
}

variable "auto_computed_ingress_with_self" {
  description = "List of maps defining computed ingress rules with self to add automatically"
  type        = list(map(string))
  default     = []
}

variable "auto_computed_egress_rules" {
  description = "List of computed egress rules to add automatically"
  type        = list(string)
  default     = []
}

variable "auto_computed_egress_with_self" {
  description = "List of maps defining computed egress rules with self to add automatically"
  type        = list(map(string))
  default     = []
}

# Number of computed rules
variable "auto_number_of_computed_ingress_rules" {
  description = "Number of computed ingress rules to create by name"
  type        = number
  default     = 0
}

variable "auto_number_of_computed_ingress_with_self" {
  description = "Number of computed ingress rules to create where 'self' is defined"
  type        = number
  default     = 0
}

variable "auto_number_of_computed_egress_rules" {
  description = "Number of computed egress rules to create by name"
  type        = number
  default     = 0
}

variable "auto_number_of_computed_egress_with_self" {
  description = "Number of computed egress rules to create where 'self' is defined"
  type        = number
  default     = 0
}


variable "route53_parent_zone_id" {
  description = "The zone parent id"
  type        = string
  default     = "Z2XSZKH40EWJQ9"
}

############ RDS CONFIGURATION ######################

variable "rds_role_arn" {
  default = ""
}

variable "rds_encrypted" {
  description = "Activate or not the RDS"
  type        = bool
  default     = true
}

variable "rds_storage_type" {
  description = "The storage type"
  type        = string
  default     = "io1"
}


variable "rds_sio1_iops" {
  description = "The iops configuration for RDS instance"
  type        = number
  default     = 10000
}


variable "rds_backup_retention_period" {
  description = "The backup retention days"
  type        = number
  default     = 30
}


variable "rds_identifier" {
  description = "The RDS identifiers"
  type        = string
  default     = "dataiku-db-ha"
}
variable "database_name" {
  description = "The postgres RDS database name"
  type        = string
  default     = "dataiku"
}

variable "database_username" {
  description = "The RDS database username"
  type        = string
  default     = "myusernametochange"
}

variable "database_rds_port" {
  description = "The RDS port"
  type        = string
  default     = "5432"
}

variable "maintenance_window_rds" {
  description = "The maintenance windows for RDS instance"
  type        = string
  default     = "Sat:02:00-Sat:06:00"
}

variable "backup_windows_rds" {
  description = "The backup window for RDS"
  type        = string
  default     = "22:00-01:00"
}


variable "rds_family_instance" {
  description = "The RDS family instance"
  type        = string
  default     = "postgres9.6"
}

variable "rds_engine" {
  description = "The RDS engine"
  type        = string
  default     = "postgres"
}


variable "rds_engine_version" {
  description = "The RDS engine version"
  type        = string
  default     = "9.6.15"
}

variable "rds_instance_class" {
  description = "The RDS instance class"
  type        = string
  default     = "db.t3.small"
}

variable "rds_instance_storage" {
  description = "The RDS storage provision"
  type        = number
  default     = 2000
}


variable "rds_major_version" {
  description = "The RDS major version"
  type        = string
  default     = "9.6"
}

###ASG Variables

variable "asg_name" {
  description = "Auto scale group name"
  type        = string
  default     = "emobg-gbi-cicd-dev-ew3-pri-asg"
}





variable "extend_during_weekdays" {
  description = ""
  type        = bool
  default     = true
}

variable "desired_capacity" {
  description = "The desired capacity of the scaling group"
  default     = 1
}

variable "max_size" {
  description = "The Auto scaling group max size"
  default     = 1
}

variable "min_size" {
  description = "The Auto scale min size"
  default     = 1
}

variable "rds_monioring_role" {
  description = "The RDS monitoring role"
  type        = string
  default     = "DataikuRDSMonitoringRole"
}


variable "rds_monitoring_interval" {
  description = "The monitoring interval"
  type        = number
  default     = 0
}


##### ROUTE 53 ###########

variable "hosted_zone_name" {
  description = "The hosted zone name"
  type        = string
  default     = "dev.dataiku.emobg.io"
}

##REDSHIFT
variable "redshift_user_name" {
  description = "The Redshift username"
  default     = "mydbuser"
}


variable "redshift_cluster_name" {
  description = "The Redshift cluster name"
  default     = "dataiku_production_db"
}


variable "redshift_node_type" {
  description = "The Redshift node type"
  type        = string
  default     = "dc2.large"
}


variable "redshift_cluster_identifier" {
  description = "The redshift identifier"
  type        = string
  default     = "dataiku-redshift-cluster"
}


variable "redshift_cluster_node_number" {
  description = "The nomber of node"
  type        = number
  default     = 1
}
