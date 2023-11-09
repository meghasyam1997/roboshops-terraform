terraform {
  backend "s3" {
    bucket = "terraform-megha"
    key    = "roboshops/${var.env}/terraform.tfstate"
    region = "us-east-1"
  }
}