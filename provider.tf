variable "access_key" {}
variable "secret_key" {}
variable "region" {
  default = "croc"
}

terraform {
  required_providers {
    aws        = {
      source  = "hc-registry.website.cloud.croc.ru/c2devel/croccloud"
      version = "4.14.0-CROC7"
    }
    ct          = {
      source  = "tf-registry.nyansq.ru/poseidon/ct"
      version = "0.13.0"
    }
  }
}

provider "aws" {
  endpoints {
    ec2 = "https://api.cloud.croc.ru"
    elbv2 = "https://elb.cloud.croc.ru"
  }

  # NOTE: STS API is not implemented, skip validation
  skip_credentials_validation = true

  # NOTE: IAM API is not implemented, skip validation
  skip_requesting_account_id = true

  # NOTE: Region has different name, skip validation
  skip_region_validation = true

  access_key = var.access_key
  secret_key = var.secret_key
  region     = var.region
}

provider "ct" {}

