terraform {
  backend "s3" {
    bucket         = "jtuberquia-challenge"
    key            = "dev/devsu.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "cc-tfstate"
  }
}