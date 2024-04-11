# Web Application Deployment Module

This Terraform module deploys a web application in AWS following a scalable and secure design.

## Usage

1. Set the required variables in `main.tf`.
2. Run `terraform init` to initialize the working directory.
3. Run `terraform plan` to view the execution plan.
4. Run `terraform apply` to apply the changes.

## Inputs

- `vpc_cidr_block`: CIDR block for the VPC.
- `vpc_name`: Name for the VPC.
- `lb_name`: Name for the load balancer.
- `lb_internal`: Whether the load balancer is internal or external.
- `image_id`: ID of the AMI to use for instances.
- `instance_type`: Instance type for the instances in the ASG.
- `min_size`: Minimum size of the ASG.
- `max_size`: Maximum size of the ASG.
- `desired_capacity`: Desired capacity of the ASG.
- `root_volume_size`: Size of the root volume (in GB).
- `secondary_volumes`: List of secondary volumes.
- `example_var`: Example variable for Ansible configuration.
- `domain_name`: Domain name for the certificate.

## Outputs

- `load_balancer_dns_name`: DNS name of the load balancer.
- `asg_name`: Name of the Auto Scaling Group.
- `ansible_instance_id` (if applicable): ID of the instance configured with Ansible.
- `certificate_arn` (if applicable): ARN of the created certificate.

## Notes

- Make sure to configure other aspects of the web application deployment such as listeners, target groups, etc., as needed.
