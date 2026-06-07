terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.2"
    }
  }
}

provider "docker" {
  # Usualmente en Windows no requiere parámetros si Docker Desktop está corriendo de forma nativa
}

resource "docker_container" "nginx" {
  name  = "terraform-nginx"
  image = "nginx:latest"
  
  ports {
    internal = 80
    external = 8081
  }
}