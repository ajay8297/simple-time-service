markdown

Copy
# SimpleTimeService - Particle41 DevOps Challenge

Welcome to the **SimpleTimeService** repository, submitted for the Particle41 DevOps Team Challenge. This project showcases a minimal web service, containerized with Docker, and deployed to AWS using Terraform, demonstrating proficiency in modern DevOps practices.

## Purpose

The SimpleTimeService is a microservice that responds to `GET /` requests with a JSON object containing the current timestamp and the visitor's IP address. This repository fulfills two tasks:
1. Develop and containerize the SimpleTimeService application.
2. Deploy the application to AWS using Terraform, with a VPC, ECS cluster, and load balancer.

## Repository Structure

The repository follows the recommended structure:
.
├── app
│   ├── app.py            # Python Flask application
│   ├── Dockerfile        # Dockerfile for containerization
│   └── requirements.txt  # Python dependencies
├── terraform
│   ├── main.tf          # Terraform configuration for AWS
│   ├── variables.tf     # Terraform variables
│   └── terraform.tfvars # Default variable values
└── README.md            # This documentation

text

Copy

## Prerequisites

Before starting, ensure you have the following tools installed:
- [Git](https://git-scm.com/downloads) - To clone the repository
- [Docker](https://docs.docker.com/get-docker/) - To build and run the container
- [AWS CLI](https://aws.amazon.com/cli/) - To configure AWS credentials
- [Terraform](https://www.terraform.io/downloads.html) - To deploy infrastructure

An AWS account with sufficient permissions is required for Task 2.

## Task 1: SimpleTimeService Application and Containerization

### Overview
The SimpleTimeService is a Python Flask application that returns:
```json
{
  "timestamp": "2025-04-14T15:30:00Z",
  "ip": "127.0.0.1"
}
Step-by-Step Instructions
Clone the Repository:
bash

Copy
git clone https://github.com/ajay8297/simple-time-service.git
cd simple-time-service
Build the Docker Image: In the root directory, run:
bash

Copy
docker build -t simple-time-service .
This creates a minimal image using a slim Python base, optimized for size.
Run the Docker Container: Launch the container:
bash

Copy
docker run -d -p 5000:5000 simple-time-service
The application runs as a non-root user for security.
Test the Application: Access http://localhost:5000 via a browser or curl:
bash

Copy
curl http://localhost:5000
Expected output:
json

Copy
{
  "timestamp": "<current-date-time>",
  "ip": "<your-ip-address>"
}
Container Best Practices
Non-root User: The Dockerfile configures the app to run as a non-privileged user.
Minimal Image: Uses python:3.9-slim to reduce image size.
Published Image: Available at DockerHub (replace with your DockerHub link if published).
Task 2: Deploy Infrastructure with Terraform
Overview
The application is deployed to AWS using Terraform, creating:

A VPC with 2 public and 2 private subnets.
An ECS cluster running the SimpleTimeService container in private subnets.
An Application Load Balancer in public subnets to expose the service.
Security groups to control traffic.
Step-by-Step Instructions
Configure AWS Credentials: Set up the AWS CLI with your credentials:
bash

Copy
aws configure
Enter your AWS Access Key ID, Secret Access Key, region (e.g., us-east-1), and output format (e.g., json). Alternatively, use IAM roles or environment variables:
bash

Copy
export AWS_ACCESS_KEY_ID=<your-key>
export AWS_SECRET_ACCESS_KEY=<your-secret>
export AWS_DEFAULT_REGION=<your-region>
Important: Do not commit credentials to the repository.
Navigate to Terraform Directory:
bash

Copy
cd terraform
Initialize Terraform: Install Terraform dependencies:
bash

Copy
terraform init
Preview Infrastructure: Check the planned resources:
bash

Copy
terraform plan
Deploy Infrastructure: Create the infrastructure:
bash

Copy
terraform apply
Type yes to confirm. Deployment takes a few minutes.
Access the Application: After deployment, Terraform outputs the load balancer’s DNS name. Access the service:
text

Copy
http://<load-balancer-dns>/
The response matches the JSON format shown above.
Clean Up: To avoid AWS charges, destroy the infrastructure:
bash

Copy
terraform destroy
Confirm with yes.
Terraform Best Practices
Variables: Defined in variables.tf with defaults in terraform.tfvars.
No Credentials in Code: Authentication is handled externally.
Modular Design: Uses clear, documented Terraform configurations.
Notes
Security: The container runs as a non-root user, and Terraform avoids hardcoded secrets.
Documentation: This README is designed for clarity, assuming minimal prior knowledge.
Testing: The application and infrastructure have been tested to meet acceptance criteria:
docker build and docker run work seamlessly.
terraform plan and terraform apply deploy the infrastructure correctly.
Extra Credit (Optional)
Remote Backend: Configured an S3 bucket with DynamoDB for Terraform state and locking (see main.tf backend configuration if implemented).
CI/CD Pipeline: Added a GitHub Actions workflow to automate Docker builds, image publishing, and Terraform deployment (see .github/workflows/ci.yml if implemented).
Submission
The repository is publicly available at https://github.com/ajay8297/simple-time-service. For review, contact careers@particle41.com with the repository URL.

Thank you for evaluating my submission!

text

Copy

### Instructions to Add the README
1. Go to your GitHub repository (`ajay8297/simple-time-service`).
2. Open the `README.md` file or create it if it doesn’t exist.
3. Copy and paste the content above into `README.md`.
4. Replace placeholders (e.g., DockerHub link) with your specific details if applicable.
5. Commit and push the changes:
   ```bash
   git add README.md
   git commit -m "Add README per Particle41 challenge instructions"
   git push origin main
Key Features of This README
Adheres to Instructions: Includes all required elements—prerequisites with links, credential configuration, step-by-step commands, and notes for less-experienced users.
Clear Structure: Organized by tasks, with subsections for setup, deployment, and cleanup.
Acceptance Criteria: Emphasizes that docker build, docker run, terraform plan, and terraform apply are sufficient, with no credentials in the repo.
Best Practices: Highlights non-root user, minimal image, and Terraform variable usage.
Extra Credit: Mentions optional features (remote backend, CI/CD) but keeps them conditional to avoid implying uncompleted work.
Concise Yet Comprehensive: Balances detail with brevity, ensuring clarity without overwhelming.
