terraform {
  backend "gcs" {
    bucket = "learning-gcs-tfstate"
    prefix = "env/learning"
  }
  required_version = ">=1.9.7"
}
