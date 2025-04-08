locals {
  master_plan = csvdecode(file("${path.module}/master_plan_v3.2.csv"))
}
