# SimpleTimeService - DevOps Challenge

Welcome to the **SimpleTimeService** repository! This repository is part of the **Particle41 DevOps Challenge**. The goal is to evaluate your skills with modern development and operations tools.

## Overview

This challenge is designed to assess your abilities in:

- Software development (by creating a minimalist web service).
- Docker and containerization (by packaging the application in a Docker container).
- Public Cloud services and Infrastructure as Code (IaC) using Terraform.
- Deploying infrastructure in the cloud (AWS, GCP, Azure).
- Writing clear and thorough documentation for your work.

This challenge is divided into two parts:

1. **Task 1**: Create and Dockerize a microservice (`SimpleTimeService`).
2. **Task 2**: Deploy the containerized application using Terraform in a cloud environment.

## Task 1: Minimalist Application Development / Docker / Kubernetes

### SimpleTimeService Microservice

The `SimpleTimeService` microservice is a simple web service that responds with the current timestamp and the IP address of the visitor in JSON format.

#### Example Response:
```json
{
  "timestamp": "2025-04-14T15:30:00Z",
  "ip": "127.0.0.1"
}
Features:
GET /: Returns the current date, time, and visitor’s IP address.

Dockerizing the Application
Dockerfile: A Dockerfile is included for containerizing the application.

Non-root User: The container runs as a non-root user for security.

Steps to Build and Run Locally
Clone the repository:

bash
Copy
Edit
git clone https://github.com/your-username/simple-time-service.git
cd simple-time-service
Build the Docker image: In the root directory of the repository, run:

bash
Copy
Edit
docker build -t simple-time-service .
Run the Docker container: After building the image, run the container:

bash
Copy
Edit
docker run -d -p 5000:5000 simple-time-service
Access the service: Once the container is running, visit http://localhost:5000 to see the JSON response, which should look like this:

json
Copy
Edit
{
  "timestamp": "2025-04-14T15:30:00Z",
  "ip": "127.0.0.1"
}
Docker Best Practices
Minimal image size: The image is optimized to be as small as possible.

Non-root user: The application runs inside the container as a non-root user for security purposes.

Containerizing the Application
The Dockerfile ensures the application is containerized and follows container best practices.

The container is built with the command:

bash
Copy
Edit
docker build -t simple-time-service .
The container can be run using:

bash
Copy
Edit
docker run -d -p 5000:5000 simple-time-service
Task 2: Infrastructure Deployment using Terraform
Cloud Infrastructure
The application will be deployed using AWS services through Terraform.

Resources to be Created:
VPC: A Virtual Private Cloud with 2 public and 2 private subnets.

ECS Cluster: Elastic Container Service (ECS) cluster to host the container.

Load Balancer: A load balancer in the public subnets for accessing the service.

Security Groups: Security groups to control the traffic flow.

Deploying the Infrastructure
Install Terraform: Download and install Terraform from Terraform's official website.

Configure AWS CLI: Make sure you have the AWS CLI installed and configured:

bash
Copy
Edit
aws configure
Initialize Terraform: Inside the terraform directory, initialize Terraform:

bash
Copy
Edit
terraform init
Plan the Infrastructure: Run the following command to see the changes Terraform will apply:

bash
Copy
Edit
terraform plan
Apply the Plan: Apply the plan to create the infrastructure:

bash
Copy
Edit
terraform apply
Access the Application: Once the infrastructure is deployed, the application will be accessible via the load balancer's public IP address.

Important Notes:
Ensure you do not commit any AWS credentials or sensitive information to the repository.

The Terraform files include the necessary configuration for deploying the application on AWS.

Repository Structure
The repository is organized as follows:

bash
Copy
Edit
.
├── app
│   ├── app.py          # SimpleTimeService application code
│   ├── Dockerfile      # Dockerfile to containerize the app
│   └── requirements.txt # Python dependencies
├── terraform
│   ├── main.tf         # Terraform configuration for infrastructure
│   └── variables.tf    # Variables for Terraform configuration
└── README.md           # This README file
Authentication
Ensure that your AWS credentials are properly configured before deploying the infrastructure.

Use IAM roles or environment variables to securely manage credentials.

Conclusion
This repository contains everything needed to build, deploy, and run the SimpleTimeService application. The two tasks showcase your ability to:

Develop a simple microservice and containerize it using Docker.

Deploy the application in the cloud using Terraform and AWS.

Once the infrastructure is deployed, the application will be available via a public load balancer in the cloud.

Thank you for completing this DevOps challenge! Feel free to reach out if you have any questions.

yaml
Copy
Edit

---

### Instructions to Add:

1. Copy the content above.
2. Go to your GitHub repository.
3. Open the `README.md` file or create one if it doesn't exist.
4. Paste the content into the `README.md` file.
5. Commit and push the changes.

This will provide clear and complete instructions on how to build, deploy, and run the **SimpleTimeServ
