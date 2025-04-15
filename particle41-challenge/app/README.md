Task 1 - Minimalist Application Development / Docker

This task requires you to build a minimalist microservice called SimpleTimeService that returns the current UTC timestamp and the requester's IP address in JSON format. The service must be containerized using Docker and follow best practices such as running as a non-root user. The final image must be published to a public container registry, and the code pushed to a public repository.

Expected JSON Response Format

{
  "timestamp": "<current date and time>",
  "ip": "<the IP address of the visitor>"
}

Steps to Complete Task 1

1. Clone the repository

git clone https://github.com/your-username/simple-time-service.git
cd simple-time-service/app

2. Add application code (app.py)

3. Add requirements.txt

flask

4. Add Dockerfile

5. Build the Docker image

docker build -t simple-time-service .

6. Run the container

docker run -d -p 5000:5000 simple-time-service

7. Test the service locally

Open http://localhost:5000 in your browser or use curl:

curl http://localhost:5000

You should receive a JSON response with the current UTC timestamp and your IP address.

8. Publish the Docker image

docker tag simple-time-service your-dockerhub-username/simple-time-service
docker push your-dockerhub-username/simple-time-service

9. Push your code to a public Git repository

Your directory structure should look like this:

simple-time-service/
├── app/
│   ├── app.py
│   ├── requirements.txt
│   └── Dockerfile
└── README.md
