variable "region" {
  type    = string
  default = "us-east-1"
}

variable "instance_type" {
  type = string
  description = "Instance type according to AWS available machines"
  default = "t3.medium"
}

variable "app_version" {
  type = string
  description = "Target version of the app"
  default = "latest"
}
