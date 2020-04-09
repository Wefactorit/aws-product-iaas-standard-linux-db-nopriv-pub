#ALB
output "alb" {
  description = "Everything output by the alb module"
  value       = module.alb
}




#Key pair
output "key_pair_admin" {
  description = "Everything output by the key_pair_admin module"
  value       = module.key_pair_admin
}


output "this_key_pair_fingerprint" {
  description = "The MD5 public key fingerprint as specified in section 4 of RFC 4716."
  value       = [module.key_pair_admin.this_key_pair_fingerprint]
}



# Launch configuration
output "asb" {
  description = "Everything output by the asg module"
  value       = module.asg
}


#sg
output "http_sg" {
  description = "Everything output by the http_sg module"
  value       = module.http_sg
}

output "ssh_sg" {
  description = "Everything output by the ssh_sg module"
  value       = module.ssh_sg
}


# VPC
output "vpc" {
  description = "Everything output by the vpc module"
  value       = module.vpc
}

output "nat_gateways_eips" {
  description = "The Elastic IPs of the NAT gateways in the private subnets"
  value       = aws_eip.nat[*].id
}

# Customer Gateway
output "cgw_ids" {
  description = "List of IDs of Customer Gateway"
  value       = module.vpc.cgw_ids
}

output "this_customer_gateway" {
  description = "Map of Customer Gateway attributes"
  value       = module.vpc.this_customer_gateway
}

# nlb
output "nlb" {
  description = "Everything output by the nlb module"
  value       = module.nlb
}



output "block_cidr_vpc" {
  value = module.vpc.vpc_cidr_block
}


output "rds_password" {
  value = random_string.password_rds.result
}

output "s3_app_arn" {
  value = module.app_s3_bucket.this_s3_bucket_arn
}


output "s3_app_id" {
  value = module.app_s3_bucket.this_s3_bucket_id
}




//
//# VPC endpoints
//output "vpc_endpoint_ec2_id" {
//  description = "The ID of VPC endpoint for EC2"
//  value       = "${module.vpc.vpc_endpoint_ec2_id}"
//}
//
//output "vpc_endpoint_ec2_network_interface_ids" {
//  description = "One or more network interfaces for the VPC Endpoint for EC2."
//  value = ["${module.vpc.vpc_endpoint_ec2_network_interface_ids}"]
//}
//
//output "vpc_endpoint_ec2_dns_entry" {
//  description = "The DNS entries for the VPC Endpoint for EC2."
//  value = ["${module.vpc.vpc_endpoint_ec2_dns_entry}"]
//}
