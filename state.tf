terraform {
  backend "s3" {
    bucket = "terraform-megha"
    key    = "roboshops/dev/terraform.tfstate"
    region = "us-east-1"
  }
}