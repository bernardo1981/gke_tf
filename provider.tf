provider "google-beta" {
  project     = "${var.project-id}"
  region      = "${var.region}"
}

resource "google_container_cluster" "gke-cluster" {
    provider            = "google-beta"
    name                = "${var.gke-name}"
    description         = "${var.description}"
    min_master_version  = "${var.gke-version}"
    zone                = "${var.gke-zone}"
    additional_zones    = ["${var.gke-additional-zones}"]

    resource_labels {
        project = "${var.project}"
	 stages  = "${var.stages}"   
    }
    node_pool {
     	 name = "default-pool"
    }

    addons_config {
        http_load_balancing {
            disabled = "${var.gke-node-lb-disabled}"
        }
        horizontal_pod_autoscaling {
            disabled = "${var.gke-node-pods-autoscaling-disabled}"
        }
        kubernetes_dashboard {
            disabled = "${var.gke-node-dashboard-disabled}"
        }
        network_policy_config {
            disabled = "${var.gke-node-network-policy-disabled}"
        }
    }

    maintenance_policy {
        daily_maintenance_window {
            start_time = "03:00"
        }  
    }

    lifecycle {
        ignore_changes = [ "node_count", "node_pool" ]
    }
}

resource "google_container_node_pool" "gke-node-pool" {
  	name       = "${var.gke-node-pool-name}"
  	cluster    = "${google_container_cluster.gke-cluster.name}"
  	zone       = "${var.gke-zone}"
 	node_count = "${var.gke-initial-node-count}"

  	autoscaling {
		min_node_count = "${var.gke-autoscaling-min}"
		max_node_count = "${var.gke-autoscaling-max}"
	}

	management {
		auto_repair  = "${var.gke-node-auto-repair-enabled}"
	 	auto_upgrade = "${var.gke-node-auto-upgrade-enabled}"
	}

       node_config {
		disk_size_gb = "${var.gke-node-disk-size}"
		disk_type    = "${var.gke-node-disk-type}"
		image_type   = "${var.gke-node-image}"
		machine_type = "${var.gke-node-machine-type}"
		preemptible  = "${var.gke-node-preemtible-enabled}"
		oauth_scopes = [
			"https://www.googleapis.com/auth/compute",
			"https://www.googleapis.com/auth/devstorage.read_only",
			"https://www.googleapis.com/auth/logging.write",
			"https://www.googleapis.com/auth/monitoring",
		]

		labels {
			project = "${var.project_name}"
			stages  = "${var.stages}"
		}
'
		tags = ["k8s"]	
	}
}