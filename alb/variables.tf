# --- alb / variables.tf ---

# variable "alb_sg" {}
variable "web_sg" {}
variable "public_subnets" {}
variable "web_asg" {}
variable "tg_port" {}
variable "tg_protocol" {}
variable "vpc_id" {}
variable "listener_port" {}
variable "listener_protocol" {}

variable "internal" {
  default = false
}

variable "load_balancer_type" {
  default = "application"
}