module "ec2_nexus" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "3.3.0"
  # insert the required variables here
  name                   = "${local.name}-nexus"
  ami                    = "ami-0dfcb1ef8550277af"
  instance_type          = "t2.medium"
  key_name               = "jan_30"
  #monitoring             = true
  subnet_id              = module.vpc.public_subnets[0]
  vpc_security_group_ids = [module.public_nexus_sg.security_group_id]
  #tags = local.common_tags
user_data = "${file("nexus.sh")}"
}
