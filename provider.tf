provider "aws" {
  access_key = var.AWS_ACCESS_KEY
  secret_key = var.AWS_SECRET_KEY
  region     = var.AWS_REGION
  # It will be good to use profile rather than access_key and secret_key
}

