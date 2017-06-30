module "svc_users" {
    source = "./modules/service-automation-policies"
    name_prefix = "arch"
}

output "read_aws_access_id" {
  value = "${module.svc_users.read_aws_access_id}"
}
output "read_aws_secret_key" {
  value = "${module.svc_users.read_aws_secret_key}"
}
output "power_aws_access_id" {
  value = "${module.svc_users.power_aws_access_id}"
}
output "power_aws_secret_key" {
  value = "${module.svc_users.power_aws_secret_key}"
}


