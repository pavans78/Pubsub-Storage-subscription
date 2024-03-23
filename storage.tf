resource "google_storage_bucket" "storage" {
  for_each                    = var.storage
  name                        = each.value.name
  location                    = each.value.location
  uniform_bucket_level_access = each.value.uniform_bucket_level_access
}
