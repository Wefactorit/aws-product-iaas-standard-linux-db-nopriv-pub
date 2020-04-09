

resource "aws_eip" "this" {
  count = 1
  vpc   = true
}


module "nlb" {
  source             = "terraform-aws-modules/alb/aws"
  version            = "~> 5.0"
  name               = "${var.application}-${var.env}-${var.region_trigram}-pub-nlb"
  load_balancer_type = "network"
  vpc_id             = module.vpc.vpc_id
  internal           = false
  //  Use `subnets` if you don't want to attach EIPs
  subnets = module.vpc.public_subnets
  #subnet_mapping = [for i, eip in aws_eip.this : { allocation_id : eip.id, subnet_id : tolist(module.vpc.private_subnets)[i] }]
  // TCP_UDP, UDP, TCP
  http_tcp_listeners = [
    {
      port               = var.nlb_frontend_port
      protocol           = "TCP"
      target_group_index = 0
    },

  ]



  target_groups = [
    {
      name_prefix      = var.application
      backend_protocol = "TCP"
      backend_port     = var.nlb_backend_port
      target_type      = "instance"
    },

  ]



}
