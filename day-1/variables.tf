variable "ami_id" {
    type = string
    default = "ami-0d176f79571d18a8f"

  
}
variable "type" {
    type = string
    default = "t2.micro"

}
variable "key_name" {
    type = string
    default = "PROJECT"
  
}
variable "subnet_id" {
    type = string
    default = "subnet-0fd1d83e82391c2a9"
  
}