terraform {
  backend "s3" {
    bucket = "terraformstatefiledevendra"
    key = "terraform.tfstate"
    region = "ap-south-1"
  }
}