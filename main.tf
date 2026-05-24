resource "google_container_cluster" "mycluster" {
    name               = "mycluster"
    location           = "us-central1-a"
    initial_node_count = 3
    
    node_config {
        machine_type = "e2-medium"
    }
}
