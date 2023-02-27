module "ec2_sonar" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "3.3.0"
  # insert the required variables here
  name                   = "${local.name}-sonar"
  ami                    = "ami-0263e4deb427da90e"
  instance_type          = "t2.medium"
  key_name               = "jan_30"
  #monitoring             = true
  subnet_id              = module.vpc.public_subnets[0]
  vpc_security_group_ids = [module.public_sonar_sg.security_group_id]
  #tags = local.common_tags

  user_data = "${file("sonar.sh")}"

}
