#module "dataiku_s3_bucket" {
#  source = "terraform-aws-modules/s3-bucket/aws"

#  bucket = "emobg-gba-dataiku-dev-inf-s3"
#  acl    = "private"

#  versioning = {
#    enabled = true
#  }
#}



module "app_s3_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"

  bucket = "${var.env}-gba-${var.application}-${var.env}-app-s3"
  acl    = "private"

  versioning = {
    enabled = true
  }
}
