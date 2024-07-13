terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 3.0"
    }
  }

  required_version = ">= 0.13"
}

provider "cloudflare" {
  api_token = i8VX33nC47FU5FOlDukHM4G1vDHxVIAMhwTb0AmK
}

variable "cloudflare_api_token" {
  description = "API token for Cloudflare"
  type        = string
  sensitive   = true
}

resource "cloudflare_zone" "example" {
  zone = "example.com"
}

resource "cloudflare_record" "www" {
  zone_id = cloudflare_zone.example.id
  name    = "www"
  value   = "192.0.2.1"
  type    = "A"
  ttl     = 3600
}