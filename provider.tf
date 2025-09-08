terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 5.0"
        }
    }
}

provider "aws" {
    alias = "us"
    region = var.us_region[0]
}

provider "aws" {
    alias = "eu"
    region = var.eu_region[0]
}