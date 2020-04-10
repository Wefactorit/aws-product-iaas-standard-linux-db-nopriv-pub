module "dataiku_s3_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"

  bucket = "${var.prefix}-gba-${var.application}-${var.env}-inf-s3"
  acl    = "private"

  versioning = {
    enabled = true
  }
}



module "app_s3_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"

  bucket = "${var.prefix}-gba-${var.application}-${var.env}-app-s3"
  acl    = "private"

  versioning = {
    enabled = true
  }
}
