terraform {
  backend "s3" {
    bucket         = "jtuberquia-challenge"
    key            = "policy/circleci.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "cc-tfstate"
  }
}