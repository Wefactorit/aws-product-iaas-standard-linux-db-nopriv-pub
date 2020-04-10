######### common_name

variable "prefix" {
  description = "The defined prefix to build pattern "
  default     = ""
}


variable "region_trigram" {
  description = "The region trigram to build pattern"
  default     = ""
}


variable "region" {
  description = "The region name"
  default     = ""
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


#ALB

variable "alb_frontend_port" {
  description = "The listener frontend port"
  type        = number
}

variable "alb_backend_port" {
  description = "The backend port"
  type        = number
}

#NLB

variable "nlb_frontend_port" {
  description = "The listener frontend port"
  type        = number
}

variable "nlb_backend_port" {
  description = "The backend port"
  type        = number
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
  default     = "db-ha"
}
variable "database_name" {
  description = "The postgres RDS database name"
  type        = string
  default     = "rdsinstance"
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
  default     = "asg-name"
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
  default     = "RDSMonitoringRole"
}


variable "rds_monitoring_interval" {
  description = "The monitoring interval"
  type        = number
  default     = 0
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
  default     = "redshift-cluster"
}


variable "redshift_cluster_node_number" {
  description = "The nomber of node"
  type        = number
  default     = 1
}


######## security group ##############


variable "auto_ingress_rules" {
  description = "List of ingress rules to add automatically"
  type        = list(string)
  default     = ["http-80-tcp"]
}




variable "ingress_rules" {
  description = "List of ingress rules to create by name"
  type        = list(string)
  default     = []
}
