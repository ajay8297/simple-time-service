🚀 SimpleTimeService – DevOps Challenge

Welcome to the SimpleTimeService repository! This project is part of the Particle41 DevOps Challenge. You’ll build and deploy a simple web service using Docker, Terraform, and AWS.

📌 Challenge Overview

This challenge tests your skills in:

- Building a minimalist web service
- Dockerizing the application
- Deploying using Terraform on AWS
- Following DevOps best practices
- Writing clear documentation

🧩 Challenge Breakdown

Task 1: Create & Dockerize the Microservice

You’ll create a simple web service that returns the current timestamp and IP address of the requester.

Features:

- GET / – Returns current timestamp and client IP in JSON

Example response:

{
  "timestamp": "2025-04-14T15:30:00Z",
  "ip": "127.0.0.1"
}

📦 Step 1: Clone the Repository

git clone https://github.com/your-username/simple-time-service.git
cd simple-time-service

🐳 Step 2: Build the Docker Image

docker build -t simple-time-service ./app

▶️ Step 3: Run the Docker Container

docker run -d -p 5000:5000 simple-time-service

Visit the service in your browser:

http://localhost:5000

✅ Docker Best Practices

- Minimal image size
- Runs as non-root user for security

☁️ Task 2: Deploy with Terraform on AWS

You’ll deploy the containerized app using Terraform on AWS.

Resources Created:

- VPC (2 public and 2 private subnets)
- ECS Cluster (to run the app)
- Load Balancer (to access it)
- Security Groups (for network access)

📥 Step 1: Install Requirements

- Terraform: https://www.terraform.io/downloads
- AWS CLI: https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html

Configure your AWS CLI:

aws configure

🛠️ Step 2: Deploy with Terraform

cd terraform

terraform init
terraform plan
terraform apply

Confirm with "yes" when prompted.

🌐 Access the Application

After deployment, Terraform will output the Load Balancer URL. Open that URL in your browser to access the live service.

📁 Repository Structure

simple-time-service/
├── app/
│   ├── app.py
│   ├── Dockerfile
│   └── requirements.txt
├── terraform/
│   ├── main.tf
│   └── variables.tf
└── README.md

🔒 Security Notes

- Do not commit AWS credentials
- Use IAM roles or environment variables to manage secrets securely

✅ What You’ll Demonstrate

- Build and containerize a microservice
- Use Docker and Terraform efficiently
- Deploy to AWS using infrastructure-as-code best practices

🙌 Final Tip

Once deployed, your microservice will be live and publicly accessible via the Load Balancer URL provided by Terraform.

Good luck!
