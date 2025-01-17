
az1                           = "us-east-1a"
az2                           = "us-east-1b"
vpc-cidrblock                 = "10.0.0.0/16"
public-subnet-cidr_block-az1  = "10.0.1.0/24"
public-subnet-cidr_block-az2  = "10.0.2.0/24"
private-subnet-cidr_block-az1 = "10.0.3.0/24"
private-subnet-cidr_block-az2 = "10.0.5.0/24"
internet_cidr                 = "0.0.0.0/0"
subnet_ids                    = ["private-subnet-az1, private-subnet-az2"]