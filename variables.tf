
## 
# Variables
##

variable "location" {
    type = string
    default = "westeurope"
}

variable "naming_prefix" {
  type    = string
  default = "mp-tf"
}

variable "tag_environment" {
  type    = string
  default = "test"
}

variable "tag_owner" {
  type    = string
  default = "martin.prazak"
}


