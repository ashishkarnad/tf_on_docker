variable "owner" {
    type = string
    default = "ashish"
}

variable "purpose" {
    type = list(string)
    default = ["prod", "uat", "dev", "qa"]
    }

variable us_region {
    type = list(string)
    default = ["us-east-1","us-west-1","us-east-2", "us-west-2"]
} 

variable eu_region {
    type = list(string)
    default = ["eu-west-1","eu-west-2","eu-west-3","eu-central-1","eu-north-1"]
}

variable "ami" {
    default = "ami-020cba7c55df1f615"  # This is an example AMI ID, replace with your desired AMI
    type = string
}

variable "insttype" {
    default = "t2.micro"
    type = string
  
}
variable "cidrsub" {
    default = "22.0.0.0/16"
    type = string
}