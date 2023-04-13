# Get Availability Zones
resource "tls_private_key" "key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Generate a Private Key and encode it as PEM.
resource "aws_key_pair" "key_pair" {
  key_name   = "key"
  public_key = tls_private_key.key.public_key_openssh

  provisioner "local-exec" {
    command = "echo '${tls_private_key.key.private_key_pem}' > ./key.pem"
  }
}


#resource "aws_s3_bucket_object" "private_key" {
#  bucket = "qwerty12345asdfg"
#  key    = "key.pem"
#  content = tls_private_key.key.private_key_pem
#}

# Create a EC2 Instance (Ubuntu 20)
resource "aws_instance" "example" {
  instance_type          = "t2.micro" # free instance
  ami                    = "ami-007855ac798b5175e"
  key_name               = aws_key_pair.key_pair.id
  vpc_security_group_ids = [var.public_sg]
  subnet_id              = var.public_subnet

  tags = {
    Name = "demo ec2"
  }

  user_data ="${file("userdata.sh")}"
      #!/bin/sh
#      sudo apt-get update
#      sudo apt install -y apache2
#      sudo systemctl status apache2
#      sudo systemctl start apache2
#      sudo chown -R $USER:$USER /var/www/html
#      sudo echo "<html><body><h1>Hello sir <br> HO GYA  </h1></body></html>" > /var/www/html/index.html
#      EOF

  root_block_device {
    volume_size = 20
  }
}

# Create and assosiate an Elastic IP
resource "aws_eip" "eip" {
  instance = aws_instance.example.id
}

