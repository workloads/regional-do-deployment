resource "random_id" "id" {
  byte_length = 8
}

resource "digitalocean_spaces_bucket" "this" {
  for_each = local.regions

  name   = "workloads-${each.value}-${random_id.id.hex}"
  region = each.value == "lon1" ? "ams3" : each.value == "tor1" ? "nyc3" : each.value == "nyc1" ? "nyc3" : each.value == "blr1" ? "syd1" : each.value
  acl    = "public-read"
}

resource "digitalocean_spaces_bucket_cors_configuration" "this" {
  for_each = local.regions

  bucket = digitalocean_spaces_bucket.this["${each.value}"].name
  region = each.value == "lon1" ? "ams3" : each.value == "tor1" ? "nyc3" : each.value == "nyc1" ? "nyc3" : each.value == "blr1" ? "syd1" : each.value

  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["GET"]
    allowed_origins = ["*"]
    max_age_seconds = 3000
  }

  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["PUT", "POST", "DELETE"]
    allowed_origins = ["https://${each.value}.workloads.${var.domain}"]
    max_age_seconds = 3000
  }
}

resource "digitalocean_spaces_bucket_policy" "this" { 
  for_each = local.regions

  region = each.value == "lon1" ? "ams3" : each.value == "tor1" ? "nyc3" : each.value == "nyc1" ? "nyc3" : each.value == "blr1" ? "syd1" : each.value
  bucket = digitalocean_spaces_bucket.this["${each.value}"].name
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Sid" : "IPAllow",
        "Effect" : "Deny",
        "Principal" : "*",
        "Action" : "s3:*",
        "Resource" : [
          "arn:aws:s3:::${digitalocean_spaces_bucket.this["${each.value}"].name}",
          "arn:aws:s3:::${digitalocean_spaces_bucket.this["${each.value}"].name}/*"
        ],
        "Condition" : {
          "NotIpAddress" : {
            "aws:SourceIp" : "${local.spaces_ip_range}"
          }
        }
      }
    ]
  })
}