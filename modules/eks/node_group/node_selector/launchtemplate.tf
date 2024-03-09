resource "aws_launch_template" "eks_cluster_launch_config" {
  name = var.launch_template_name
  block_device_mappings {
    device_name = "/dev/xvda"
    ebs {
      volume_size = var.node_disk_size
      delete_on_termination = true
      volume_type = "gp2"
    }
  }
  user_data = base64encode(<<-EOF
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="==7561478f-5b81-4e9d-9db6-aec8f463d2ab=="


--==7561478f-5b81-4e9d-9db6-aec8f463d2ab==
Content-Type: text/x-shellscript; charset="us-ascii"


#!/bin/bash
sed -i '/^KUBELET_EXTRA_ARGS=/a KUBELET_EXTRA_ARGS+=" --register-with-taints=dedicated=app:NoSchedule --node-labels=kube/nodetype=${var.node_selector}"' /etc/eks/bootstrap.sh


--==7561478f-5b81-4e9d-9db6-aec8f463d2ab==--\
  EOF
  )
}