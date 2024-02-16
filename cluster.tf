data "digitalocean_kubernetes_versions" "k8s_versions" {}

data "digitalocean_sizes" "node_sizes_ams" {
  filter {
    key    = "vcpus"
    values = [2]
  }

  filter {
    key    = "regions"
    values = ["ams3"]
  }

  sort {
    key       = "price_monthly"
    direction = "asc"
  }
}

module "cluster-xyz-roykliment-lab" {
  source                        = "nlamirault/doks/digitalocean"
  version                       = "1.2.0"
  cluster_name                  = "cluster-xyz-roykliment-lab"
  auto_scale                    = true
  auto_upgrade                  = true
  kubernetes_version            = data.digitalocean_kubernetes_versions.k8s_versions.latest_version
  maintenance_policy_day        = "monday"
  maintenance_policy_start_time = "03:00"
  region                        = "ams3"
  size                          = element(data.digitalocean_sizes.node_sizes_ams.sizes, 0).slug
  node_count                    = 3
}
