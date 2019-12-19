/*Connect to AWS*/
provider "aws" {
  region                  = "us-east-1"
  shared_credentials_file = "/Users/roja/.aws/credentials"
  profile                 = "roja"
}