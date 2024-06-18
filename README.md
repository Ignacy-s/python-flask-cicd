# Python Flask CI/CD Project

Welcome to my Python Flask CI/CD learning project!

This repository is a personal endeavor, aimed at exploring and
showcasing foundational DevOps skills through practical
application.

Links to Coding Journal and mini documentation:
[Project's journal](project_journal/flask-ci-cd-journal.md).
[Project's plan](project_plan/flask-ci-cd-plan.md).

It will (hopefully) show some degree of familiarity with:
- Linux Administration
- RedHat family systems
- Ansible
- Bash
- Terraform
- AWS
- Docker
- Jenkins
- CI/CD


It is not intended for production use but rather serves
as a sandbox for learning and demonstrating proper coding practices,
including Infrastructure as Code (IaC) principles and continuous
integration/continuous deployment (CI/CD) techniques.

## Project Overview
This project features a simple Flask application, integrated into a fully automated CI/CD pipeline. To simplify the usage of Jenkins, project is separated into two repositories. The one you're browsing right now (python-flask-cicd) is dedicated to the deployment and provisioning of a Jenkins server. The other repo (python-flask-cicd-code) is dedicated to the Flask application and code required for it's CI/CD (Jenkinsfiles, Terraform for container deployment). Key components include:

- **Jenkins**: Orchestrates the CI/CD pipeline, ensuring code is tested and deployed seamlessly.
- **Ansible**: Manages configuration and deployment of the Jenkins server, ensuring consistent set up.
- **Terraform**: Provisions infrastructure and deploys containers in a declarative manner, allowing for easy replication and scalability.

## Key Features
- **Continuous Integration**: Automated building of docker images with the application through Jenkins.
- **Continuous Deployment**: Seamless deployment of updates to the Flask application into the AWS cloud.
- **Infrastructure as Code**: Use of Terraform, Ansible and Jenkinsfiles to manage infrastructure and configurations.


## WIP: Getting Started
Warning: playtrough.sh script is not ready, so you're not getting
started.  
To get started with this project, follow these steps:

1. **Clone the repository**:
   ```bash
   git clone https://github.com/Ignacy-s/python-flask-cicd.git
   cd python-flask-cicd
   ```
2.  **Set up your environment**:
    Ensure you have Python, Ansible, Terraform, and AWS-cli installed on your machine.

3.  **Run the application**:
    Change into the app's main directory, and run the 'playtrough.sh' script.
    ```bash
    cd python-flask-cicd
    ./playtrough.sh
    ```
4.  **Follow the instructions in the script**
    The script will take you trough:
    1. creating a LUKS encrypted vault (and it's password),
    2. generating an ssh key and uploading it to AWS,
    3. using Terraform for provisioning cloud infrastructure required
       for the project (both the EC2 instance and Networking, as the
       project's not using default VPC and Subnets),
    4. configuring the Jenkins server with Ansible and Jenkins
       configuration as Code (JCasC), so it's already set up with all
       required plugins and observing the repo with Flask code and
       Jenkinsfile pipelines

## Project Structure

### python-flask-cicd (Jenkins server repo):

    playtrough.sh: equivalent of the main function of a program
    script that takes the user on a journey trough the project, asking
    for required info and running functions and scripts in the required order.
    ansible/: playbook for configuration of the Jenkins server
    (including installation of plugins and the CI/CD pipeline setup).
    bin/: scripts used in the project (and helper scripts)
    helper scripts that make the development easier (if I found myself
    doing something repeatedly, I'd put it in a script) and scripts
    used by playtrough.sh to run the project.
    blog-tf-subnet-setup/: code used in a Terraform subnet tutorial
    As learning of basics of Terraform network provisioning was part
    of the project, I just put the code here instead of creating a
    separate project.
    .flask-ci-cd-project-root-marker: an empty file
    It's used to avoid bombing things on the user's system if the
    project was not started in it's root directory.
    project_documentation/: contains the .org file with project's plan
    project_journal/: contains project's journal
    Thanks to commiting journal notes along with code, it's easy to
    understand thinking behind past decisions or how some actions were performed.
    terraform/: IaC scripts for Jenkins server & AWS VPC
    provisioning resources of the Jenkins server and the VPC used for
    the project (but not the deployment of the Flask app)
    vagrant/: vagrant machines for Ansible playbook testing
    Vagrantfile's for provisioning of the machines used for
    testing. Much cheaper and faster to locally test the parts of the
    projects that can be tested locally.
    vault:/ vault for ssh keys and secrets
    To avoid having potentially dangerous secrets just laying
    around unencrypted. To be replaced with a Hashicorp's Vault at
    some point (or never).
    vault.img: encrypted vault's image

### python-flask-cicd-code (Flask app & CI/CD Pipeline repo):

    app.py/: application code
    The Flask app is as simple as possible, not much to see there.
    Dockerfile: instructions on how to build the app image.
    .dockerignore: like .gitignore but for docker
    Didn't know about it before this project. Had to find a way to
    stop Docker from pulling all the unnecessary files inside the
    image and exploding it's size.
    Jenkinsfile: defines the Jenkins pipeline
    This way our CI/CD setup is version controlled along with the
    application code. Another bonus is that we can easily move our
    pipeline between Jenkins servers.
    push-image-jenkinsless.sh: test image upload w/o Jenkins
    Image pushing part of the project was done before the Jenkins
    pipeline was ready.
    terraform/: terraform scripts for CD
    The scripts to create image repository and deploy the image onto
    ECS
    requirements.txt: required by the Flask app.


## Journal

Throughout this project, I am maintaining a coding journal to document
my learning journey, challenges faced, and solutions discovered. This
journal is available in the project_journal directory. *A less actual
version (and fully actual once I get a git hook working) is available [here](projects\_journal/flask-ci-cd-journal.md).*


### Contributing

As this is a personal learning yourney, contributions are not actively sought. However, feedback and suggestions are always welcome!

### License

This project is licensed under the MIT License.

>Embark on this journey with me as I delve into the intricacies of DevOps, exploring the intersection of development and operations with hands-on experimentation and continuous learning.

Happy coding!

Ignacy
