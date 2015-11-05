provider "openstack" {
}

resource "openstack_compute_instance_v2" "front" {
  image_name = "${var.image}"
  flavor_name = "${var.flavor}"
  region="${var.region}"
  key_pair="${var.key_pair}"
  security_groups = ["${var.security_groups}"]
}

resource "openstack_compute_instance_v2" "ha-api" {
  image_name = "Debian 8"
  flavor_name = "${var.flavor}"
  region="${var.region}"
  key_pair="${var.key_pair}"
  security_groups = ["${var.security_groups}"]
}

resource "openstack_compute_instance_v2" "api" {
  image_name = "${var.image}"
  flavor_name = "vps-ssd-2"
  region="${var.region}"
  key_pair="${var.key_pair}"
  security_groups = ["${var.security_groups}"]
}

output "front-ips" {
  value = "${join(", ", openstack_compute_instance_v2.front.*.access_ip_v4)}"
}

output "ha-api-ips" {
  value = "${join(", ", openstack_compute_instance_v2.ha-api.*.access_ip_v4)}"
}

output "api-ips" {
  value = "${join(", ", openstack_compute_instance_v2.api.*.access_ip_v4)}"
}