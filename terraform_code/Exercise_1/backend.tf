terraform {
    backend "s3" {
        bucket = "terraformstateversioning"
        key = "tf-demo/terraform.tfstate" 
        region = "us-east-1"
    }
}