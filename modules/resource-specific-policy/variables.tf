


variable "tag_name" {
	default = "Owner"
	description = "The name of the tag used to filter out instances"
}
variable "tag_value" {

	description = "What value must it be"

}

variable "username"{
	description = "The name for a logical service user"
}
variable "region" {
	description = "What region is this restriction for"
}