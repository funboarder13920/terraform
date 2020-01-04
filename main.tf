# Provider and backend definitions

provider "aws" {
  region = "eu-west-2"
}

# us-east-1 provider for CloudFront certificates
provider "aws" {
  region = "us-east-1"
  alias  = "ue1"
}

data "aws_caller_identity" "current" {
}
