# README for Python Flask CI/CD Project

Welcome to my Python Flask CI/CD learning project!

This repository is a personal endeavor, aimed at exploring and
showcasing foundational DevOps skills through practical
application. It is not intended for production use but rather serves
as a sandbox for learning and demonstrating proper coding practices,
including Infrastructure as Code (IaC) principles and continuous
integration/continuous deployment (CI/CD) techniques.

## Project Overview
This project features a simple Flask application, integrated into a fully automated CI/CD pipeline. Key components include:

- **Flask**: A lightweight web framework for Python, serving as the backbone of the application.
- **Jenkins**: Orchestrates the CI/CD pipeline, ensuring code is tested and deployed seamlessly.
- **Ansible**: Manages configuration and deployment, ensuring environments are consistently set up.
- **Terraform**: Provisions infrastructure in a declarative manner, allowing for easy replication and scalability.

## Key Features
- **Continuous Integration**: Automated testing and code validation through Jenkins.
- **Continuous Deployment**: Seamless deployment of updates to the Flask application.
- **Infrastructure as Code**: Use of Terraform and Ansible to manage infrastructure and configurations.

## Getting Started
To get started with this project, follow these steps:

1. **Clone the repository**:
   ```bash
   git clone https://github.com/Ignacy-s/python-flask-cicd.git
   cd python-flask-cicd
   ```
2.  **Set up your environment**:
    Ensure you have Python, Ansible, Terraform, and Jenkins installed on your machine.

3.  **Run the application**:
    Follow the instructions in the Makefile to set up and run the Flask application locally.

4.  **Deploy using Jenkins**:
    Set up a Jenkins server and use the provided Jenkinsfile to automate testing and deployment.

## Project Structure

    app/: Contains the Flask application code.
    ansible/: Playbooks and roles for configuring servers and deploying the application.
    terraform/: Infrastructure as Code scripts for provisioning resources.
    jenkins/: Configuration as Code files for setting up Jenkins jobs and pipelines.

## Journal

Throughout this project, I am maintaining a coding journal to document my learning journey, challenges faced, and solutions discovered. This journal is available in the docs/ directory.
Contributing

As this is a personal learning yourney, contributions are not actively sought. However, feedback and suggestions are always welcome!
License

This project is licensed under the MIT License.

Embark on this journey with me as I delve into the intricacies of DevOps, exploring the intersection of development and operations with hands-on experimentation and continuous learning.

Happy coding!

Ignacy
