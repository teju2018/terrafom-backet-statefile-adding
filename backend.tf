terraform {
  backend "gcs" {
    bucket = "teju2018"
    prefix = "vm-harness/statefile"
  }
}
