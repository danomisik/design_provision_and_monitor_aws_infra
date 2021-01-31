# TODO: Define the variable for aws_region
variable "region" {
  type    = string
  description = "Region where will be lambda deployed."
  default = "us-east-1"
}