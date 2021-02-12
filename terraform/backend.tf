terraform {
  backend "s3" {
    region = "eu-west-1"
    bucket = "insight-day-sand1-terraform"
    key = "state"
  }
}

