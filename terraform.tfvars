
az1                           = "us-east-1a"
az2                           = "us-east-1b"
vpc-cidrblock                 = "10.0.0.0/16"
public-subnet-cidr_block-az1  = "10.0.1.0/24"
public-subnet-cidr_block-az2  = "10.0.2.0/24"
private-subnet-cidr_block-az1 = "10.0.3.0/24"
private-subnet-cidr_block-az2 = "10.0.5.0/24"
internet_cidr                 = "0.0.0.0/0"
subnet_ids                    = ["private-subnet-az1, private-subnet-az2"]
client_cidr_block             = "10.10.0.0/22"
server-certificatecert-arn    = "arn:aws:acm:us-east-1:783764574627:certificate/7efc1c9f-d629-4ef8-9592-7268d4ef9537"
root-certificate-arn  = "arn:aws:acm:us-east-1:783764574627:certificate/340f2843-7953-4a3e-8740-182be1e6f21d"