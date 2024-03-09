terraform {
  backend "s3" {
    bucket         = "jtuberquia-challenge"
    key            = "certificate-jtuberquia.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "cc-tfstate"
  }
}