variable "unit_prefix" {
    type = string
}

variable "vpc_id" {
    type = string
}

variable "region" {
    type = string
}

variable "instance_size" {
    type = string
    default = "t3.large"
}

variable "key_pair" {
    type = string
}

variable "subnet_id" {
    type = string
}

variable "instance_profile_id" {
    type = string
}

variable "mysql_host" {
    type = string
}

variable "mysql_user" {
    type = string
}

variable "mysql_pass" {
    type = string
}

variable "mysql_database" {
    type = string
}

variable "aws_kms_key_id" {
    type = string
}

variable "region" {
    type = string
}

variable "s3_bucket_id" {
    type = string
}

variable "vault_dl_url" {
    type = string
    default = "https://releases.hashicorp.com/vault/1.8.3/vault_1.8.3_linux_amd64.zip"
}

variable "vault_license_key" {
    type = string
    default = ""
}

variable "consul_dl_url" {
    type = string
    default = "https://releases.hashicorp.com/consul/1.10.3/consul_1.10.3_linux_amd64.zip"
}

variable "consul_license_key" {
    type = string
    default = ""
}

variable "consul_join_key" {
    type = string
}

variable "consul_join_value" {
    type = string
}

variable "nomad_dl_url" {
    type = string
    default = "https://releases.hashicorp.com/nomad/1.1.5/nomad_1.1.5_linux_amd64.zip"
}

variable "nomad_license_key" {
    type = string
    default = ""
}

variable "ctemplate_dl_url" {
    type = string
    default = "https://releases.hashicorp.com/consul-template/0.27.1/consul-template_0.27.1_linux_amd64.zip"
}

variable "table_product_id" {
    type = string
}

variable "table_cart_id" {
    type = string
}

variable "table_order_id" {
    type = string
}

variable "git_branch" {
    type = string
    default = "main"
}

variable "ldap_pass" {
    type = string
}
