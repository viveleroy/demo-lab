terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

provider "digitalocean" {
  token = "dop_v1_056c5fcc5a6d4b7781638019b51138e160e2bc7ce4789daee3c49dbb5527732a"
}
