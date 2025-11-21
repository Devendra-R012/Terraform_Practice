terraform {
  backend "s3" {
    bucket = "terraformstatefiledeve"
    key = "terraform.tfstate"
    region = "ap-south-1"
  }
}