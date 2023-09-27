resource "digitalocean_database_cluster" "this" {
  for_each = local.regions

  name       = "workloads-${each.value}-postgres-cluster"
  engine     = "pg"
  version    = "14"
  size       = var.db_size
  region     = each.value
  node_count = 1
  tags       = local.tags
}

resource "digitalocean_database_firewall" "this" {
  for_each = local.regions

  cluster_id = digitalocean_database_cluster.this["${each.value}"].id

  rule {
    type  = "tag"
    value = "workloads"
  }
}