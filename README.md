# SimpleTimeService - DevOps Challenge

Welcome to the **SimpleTimeService** repository! This is a minimal microservice that returns the current timestamp and the visitor's IP address as a JSON response. The goal of this project is to assess your skills with modern DevOps tools and cloud infrastructure.

## Overview

This project involves two main tasks:

1. **Task 1**: Create a minimalist application (SimpleTimeService) and containerize it using Docker.
2. **Task 2**: Deploy this containerized application using Terraform in a cloud environment.

The instructions for both tasks are outlined below.

## Task 1: Minimalist Application Development / Docker / Kubernetes

### SimpleTimeService Microservice

The SimpleTimeService is a simple web application that:

- Returns the current **timestamp** and the **IP address** of the user.
- This application is written in Python and uses Flask for handling HTTP requests.

### Application Features

- **Endpoint**: `/`
- **Response (JSON)**:
  ```json
  {
    "timestamp": "<current date and time>",
    "ip": "<visitor's IP address>"
  }
