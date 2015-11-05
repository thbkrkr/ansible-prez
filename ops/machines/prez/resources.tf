provider "openstack" {
}

resource "openstack_compute_instance_v2" "prez" {
  name = "prez"
  image_name = "Ubuntu 14.04"
  flavor_name = "vps-ssd-1"
  region="GRA1"
  key_pair="admin-demo"
  security_groups = ["default"]
}