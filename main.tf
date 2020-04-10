provider "aws" {
  region = "eu-west-3"
  assume_role {
    role_arn = "arn:aws:iam::0000000000:role/OrganizationAccountAccessRole"
  }
}

terraform {
  backend "s3" {
    role_arn = "arn:aws:iam::00000000000:role/OrganizationAccountAccessRole"
    encrypt  = false
    bucket   = "prd-tf-state"
    region   = "eu-west-3"
    key      = "terraform/terraform.tfstate"
  }
}
