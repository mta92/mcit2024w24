variable "octobereleven"{
    type=string
    default="11"
}
variable "octobertwelve"{
    type=string
    default="12"
}
output "octobertogether"{
   value="${var.octobereleven}+${var.octobertwelve}"
}
