terraform {
  backend "s3" {
    bucket = "terraformxxxx"
    key    = "dev/terraform.tfstate"
    region = "eu-north-1"
  }
}
