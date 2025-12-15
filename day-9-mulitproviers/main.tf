resource "aws_s3_bucket" "mumbai" {
    bucket = "asdfghjklxcvbn"

}

resource "aws_s3_bucket" "us" {
    bucket = "xcvbnmsdfghj"
    provider = aws.devops
}
