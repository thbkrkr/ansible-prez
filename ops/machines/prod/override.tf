resource "openstack_compute_instance_v2" "front" {
  name = "prod-front-${count.index + 1}"
  count = 1
  metadata {
    group = "front"
  }
}

resource "openstack_compute_instance_v2" "ha-api" {
  name = "prod-ha-api-${count.index + 1}"
  count = 1
  metadata {
    group = "ha-api"
  }
}

resource "openstack_compute_instance_v2" "api" {
  name = "prod-api-${count.index + 1}"
  count = 2
  metadata {
    group = "api"
  }
}
