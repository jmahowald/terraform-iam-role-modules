

This is a collection of userful terraform module that will create iam policies and service users

Please see the summodules for details on the variables

* [Service Automation Policies ](./modules/service-automation-policies/README.md) Creates policies and users to have seperate create, delete, update roles
* [Instance Resource Specific Policies](./modules/resource-specific-policy/README.md) Creates policies that allow the ability to terminate, stop, start instances that match a particulare tag value
* [Bucket Reader](./modules/bucket-reader/README.md) Allow for reads of a bucket
