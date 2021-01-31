terraform {
    backend "s3" {
        bucket = "terraformstateversioning"
        key = "tf-demo2/terraform.tfstate" 
        region = "us-east-1"
    }
}