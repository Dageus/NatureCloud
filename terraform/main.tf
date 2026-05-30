module "networking" {
  source = "./modules/networking"

  vpc_cidr            = "10.0.0.0/16"
  public_subnet_cidr  = "10.0.1.0/24"
  private_subnet_cidr = "10.0.2.0/24"
  region              = "us-east-1"
}

module "security" {
  source = "./modules/security"

  vpc_id = module.networking.vpc_id
}

module "compute" {
  source = "./modules/compute"

  vpc_id            = module.networking.vpc_id
  public_subnet_id  = module.networking.public_subnet_id
  private_subnet_id = module.networking.private_subnet_id

  instance_type     = var.instance_type

  lb_sg_id          = module.security.lb_sg_id
  worker_sg_id      = module.security.worker_sg_id

  placement_group   = "cluster"

  app_version = var.app_version
}
