## Task 2 - Terraform and Cloud: Infrastructure to Host Container

For Task 2, you will create the necessary infrastructure to host the SimpleTimeService container using Terraform. The infrastructure will be deployed to AWS (or equivalent cloud provider).

### Steps to Complete Task 2

1. **Create a VPC with subnets:**
   - Set up a VPC with 2 public subnets and 2 private subnets.

2. **Create ECS/EKS Cluster:**
   - Deploy an ECS/EKS cluster within the VPC to manage containerized applications.

3. **Set up ECS Task/Service:**
   - Create ECS/EKS task/service resources to run the container in the private subnets.

4. **Set up Load Balancer:**
   - Deploy a load balancer in the public subnets to provide access to the application.

5. **Use Terraform:**
   - Use Terraform to create the infrastructure and deploy the application. You can utilize modules from the Terraform registry for VPC and EKS if desired.

6. **Push your code to a public Git repository:**
   - Push the Terraform configuration and other relevant files to a public Git repository.

### Commands to Deploy Infrastructure

- To plan the infrastructure:
terraform plan



- To apply and create the infrastructure:
terraform apply



### Authentication

- You must authenticate with AWS to deploy the infrastructure. Do not commit any AWS credentials to the repository. Provide instructions in the README for configuring AWS credentials.

### Recommended Directory Structure
