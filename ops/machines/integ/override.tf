resource "openstack_compute_instance_v2" "front" {
  name = "integ-front-${count.index + 1}"
  count = 1
  metadata {
    group = "front"
  }
}

resource "openstack_compute_instance_v2" "ha-api" {
  name = "integ-ha-api-${count.index + 1}"
  count = 1
  metadata {
    group = "ha-api"
  }
}

resource "openstack_compute_instance_v2" "api" {
  name = "integ-api-${count.index + 1}"
  count = 1
  metadata {
    group = "api"
  }
}
