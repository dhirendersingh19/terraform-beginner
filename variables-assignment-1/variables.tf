variable "username"{
    type = string
    default = "admin"
}

variable "password"{
    type = string
    default = "secret"
}

variable "url"{
    type = string
    default = "http://192.168.0.187/identity"
}

variable imageid{
    type = string
    default = "89cf64eb-98b5-4fdd-b39e-bb7364f1feef"
}

variable tags{
    type = map
    default = {
    this = "that",
    "demo" = "data"
  }
}