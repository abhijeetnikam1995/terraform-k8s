module "ec2_jen" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "3.3.0"
  # insert the required variables here
  name                   = "${local.name}-Jenkins"
  ami                    = "ami-09cd747c78a9add63"
  instance_type          = "t2.small"
  key_name               = "jan_30"
  #monitoring             = true
  subnet_id              = module.vpc.public_subnets[0]
  vpc_security_group_ids = [module.public_jen_sg.security_group_id]
  #tags = local.common_tags
 user_data = "${file("jenkins.sh")}"

}
