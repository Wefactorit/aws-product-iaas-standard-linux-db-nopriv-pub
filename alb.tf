module "alb" {

  source  = "terraform-aws-modules/alb/aws"
  version = "~> 5.0"
  name    = "${var.application}-${var.env}-${var.region_trigram}-pub-alb"


  load_balancer_type = "application"

  vpc_id          = module.vpc.vpc_id
  security_groups = [module.http_sg.this_security_group_id]
  subnets         = module.vpc.public_subnets
  internal        = false

  //  # See notes in README (ref: https://github.com/terraform-providers/terraform-provider-aws/issues/7987)
  //  access_logs = {
  //    bucket = module.log_bucket.this_s3_bucket_id
  //  }

  http_tcp_listeners = [
    {
      port               = var.alb_frontend_port
      protocol           = "HTTP"
      target_group_index = 0
    },
  ]

  #https_listeners = [
  #  {
  #    port = 443
  #    protocol = "HTTPS"
  #    certificate_arn = module.acm.this_acm_certificate_arn
  #    target_group_index = 1
  #  },
  #]
  target_groups = [
    {
      name_prefix          = var.application
      backend_protocol     = "HTTP"
      backend_port         = var.alb_backend_port
      target_type          = "instance"
      deregistration_delay = 10
      health_check = {
        enabled             = true
        interval            = 30
        path                = "/"
        port                = "traffic-port"
        healthy_threshold   = 3
        unhealthy_threshold = 3
        timeout             = 6
        protocol            = "HTTP"
        matcher             = "200-399"
      }
    },

  ]

}
