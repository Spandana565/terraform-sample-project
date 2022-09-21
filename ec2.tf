resource "aws_instance" "jenkins" {
  ami             = "${var.amazon_ami}"
  instance_type   = "${var.linux_instance_type}"
  security_groups = [aws_security_group.web_traffic.id]
  key_name        = "${var.key_name}"
  subnet_id      = "${var.subnet_id}"
  
  provisioner "remote-exec" {
      inline = [
        "sudo yum update -y",
        "sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo",
        "sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key",
        "sudo yum upgrade -y",
        "sudo amazon-linux-extras install java-openjdk11 -y",
        "sudo yum install jenkins -y",
        "sudo systemctl enable jenkins",
        "sudo systemctl start jenkins",
        "sudo systemctl status jenkins",
        "sudo amazon-linux-extras enable ansible2",
        "sudo yum install -y ansible",       
      ]
  }

  provisioner "file" {
    source      = "playbook.yaml"
    destination = "/tmp/playbook.yaml"
  }

  provisioner "remote-exec" {
      inline = [
        "ansible-playbook /tmp/playbook.yaml",
      ]
  }

  connection {
      type        = "ssh"
      host        = self.public_ip
      user        = "${var.linux_username}"
      private_key = file("${var.key_file_path}")
    }
    
    
  
  tags = {
      "Name" = "${var.linux_hostname}"
  }
  volume_tags = {
      "Name" = "${var.linux_hostname}"
  }
}  
  