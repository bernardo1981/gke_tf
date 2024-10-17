mkidir modules/grafana
cd modules/grafana
vim main.tf
provider "grafana" {
  url  = "${var.grafana-url}"
  auth = "${var.grafana-auth}"
}
resource "grafana_dashboard" "metrics" {
  config_json = "${file("${var.grafana-dashboard-json}")}"
}
vim variables.tf
variable "grafana-url" {
  type          = "string"
  description   = "Grafana URL"
  default       = "http://grafana.example.com"
}

variable "grafana-auth" {
  type          = "string"
  description   = "Grafana API Token"
  default       = "api-key"
}

variable "grafana-dashboard-json" {
  type          = "string"
  description   = "Grafana Dashboard JSON"
  default       = "grafana.json"
}
cd ../../
vim  grafana.tf
module "grafana" {
	source                      = "./modules/grafana"
	grafana-url			= "http://grafana.example.com"
	grafana-auth			= "API KEY"
	grafana-dashboard-json 	= "grafana.json"
}
terraform init
terraform apply
