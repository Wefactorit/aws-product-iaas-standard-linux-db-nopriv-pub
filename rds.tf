
resource "random_string" "password_rds" {
  length  = 15
  special = false
  number  = true
}

module "db" {
  source                              = "terraform-aws-modules/rds/aws"
  version                             = "~> 2.0"
  identifier                          = var.rds_identifier
  engine                              = var.rds_engine
  engine_version                      = var.rds_engine_version
  instance_class                      = var.rds_instance_class
  allocated_storage                   = var.rds_instance_storage
  storage_encrypted                   = var.rds_encrypted
  iops                                = var.rds_sio1_iops
  storage_type                        = var.rds_storage_type
  name                                = var.database_name
  username                            = var.database_username
  password                            = random_string.password_rds.result
  port                                = var.database_rds_port
  iam_database_authentication_enabled = false
  vpc_security_group_ids              = [module.rds_sg.this_security_group_id]
  maintenance_window                  = var.maintenance_window_rds
  backup_window                       = var.backup_windows_rds
  backup_retention_period             = var.rds_backup_retention_period
  # Enhanced Monitoring - see example for details on how to create the role
  # by yourself, in case you don't want to create it automatically
  monitoring_interval    = var.rds_monitoring_interval
  monitoring_role_name   = var.rds_monioring_role
  create_monitoring_role = true
  # DB parameter group
  family = var.rds_family_instance
  # DB option group
  major_engine_version = var.rds_major_version
  tags = {
    Environment = var.env
    Name        = "${var.application}-db-ha"
  }
  # DB subnet group
  create_db_subnet_group = true
  subnet_ids             = module.vpc.database_subnets

  # Snapshot name upon DB deletion
  final_snapshot_identifier = var.database_name

  # Database Deletion Protection
  deletion_protection = false
}
