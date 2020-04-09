module "asg" {
  source  = "terraform-aws-modules/autoscaling/aws"
  version = "~> 3.0"


  name = var.asg_name

  # Launch configuration
  lc_name = "${var.prefix}-gbi-${var.application}-${var.env}-${var.region_trigram}-pri-asg-lc"

  image_id          = var.image_id
  instance_type     = var.instance_type
  security_groups   = [module.http_sg.this_security_group_id, module.ssh_sg.this_security_group_id]
  target_group_arns = module.alb.target_group_arns
  key_name          = module.key_pair_admin.this_key_pair_key_name

  ebs_block_device = [
    {
      device_name           = "/dev/xvdz"
      volume_type           = "gp2"
      volume_size           = "50"
      delete_on_termination = true
    },
  ]

  root_block_device = [
    {
      volume_size = "50"
      volume_type = "gp2"
    },
  ]

  # Auto scaling group
  asg_name                  = "${var.prefix}-gbi-${var.application}-${var.env}-${var.region_trigram}-pri-front-sub-asg"
  vpc_zone_identifier       = module.vpc.private_subnets
  health_check_type         = "EC2"
  min_size                  = 1
  max_size                  = 1
  desired_capacity          = 1
  wait_for_capacity_timeout = 0

  tags = [
    {
      key                 = "Env"
      value               = var.env
      propagate_at_launch = true
    },
    {
      key                 = "Name"
      value               = var.application
      propagate_at_launch = true
    },
  ]

  tags_as_map = {
    AppRole   = "Scale group"
    ManagedBy = "DevopsTeamParis"
  }
}


/*resource "aws_autoscaling_schedule" "weekday_start" {
  count                  = var.extend_during_weekdays ? 1 : 0
  scheduled_action_name  = "weekday_start"
  desired_capacity       = var.desired_capacity
  max_size               = var.max_size
  min_size               = var.min_size
  recurrence             = "0 8 * * MON-FRI"
  autoscaling_group_name = module.asg.this_autoscaling_group_id
}



resource "aws_autoscaling_schedule" "weekday_end" {
  count                  = var.extend_during_weekdays ? 1 : 0
  scheduled_action_name  = "weekday_end"
  desired_capacity       = 0
  max_size               = 0
  min_size               = 0
  recurrence             = "0 20 * * MON-FRI"
  autoscaling_group_name = module.asg.this_autoscaling_group_id
}*/
