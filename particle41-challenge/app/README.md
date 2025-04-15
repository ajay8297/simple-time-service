Task 1 - Minimalist Application Development / Docker

This task requires you to build a minimalist microservice called SimpleTimeService that returns the current UTC timestamp and the requester's IP address in JSON format. The service must be containerized using Docker and follow best practices such as running as a non-root user. The final image must be published to a public container registry, and the code pushed to a public repository.

Expected JSON Response Format

{
  "timestamp": "",
  "ip": ""
}

Steps to Complete Task 1

1. Clone the Repository

Clone the project repository and navigate to the application directory.

2. Add Application Code

Create a simple microservice that starts a web server and returns the current timestamp and requester's IP in JSON format when the root URL (/) is accessed.

3. Add Requirements File

Create a file listing your project dependencies (such as Flask if using Python).

4. Add Dockerfile

Write a Dockerfile to containerize your application. Follow best practices:
- Use a minimal base image
- Run as a non-root user
- Expose the correct port

5. Build the Docker Image

Use Docker to build your container image with a single command.

6. Run the Container

Use Docker to run your container locally, mapping the container port to a local port (e.g., 5000).

7. Test the Service Locally

Access the service using a browser or a tool like curl. It should return the expected JSON structure with the correct timestamp and IP address.

8. Publish the Docker Image

Tag and push your built Docker image to a public container registry such as Docker Hub.

9. Push Code to Public Git Repository

Push your application code, Dockerfile, and documentation to a public Git repository (e.g., GitHub, GitLab, or Bitbucket).

Recommended Directory Structure

simple-time-service/
├── app/
│   ├── app.py
│   ├── requirements.txt
│   └── Dockerfile
└── README.md

 
