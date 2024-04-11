
terraform {
  required_version = "1.2.3"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.67"
    }
    null = {
      source  = "hashicorp/null"
      version = "3.2.1"
    }
  }
}
