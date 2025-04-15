## Task 1 - Minimalist Application Development / Docker

This task requires you to build a minimalist microservice called **SimpleTimeService** that returns the current UTC timestamp and the requester's IP address in JSON format. The service must be containerized using Docker and follow best practices such as running as a non-root user. The final image must be published to a public container registry, and the code pushed to a public repository.

### Expected JSON response format

{ "timestamp": "", "ip": "" }


### Steps to complete Task 1

**1. Clone the repository**

Clone the project repository and navigate to the application directory.

**2. Add application code**

Create a simple web service that returns the current UTC timestamp and requester's IP address in JSON format when the root URL (`/`) is accessed.

**3. Add requirements file**

Create a `requirements.txt` file listing your project dependencies.

**4. Add Dockerfile**

Write a Dockerfile to containerize the application. Ensure the image is minimal, runs as a non-root user, and exposes the correct port.

**5. Build the Docker image**

Use the following command to build the image:

docker build -t simple-time-service .


**6. Run the container**

Run the container and map it to a local port:

docker run -d -p 5000:5000 simple-time-service



**7. Test the service locally**

Visit `http://localhost:5000` in your browser or use curl:

curl http://localhost:5000


You should receive a JSON response containing the current UTC timestamp and your IP address.

**8. Publish the Docker image**

Tag and push your image to a public container registry:

docker tag simple-time-service your-dockerhub-username/simple-time-service docker push your-dockerhub-username/simple-time-service



**9. Push code to a public git repository**

Push the application code, Dockerfile, and README to a public Git repository (GitHub, GitLab, Bitbucket, etc.).

