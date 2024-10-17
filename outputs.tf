output "gke_cluster_master_version" {
	    value = "${google_container_cluster.gke-cluster.master_version}"
}