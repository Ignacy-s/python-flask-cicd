
# Table of Contents

1.  [Fork the simple Python Flask web application.](#orgb63518b)
    1.  [Exploring tutor's choice of the app. Reading about Corey Schafer on his blog, https://coreyms.com](#org5f3ac9d)
    2.  [Download the repository contents with curl.](#org5ac3b48)
    3.  [Created a new repository, copied contents of the first chapter from Flask<sub>Blog</sub> tutorial.](#orgc053cfa)
2.  [Create a separate repository for Jenkins provisioning, installation, and configuration.](#org4c362f4)
3.  [Set up Jenkins part 1: setting up a VM on AWS using Terraform.](#org5ecf9b9)
    1.  [Create a data source that gets the AMI of the latest Alma Linux 9](#org7c741d0)
    2.  [Create a base main.tf file that is a copy from the Terraform Up and Running code. Also add an alternative version that was given as an example of Jenkins setup on AWS.](#org2631337)
    3.  [Add definitions for basic VPC and subnet](#orgc47bfde)
    4.  [Modify the basic security group definition to allow incoming traffic on ports 22 (for SSH) and 8080 (Jenkins web app)](#org60b9994)
    5.  [Move some values to variables to make code cleaner and reusable or usable by people who choose to use different AWS region](#org3c9f4f3)
        1.  [Move the port values to a variable and use variables instead.](#org6106b49)
        2.  [Move the EC2 instance type to a variable (eu-north-1 region requires usage of a non standard t3 type server)](#org4127cd0)
        3.  [Move the region name to a variable.](#org12a7bfe)
    6.  [Create a script to create and open/close LUKS container (which can hold the SSH key).](#org699109c)
    7.  [Write out pseudocode for a script that would execute the whole project.](#org681a3c7)
    8.  [Put the initial steps (vault creation, SSH key generation and uploading and Jenkins VM spin up) into the playtrough script.](#orge4c1f08)
        1.  [1: Vault creation - done](#org2543b6c)
        2.  [2: SSH key generation - done](#org569e843)
        3.  [3: SSH key uploading & VM spin up - need to finish some things first:](#org14b3f08)
    9.  [Had some issues with creating a VM accessible from the outside. Followed a blog article tutorial and succeeded, need to take what I learned there and put it in my Terraform code.](#orgbc32b99)
        1.  [Planning:](#orgf9e1ef0)
        2.  [Create a file for VPC](#org393ef92)
        3.  [Create a file for Public Subnet](#orgc63a382)
        4.  [Create a file for Internet Gateway](#org46be271)
        5.  [Create a file for the Route Table for the Public Subnet](#orgde2201c)
        6.  [Create a file for the Security Group](#org6914c4d)
        7.  [Create a file for the Public EC2 Instance](#orge2bf1f5)
        8.  [Create a variable file](#org064b352)
        9.  [Creating a NAT with an Elastic IP - what I'm not going to do.](#orgae69e1d)
        10. [Run and see if it works](#org63088a2)
        11. [Find the differences](#orgbb3d915)
        12. [Add them to flask-ci-cd Terraform code.](#org501d9bf)
    10. [](#org4151391)
        1.  [Temporarily solved by having Terraform update Ansible's inventory file on each execution of 'terraform apply'.](#org9d65e05)
        2.  [We can keep some kind of state file there so that Terraform, Ansible and later Jenkins can communicate with each other or find out details on how to run the project.](#org3767742)
        3.  [File will be in bash, so that it can be sourced to read all the variables into memory.](#org1dc0f15)
        4.  [To protect the secrets, a trap will be added to playtrough.sh script so that on script exit, the vault can be locked again.](#org80b3a63)
        5.  [Since vault starts as empty, we need to check if it(file with secrets)'s there and generate the file if it doesn't exist yet.](#orgb349e30)
4.  [Set up Jenkins part 2: install Jenkins using Ansible.](#org26c1a65)
    1.  [Find good instructions on how to install Jenkins in it's documentation or from some other credible source](#orgd7e44ed)
        1.  [https://www.jenkins.io/doc/book/installing/linux/#fedora](#org482e88b)
    2.  [Create a Vagrant VM for local tests/development of the Jenkins playbook](#orgd226b62)
        1.  [Reinstalled Vagrant because of libvirt plugin issues](#org0b871d5)
        2.  [Installed & enabled libvirt and vagrant-libvirt plugin](#orgdbe60f1)
        3.  [Downloaded Alma Linux 9 vagrant box](#orgdc8c04f)
        4.  [Modified the default Vagrantfile based on previous projects (hostname, IP address, RAM)](#org2c9e2d0)
        5.  [Start an Apache server on the Vagrant machine to make sure everything works](#org5cd24ad)
    3.  [Create a bash script or pseudocode script with the instructions listed in order.](#org53f9af1)
        1.  [Here are instructions from the Jenkins docs for installation on Fedora.](#orgd34d3d8)
        2.  [Here is a script to configure firewalld (RedHat family firewall service), also from Jenkins docs](#org52d74fd)
    4.  [Test if these scripts/instructions work on a local Vagrant VM](#org375a064)
        1.  [All this works and installs](#orgd043313)
    5.  [Create a playbook based on the instructions](#org73db5e7)
    6.  [Debug the playbook until it deploys a working Jenkins server](#org9c48493)
        1.  [There were issues with nearly each task in this short playbook. The way Ansible tasks are defined is very similar to bash, but it's not identical. I've also made a YAML newbie mistake of supplying a one-element list instead of a string.](#org31591aa)
5.  [Part 3: Create a Jenkinsfile in the Flask web application repository](#org5879659)
    1.  [Improve the python-flask-cicd-code repository so that it can output a docker image](#org9a52695)
        1.  [Can't copy all files inside the repo onto the docker image, but found a solution - .dockerignore](#org9f4f089)
        2.  [Some issues with dependencies resolved by unpinning the dependencies](#org9fbb656)
        3.  [Writing a simple Flask Hello World with help of ChatGPT](#orgf3d73e5)
    2.  [Test, debug and make sure it works when run manually](#org46bfa37)
    3.  [Manually upload the docker image either to AWS or Dockerhub](#org0e13e0d)
    4.  [Describe the process in a declarative Jenkinsfile, automating the process of docker image creation in a manually setup Jenkins](#orgad29a92)
        1.  [First prepare the Jenkins server to use docker](#org889e448)
        2.  [Write a pipeline file (Jenkinsfile) based on web tutorials](#orgb4c9290)
    5.  [Update Ansible playbook knowing what was missing from the server:](#org7100e6b)
        1.  [Summary: How do I need to modify my Ansible playbook?](#org67a8b20)
        2.  [Install repo: https://download.docker.com/linux/centos/docker-ce.repo](#orgab0f821)
        3.  [Remove packages:](#org5ecd769)
        4.  [Install packages:](#org88f4978)
        5.  [Add jenkins user to docker group, !! jenkins service shouldn't be started before jenkins is added to the docker group !!](#org182597a)
        6.  [Start and enable the docker.service](#org74a0e75)
6.  [Part 4: Deploy the Flask web application to ECS Fargate](#orge216675)
    1.  [Choose a deployment method: Decided to use AWS ECS with Fargate which is a very straightforward method of deploying a docker container to the cloud](#org91038b4)
    2.  [Read up documentation and tutorials:](#org160c9cf)
        1.  [AWS Docs: Building a serverless Jenkins environment on AWS Fargate https://aws.amazon.com/blogs/devops/building-a-serverless-jenkins-environment-on-aws-fargate/](#org31f2642)
        2.  [Summary:](#orgd209930)
    3.  [Deploy a hello-world to ECS Fargate without Terraform](#org1d7c402)
        1.  [Fulfill requirements](#orgac5334f)
    4.  [Read enough ECS docs to know how to deploy to cloud using AWS CLI](#org5facc8c)
    5.  [Upload Docker image to ECR](#orgfdd63a2)
        1.  [Find out how to push to ECR with Docker/AWS CLI](#org7d38c53)
        2.  [Test the code on a local machine. Part 1: Create an ECR repo with Terraform](#org8712e35)
        3.  [Test the code on a local machine. Part 2: Push the image to the repo with Docker](#orgf6fb730)
        4.  [Note that the playbook will have to be updated (with AWS CLI and jq installation)](#org60c6835)
        5.  [Playbook should also install Terraform](#org4d20bf9)
        6.  [Test the code again, on a newly provisioned machine](#org6f5e534)
    6.  [Write Terraform code that deploys to the cloud, not worrying about secrets and permissions at first](#orge15339a)
        1.  [Write a Task Definition](#org77ae45b)
        2.  [Read on ECS module for Terraform](#org48654b4)
        3.  [Write Terraform code deploying container to ECS](#orgb4f9c55)
    7.  [Put the Terraform code in a Jenkinsfile, maybe create few more steps, so that it's easier to see where exactly is the pipeline execution. Also use more descriptive names for steps, like 'Build Docker Image' instead of just 'Build'.](#org673f907)
    8.  [Test, debug and make sure it works with a manually set up Jenkins server](#org4af9ce7)
    9.  [Find out what needs to be done to use AWS permissions and secret store to give the least permissions required to have Jenkins auto deploy the container to ECS Fargate](#org35b222d)
    10. [Automate the deployment of the app when a new version of Dockerfile appears](#org89e001a)
    11. [Test, debug and make sure it works](#orgb82f50e)
7.  [Part 5: Configure Jenkins using JCasC](#org04ad8a8)
    1.  [Find some good sources on Jenkins as Code](#org8bbb0cc)
        1.  [Found both in Unix/Linux SysAdmin's Handbook (ULSAH):](#orgd83d0e4)
    2.  [Manually configure Jenkins](#org429b16d)
    3.  [(Mistake - can't install plugins this way) Update the Ansible playbook for Jenkins installation to include the JCasC plugin](#org3a8d405)
        1.  [It wasn't easy because installing a plugin automatically on a new Jenkins installation can be challenging.](#org028aa9b)
        2.  [It seems that the most straightforward method would be to download the JCasC plugin on the Ansible host and then have Ansible push it to the server once it's up.](#orgb3dbd4e)
        3.  [Ansible's 'wait<sub>for</sub>' module waits for a port to open when an application starts up.](#orgbd76c3a)
        4.  [Got the JCasC plugin and it's dependencies packed neatly inside a .tgz file in the /jenkins<sub>config</sub> directory](#org5305607)
    4.  [Install a Jenkins plugin from a command line (without Ansible)](#org4f80bdc)
    5.  [Update playbook to install the JCasC plugin with Jenkins CLI](#orge84429a)
    6.  [Export the configuration in the JCasC format and create a new JCasC configuration based on that export](#org175bbbe)
    7.  [Modify the Ansible playbook to place the configuration file on the Jenkins server](#orgaba63b9)
    8.  [Test, debug and make sure it works](#org20989f5)
8.  [Part 6: Fully automate whole Jenkins deployment, configuration and pipeline setup using the 'playtrough.sh'](#orgb852f28)
9.  [TODO's (non mission-critical):](#org4b2f26b)
    1.  [Create a secret's file in the vault, as described here in part 1 of the project.](#org719cf5d)
    2.  [vault<sub>management.sh</sub> (low priority, because using Hashicorp's Vault will make this script obsolete):](#org1b06d87)
        1.  [Vault management script could detect if container is already created/closed/open and not report an error if container state is already as requested.](#org3585f82)
        2.  [Add an option to destroy the existing vault.](#org995f056)
    3.  [playtrough.sh](#orgca50670)
        1.  [If the variables in the vault are not set, interview the user about required project details at the beginning of the script.](#org7fec6c1)
        2.  [Both sub points can be achieved checking for presence of a dotfile.](#org5892382)
        3.  [Get password from a file or source other than user's input.](#orgd8fd8ef)
        4.  [Mention the opt-in to the Alma Linux AMI in playtrough.sh](#orgad65387)
    4.  [Ansible (Jenkins server configuration):](#orgc5c138c)
        1.  [Check aws binary version to avoid reinstalling the same version](#org040d5bd)
        2.  [Refactor /bin downloading task in the playbook to not say "changed" on each run](#org8598808)
    5.  [Making the project more presentable (on GitHub) - emacs-org to markdown export](#org0d9ed8e)
        1.  [Create a project's README](#orgf47e214)
        2.  [Quick-fix - manually generate a .html and link it in README](#orgf32c330)
        3.  [Find a way to export .org to .html headlessly](#org5acb2f4)
        4.  [Decide where exactly to attach the hook](#org9289337)
        5.  [Add the hook](#org5baadfd)
        6.  [Add links to auto-generated .html files in the project README](#org81f6435)
        7.  [Think of edge cases, tidy things up](#org7639dad)
10. [Mistakes:](#orgc9c3d8d)
    1.  [Terraform:](#orgd6ca99e)
        1.  [Encapsulated a variable reference in double quotes, making it a literal string (effectively) turning off the reference mechanism.](#org8aefc44)
    2.  [Using 'firewall-cmd' command without the '&#x2013;permanent' option](#org3f5928d)
    3.  [Ansible](#org20185f7)
        1.  [Defining variables for a group in Ansible's hosts.ini outside [GROUPNAME:vars] subsection (forgetting the ':vars' modificator)](#org00a308e)
        2.  [Using a shell builtin with ansible command module - only the shell module has bash builtins.](#org53ba485)
    4.  [Not refactoring the plan often enough. As we go deeper into the project, we gain knowledge and experience. In the light of newfound knowledge, the old plan becomes obsolete and should be replaced with more refined new plan. It doesn't mean that I was stupid by making the wrong plan in the beginning. Acting incompetently is the only way to gain competence to start acting competently.](#orga0fe576)
    5.  [Not reading up enough of previous documentation when coming back to project after a break. This led to duplicate work and thinking that the current task is more complicated than it was, in effect causing a longer delay in the project.](#org8ea0ad9)
    6.  [Jenkins:](#orgd933dec)
        1.  [Tried to configure Jenkins the same way I once configured Icinga server in an automatic deployment - by dropping in configuration files from a preconfigured working server. Instead I should've looked for a more classic solution.](#org842997a)
11. [Extras:](#org6f1b48c)
    1.  [Following a Jenkins Tutorial to learn how to make pipelines based on Jenkinsfiles](#orgda26a3c)
        1.  [Set the goal: Jenkinsfile building my docker image and hosting it on ECS Fargate](#org94ecdc4)
        2.  [Starting with tutorial titled "How to Use Jenkins to Build and Run an Image Using Docker"](#orgf7b1c45)
        3.  [Preparing the Jenkins Controller Instance to also server as a Docker building agent (manually for now, but later need to modify the ansible and eventually JCasC configuration):](#org5437860)
        4.  [Writing the Jenkinsfile:](#org024dd35)
        5.  [Fixing agent to 'any' to allow building on the Jenkins controller](#org87d9b51)
        6.  [Installing git](#org8a16c6c)

This is a simple CI/CD project to showcase my skills in &#x2026;.

It's aim is for someone to be able to download this repository and run it
himself to create a working CI/CD pipeline in AWS based on Jenkins
that deploys a container with a flask web app to AWS each time a
commit is made to the tracked flask app repository. 


<a id="orgb63518b"></a>

# DONE Fork the simple Python Flask web application.


<a id="org5f3ac9d"></a>

## Exploring tutor's choice of the app. Reading about Corey Schafer on his blog, <https://coreyms.com>

This app was committed as a whole, with several distinct stages. I'm
going to use the stages as basis of separate commits for testing of
the pipeline and in the beginning only commit the first stage.


<a id="org5ac3b48"></a>

## Download the repository contents with curl.

    curl -L
    http://github.com/CoreyMSchafer/code_snippets/archive/master.tar.gz |
    tar zxf -


<a id="orgc053cfa"></a>

## Created a new repository, copied contents of the first chapter from Flask<sub>Blog</sub> tutorial.

Flask Blog code found at [this address](https://github.com/CoreyMSchafer/code_snippets/tree/master/Python/Flask_Blog).
Copied .gitignore from the CI/CD repo, but added the name of directory
with the original Corey's repo files, so they wont all get committed
at once.


<a id="org4c362f4"></a>

# DONE Create a separate repository for Jenkins provisioning, installation, and configuration.


<a id="org5ecf9b9"></a>

# DONE Set up Jenkins part 1: setting up a VM on AWS using Terraform.


<a id="org7c741d0"></a>

## Create a data source that gets the AMI of the latest Alma Linux 9


<a id="org2631337"></a>

## Create a base main.tf file that is a copy from the Terraform Up and Running code. Also add an alternative version that was given as an example of Jenkins setup on AWS.


<a id="orgc47bfde"></a>

## Add definitions for basic VPC and subnet


<a id="org60b9994"></a>

## Modify the basic security group definition to allow incoming traffic on ports 22 (for SSH) and 8080 (Jenkins web app)


<a id="org3c9f4f3"></a>

## Move some values to variables to make code cleaner and reusable or usable by people who choose to use different AWS region


<a id="org6106b49"></a>

### Move the port values to a variable and use variables instead.


<a id="org4127cd0"></a>

### Move the EC2 instance type to a variable (eu-north-1 region requires usage of a non standard t3 type server)


<a id="org12a7bfe"></a>

### Move the region name to a variable.


<a id="org699109c"></a>

## Create a script to create and open/close LUKS container (which can hold the SSH key).


<a id="org681a3c7"></a>

## Write out pseudocode for a script that would execute the whole project.


<a id="orge4c1f08"></a>

## Put the initial steps (vault creation, SSH key generation and uploading and Jenkins VM spin up) into the playtrough script.


<a id="org2543b6c"></a>

### 1: Vault creation - done


<a id="org569e843"></a>

### 2: SSH key generation - done


<a id="org14b3f08"></a>

### 3: SSH key uploading & VM spin up - need to finish some things first:

1.  Find a way to make the EC2 instance accessible from the internet (can't access it now if I'm creating my own subnet)

2.  Find a way to pass the IP address of the EC2 instance to Ansible


<a id="orgbc32b99"></a>

## Had some issues with creating a VM accessible from the outside. Followed a blog article tutorial and succeeded, need to take what I learned there and put it in my Terraform code.

Following instructions in the [blog post](https://medium.com/geekculture/how-to-manage-public-and-private-subnets-in-aws-with-terraform-69c272003c81) for deploying a private and public subnet on AWS using Terraform.


<a id="orgf9e1ef0"></a>

### Planning:

I'll create this infrastructure copying the solution from the blog
word for word in a separate directory. After confirming that it works,
I'll note the differences between the working infrastructure and what
I had. Afterwards I'll use the notes to modify mine to comply with the
working one and hope it will be what's needed. From skimming the
document quickly, I guess that my problem was not adding the routing
table to the public subnet, but it might not be everything.


<a id="org393ef92"></a>

### DONE Create a file for VPC


<a id="orgc63a382"></a>

### DONE Create a file for Public Subnet


<a id="org46be271"></a>

### DONE Create a file for Internet Gateway


<a id="orgde2201c"></a>

### DONE Create a file for the Route Table for the Public Subnet


<a id="org6914c4d"></a>

### DONE Create a file for the Security Group


<a id="orge2bf1f5"></a>

### DONE Create a file for the Public EC2 Instance


<a id="org064b352"></a>

### DONE Create a variable file


<a id="orgae69e1d"></a>

### DONE Creating a NAT with an Elastic IP - what I'm not going to do.

1.  Create a file for the Public Subnet for NAT Gateway

2.  Create a file for Elastic IP (EIP)

3.  Create a file for the NAT Gateway

4.  Create a file for the Route Table for the NAT Gateway

5.  Create a file for the Private Subnet

6.  Create a file for the Route Table for the Private Subnet

7.  Create a file for the Private EC2 Instance


<a id="org63088a2"></a>

### DONE Run and see if it works

1.  Strange error, looked like one line was "disappeared" in Emacs.

    Terraform signaled an error of redefining type. This type of error
    happens if we have a double definition of something that can only be
    defined once.
    
    I didn't see anything wrong in the file. Turning on the 'linum-mode'
    in Emacs showed, that there was one line that "disappeared". Line 4
    was right after the second line. I didn't investigate, just went to
    the end of line 2 and held delete until I deleted the phantom line.

2.  Had to add the ssh key uploading code.

    I thought I can just link the name of the key uploaded by the flask
    terraform code. It didn't work, maybe because 'terraform destroy'
    destroys also SSH keys that are defined in the project. I just copied
    what had to be copied and got the ssh-key name using terraform
    variable substitution instead of the name I could get from AWS. Thanks
    to writing out all the code I feel like I'm getting the hang of
    Terraform. At least the hang of how things tend to be named and how to
    get id's or inside-secret-names of things, using variables.


<a id="orgbb3d915"></a>

### DONE Find the differences

Differences were the routing table and routing table association.


<a id="org501d9bf"></a>

### DONE Add them to flask-ci-cd Terraform code.

Added all networking infrastructure code to main.tf.


<a id="org4151391"></a>

## TODO <a id="org3edc3ca"></a>


<a id="org9d65e05"></a>

### Temporarily solved by having Terraform update Ansible's inventory file on each execution of 'terraform apply'.


<a id="org3767742"></a>

### We can keep some kind of state file there so that Terraform, Ansible and later Jenkins can communicate with each other or find out details on how to run the project.


<a id="org1dc0f15"></a>

### File will be in bash, so that it can be sourced to read all the variables into memory.


<a id="org80b3a63"></a>

### To protect the secrets, a trap will be added to playtrough.sh script so that on script exit, the vault can be locked again.


<a id="orgb349e30"></a>

### Since vault starts as empty, we need to check if it(file with secrets)'s there and generate the file if it doesn't exist yet.


<a id="org26c1a65"></a>

# DONE Set up Jenkins part 2: install Jenkins using Ansible.


<a id="orgd7e44ed"></a>

## DONE Find good instructions on how to install Jenkins in it's documentation or from some other credible source


<a id="org482e88b"></a>

### <https://www.jenkins.io/doc/book/installing/linux/#fedora>


<a id="orgd226b62"></a>

## DONE Create a Vagrant VM for local tests/development of the Jenkins playbook


<a id="org0b871d5"></a>

### Reinstalled Vagrant because of libvirt plugin issues

I've made the mistake of assuming that libvirt-devel package is going
to automatically pull libvirt. It's possible that reinstallation
wasn't necessary.


<a id="orgdbe60f1"></a>

### Installed & enabled libvirt and vagrant-libvirt plugin


<a id="orgdc8c04f"></a>

### Downloaded Alma Linux 9 vagrant box


<a id="org2c9e2d0"></a>

### Modified the default Vagrantfile based on previous projects (hostname, IP address, RAM)


<a id="org5cd24ad"></a>

### Start an Apache server on the Vagrant machine to make sure everything works

I could see the test webpage after installing Apache and enabling it
in firewall.


<a id="org53f9af1"></a>

## DONE Create a bash script or pseudocode script with the instructions listed in order.


<a id="orgd34d3d8"></a>

### Here are instructions from the Jenkins docs for installation on Fedora.

    sudo wget -O /etc/yum.repos.d/jenkins.repo \
        https://pkg.jenkins.io/redhat-stable/jenkins.repo
    sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
    sudo dnf upgrade
    # Add required dependencies for the jenkins package
    sudo dnf install java-17-openjdk
    sudo dnf install jenkins
    sudo systemctl daemon-reload

Not sure if it enables and starts the Jenkins service.


<a id="org52d74fd"></a>

### Here is a script to configure firewalld (RedHat family firewall service), also from Jenkins docs

    YOURPORT=8080
    PERM="--permanent"
    SERV="$PERM --service=jenkins"
    
    firewall-cmd $PERM --new-service=jenkins
    firewall-cmd $SERV --set-short="Jenkins ports"
    firewall-cmd $SERV --set-description="Jenkins port exceptions"
    firewall-cmd $SERV --add-port=$YOURPORT/tcp
    firewall-cmd $PERM --add-service=jenkins
    firewall-cmd --zone=public --add-service=http --permanent
    firewall-cmd --reload


<a id="org375a064"></a>

## DONE Test if these scripts/instructions work on a local Vagrant VM


<a id="orgd043313"></a>

### All this works and installs

Jenkins, tho the Jenkins service had to be explicitly enabled/started
Firewall configuration might be even simpler - the Jenkins service is
most likely already defined in firewalld services.


<a id="org73db5e7"></a>

## DONE Create a playbook based on the instructions


<a id="org9c48493"></a>

## DONE Debug the playbook until it deploys a working Jenkins server


<a id="org31591aa"></a>

### There were issues with nearly each task in this short playbook. The way Ansible tasks are defined is very similar to bash, but it's not identical. I've also made a YAML newbie mistake of supplying a one-element list instead of a string.

Notes from troubleshooting/debugging can be found in the project
journal under Fri Aug 4 10:45:00 AM CEST 2023


<a id="org5879659"></a>

# DONE Part 3: Create a Jenkinsfile in the Flask web application repository


<a id="org9a52695"></a>

## DONE Improve the python-flask-cicd-code repository so that it can output a docker image


<a id="org9f4f089"></a>

### Can't copy all files inside the repo onto the docker image, but found a solution - .dockerignore


<a id="org9fbb656"></a>

### Some issues with dependencies resolved by unpinning the dependencies

1.  More issues kept coming up. I can deploy this fancy blog in a later iteration. For now a simple flask hello world will suffice.


<a id="orgf3d73e5"></a>

### DONE Writing a simple Flask Hello World with help of ChatGPT

Build a docker image with it and run it to make sure that it works,
and it does.


<a id="org46bfa37"></a>

## DONE Test, debug and make sure it works when run manually


<a id="org0e13e0d"></a>

## DONE Manually upload the docker image either to AWS or Dockerhub


<a id="orgad29a92"></a>

## DONE Describe the process in a declarative Jenkinsfile, automating the process of docker image creation in a manually setup Jenkins

For this followed a tutorial found in Jenkins docs.


<a id="org889e448"></a>

### DONE First prepare the Jenkins server to use docker


<a id="orgb4c9290"></a>

### DONE Write a pipeline file (Jenkinsfile) based on web tutorials


<a id="org7100e6b"></a>

## DONE Update Ansible playbook knowing what was missing from the server:


<a id="org67a8b20"></a>

### DONE Summary: How do I need to modify my Ansible playbook?


<a id="orgab0f821"></a>

### DONE Install repo: <https://download.docker.com/linux/centos/docker-ce.repo>


<a id="org5ecd769"></a>

### DONE Remove packages:

podman
buildah


<a id="org88f4978"></a>

### DONE Install packages:

bash-completion (for debugging and usability)
docker-ce docker-ce-cli containerd.io
git


<a id="org182597a"></a>

### DONE Add jenkins user to docker group, !! jenkins service shouldn't be started before jenkins is added to the docker group !!


<a id="org74a0e75"></a>

### DONE Start and enable the docker.service


<a id="orge216675"></a>

# TODO Part 4: Deploy the Flask web application to ECS Fargate


<a id="org91038b4"></a>

## DONE Choose a deployment method: Decided to use AWS ECS with Fargate which is a very straightforward method of deploying a docker container to the cloud


<a id="org160c9cf"></a>

## DONE Read up documentation and tutorials:


<a id="org31f2642"></a>

### AWS Docs: Building a serverless Jenkins environment on AWS Fargate <https://aws.amazon.com/blogs/devops/building-a-serverless-jenkins-environment-on-aws-fargate/>

This is not exactly my use case, but it will be useful. It talks about
deploying Jenkins to ECS Fargate. But it includes info on temporary
credentials for 'AWS ECS Cluster access role' and 'Deployment role'. 


<a id="orgd209930"></a>

### Summary:

I need to start with a simple example of deploying a hello world to
ECS Fargate, then do it with Terraform (or maybe even start with
Terraform), then do it with Terraform from inside a Jenkinsfile and
lastly, do it from a Jenkinsfile with safely configured permissions
and credentials, so it can safely sit for a moment in the cloud.


<a id="org1d7c402"></a>

## DONE Deploy a hello-world to ECS Fargate without Terraform

<https://docs.aws.amazon.com/AmazonECS/latest/developerguide/getting-started-aws-copilot-cli.html>
This is a simplified deployment using AWS Copilot which is a
simplified and more user friendly alternative to AWS CLI.


<a id="orgac5334f"></a>

### DONE Fulfill requirements

Had to install Copilot and AWS CLI and set up tab-completions.


<a id="org5facc8c"></a>

## DONE Read enough ECS docs to know how to deploy to cloud using AWS CLI


<a id="orgfdd63a2"></a>

## TODO Upload Docker image to ECR


<a id="org7d38c53"></a>

### DONE Find out how to push to ECR with Docker/AWS CLI

<https://stackoverflow.com/a/68668097>
This assumes we already have an ECR repo.


<a id="org8712e35"></a>

### DONE Test the code on a local machine. Part 1: Create an ECR repo with Terraform

Looks like we need to create the repo first. It's more straightforward
to use AWS CLI for this.
Need to remember that a local command assumes the default region from
the profile. A proper way would be to define the region explicitly in
the 'aws' command.

By mistake (I had 2 weeks break with the project) I've
started working on how to do the Terraform part of CI/CD. After
research, I've decided not to delay project further by learning on how
to use modules and just create separate Terraform projects in it's own
directories.

Since the hardest part of programming is done already (researching
available options, choosing the right alternatives, planning on how to
do things) and all that's left to crate an ECR repo with Terraform is
coding the solution, I'll skip the step of creating an ECR repo with
aws-cli.

Using the Terraform files from the Jenkins deployment as templates.


<a id="orgf6fb730"></a>

### DONE Test the code on a local machine. Part 2: Push the image to the repo with Docker

It worked, with some small issues.


<a id="org60c6835"></a>

### DONE Note that the playbook will have to be updated (with AWS CLI and jq installation)

1.  DONE Add 'jq' to the list of installed packages

2.  DONE Make the playbook install AWS CLI if it's not installed

    1.  Steps to install AWS CLI (from AWS docs):
    
    2.  Download the installation files
    
    3.  Extract them
    
    4.  Run the installation script with elevated privileges
    
    5.  Verify the installation

3.  DONE Debug the playbook so that it works on both a fresh machine and on a machine where it was already installed (the playbook is indempotent)

    There were issues with starting Jenkins after dropping the plugins in. Looks like it's not as easy as copying the files onto the server. Need to solve the problem in a different way - using Jenkins command line interface.


<a id="org4d20bf9"></a>

### DONE Playbook should also install Terraform

Instructions on [Hashicorp's website](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli) for RHEL family Linux systems is pretty straightforward. It is also almost identical to how we install docker - add a repo and then install a package from that repo.

1.  Had some issues with adding the hashicorp repo with ansible, but found out the reason trough comparisition with regular bash instructions

2.  While working on the above I've introduced another bug into the playbook, but successfully resolved it too.

    When dividing long URLs (or strings in general) over two lines, you
    need to remember to place a backslash at the end of the first (and
    really each) line, if you want them to be later coalesced into one
    string without any newlines.


<a id="org6f5e534"></a>

### TODO Test the code again, on a newly provisioned machine

1.  DONE Setting up image repository

    Tested it on my development machine. Didn't want to put my secrets on
    working servers until I find a secure way to handle them. Also, AWS
    EC2 instances don't need the secrets, as they get authorized to deploy
    into cloud with AIM policies. AIM - Amazon Identity Management.

2.  DONE Running Jenkins pipeline to check if it can upload the image.

    There was no Jenkins pipeline saved that would upload the image.

3.  DONE Modify playbook to allow usage of Bitwarden and project's /bin scripts on Jenkins server

    Modified the playbook to do a sparse checkout on the project's repo
    and copy downloaded scripts into /usr/local/bin so they can be easily
    accessed. This solves the credentials problem, as we just run a script
    that copies AWS credentials into environment variables, pulling them
    via bitwarden-cli.

4.  TODO Manually upload the image from docker, following the tutorial


<a id="orge15339a"></a>

## Write Terraform code that deploys to the cloud, not worrying about secrets and permissions at first


<a id="org77ae45b"></a>

### Write a Task Definition


<a id="org48654b4"></a>

### Read on ECS module for Terraform


<a id="orgb4f9c55"></a>

### Write Terraform code deploying container to ECS


<a id="org673f907"></a>

## Put the Terraform code in a Jenkinsfile, maybe create few more steps, so that it's easier to see where exactly is the pipeline execution. Also use more descriptive names for steps, like 'Build Docker Image' instead of just 'Build'.


<a id="org4af9ce7"></a>

## Test, debug and make sure it works with a manually set up Jenkins server


<a id="org35b222d"></a>

## Find out what needs to be done to use AWS permissions and secret store to give the least permissions required to have Jenkins auto deploy the container to ECS Fargate


<a id="org89e001a"></a>

## Automate the deployment of the app when a new version of Dockerfile appears


<a id="orgb82f50e"></a>

## Test, debug and make sure it works


<a id="org04ad8a8"></a>

# Part 5: Configure Jenkins using JCasC


<a id="org8bbb0cc"></a>

## DONE Find some good sources on Jenkins as Code


<a id="orgd83d0e4"></a>

### Found both in Unix/Linux SysAdmin's Handbook (ULSAH):

1.  jenkins pipeline as code

    <https://devopscube.com/jenkins-pipeline-as-code/>
    
    <https://www.jenkins.io/doc/book/pipeline-as-code/>
    
    Looks like the Pipeline as Code is a concept of creating a project
    related Jenkins workflow, called a pipeline, defined in
    code. Alternative would be to click it out in GUI, but having it in
    code along with the project is more tidy. It's super popular.

2.  jenkins configuration as code

    Is a not-so-popular way to configure a Jenkins server, which then
    needs another Pipeline as Code configuration to run jobs. It's not
    that popular, but it's the way to go for an automated deployment.


<a id="org429b16d"></a>

## TODO Manually configure Jenkins


<a id="org3a8d405"></a>

## (Mistake - can't install plugins this way) Update the Ansible playbook for Jenkins installation to include the JCasC plugin


<a id="org028aa9b"></a>

### It wasn't easy because installing a plugin automatically on a new Jenkins installation can be challenging.


<a id="orgb3dbd4e"></a>

### It seems that the most straightforward method would be to download the JCasC plugin on the Ansible host and then have Ansible push it to the server once it's up.


<a id="orgbd76c3a"></a>

### Ansible's 'wait<sub>for</sub>' module waits for a port to open when an application starts up.


<a id="org5305607"></a>

### Got the JCasC plugin and it's dependencies packed neatly inside a .tgz file in the /jenkins<sub>config</sub> directory


<a id="org4f80bdc"></a>

## Install a Jenkins plugin from a command line (without Ansible)


<a id="orge84429a"></a>

## Update playbook to install the JCasC plugin with Jenkins CLI


<a id="org175bbbe"></a>

## Export the configuration in the JCasC format and create a new JCasC configuration based on that export


<a id="orgaba63b9"></a>

## Modify the Ansible playbook to place the configuration file on the Jenkins server


<a id="org20989f5"></a>

## Test, debug and make sure it works


<a id="orgb852f28"></a>

# Part 6: Fully automate whole Jenkins deployment, configuration and pipeline setup using the 'playtrough.sh'


<a id="org4b2f26b"></a>

# TODO's (non mission-critical):


<a id="org719cf5d"></a>

## Create a secret's file in the vault, as described [here](#org3edc3ca) in part 1 of the project.


<a id="org1b06d87"></a>

## vault<sub>management.sh</sub> (low priority, because using Hashicorp's Vault will make this script obsolete):


<a id="org3585f82"></a>

### Vault management script could detect if container is already created/closed/open and not report an error if container state is already as requested.


<a id="org995f056"></a>

### Add an option to destroy the existing vault.


<a id="orgca50670"></a>

## playtrough.sh


<a id="org7fec6c1"></a>

### If the variables in the vault are not set, interview the user about required project details at the beginning of the script.


<a id="org5892382"></a>

### DONE Both sub points can be achieved checking for presence of a dotfile.

1.  Test if script is run in the project's root directory

2.  Test if the vault is already accessible


<a id="orgd8fd8ef"></a>

### DONE Get password from a file or source other than user's input.

If an environment variable with password is already defined,
playtrough.sh will not ask for the password.


<a id="orgad65387"></a>

### Mention the opt-in to the Alma Linux AMI in playtrough.sh

 Error: creating EC2 Instance: OptInRequired: In order to use this AWS Marketplace product you need to accept terms and subscribe. To do so please visit <https://aws.amazon.com/marketplace/pp?sku=3kukoxmnoighcsbjd0u4nq9ds>
│       status code: 401, request id:
c915e28b-9e1e-4199-9e1c-a5e027333e9e

1.  Maybe it will be enough to warn the user? Would be cool to somehow force this subscription as one of the steps in the playtrough.sh. Maybe even test for it.


<a id="orgc5c138c"></a>

## Ansible (Jenkins server configuration):


<a id="org040d5bd"></a>

### Check aws binary version to avoid reinstalling the same version


<a id="org8598808"></a>

### Refactor /bin downloading task in the playbook to not say "changed" on each run

The task doesn't properly recognize when changes were made. Journal
entry from Sat Jun 15 contains a modification suggested by ChatGPT.


<a id="org0d9ed8e"></a>

## TODO Making the project more presentable (on GitHub) - emacs-org to markdown export

Plan is to add a git hook that will export project docs from .org to
markdown and then stage the new .md file in the commit. This file can
than be linked to from the project's README.

Looks like I haven't created a project's README yet.


<a id="orgf47e214"></a>

### DONE Create a project's README

Generated an initial version with ChatGPT. Will go over it a few times
to adjust it better to the project.

1.  DONE Finished refactoring the README

    Thanks to that amazing template the project is now very well described
    inside the README.

2.  Link to this README from python-flask-cidcd-code's README's

    We want somebody accidentally opening the code repo first to easily
    find the main README. This way the README in the code repo can remain
    simple.


<a id="orgf32c330"></a>

### TODO Quick-fix - manually generate a .html and link it in README


<a id="org5acb2f4"></a>

### TODO Find a way to export .org to .html headlessly


<a id="org9289337"></a>

### Decide where exactly to attach the hook


<a id="org5baadfd"></a>

### Add the hook


<a id="org81f6435"></a>

### Add links to auto-generated .html files in the project README


<a id="org7639dad"></a>

### Think of edge cases, tidy things up


<a id="orgc9c3d8d"></a>

# Mistakes:


<a id="orgd6ca99e"></a>

## Terraform:


<a id="org8aefc44"></a>

### Encapsulated a variable reference in double quotes, making it a literal string (effectively) turning off the reference mechanism.

    provider "aws" {
      region = var.aws_region # Correct
      # region = "var.aws_region" # Incorrect
    }


<a id="org3f5928d"></a>

## Using 'firewall-cmd' command without the '&#x2013;permanent' option

It doesn't work.


<a id="org20185f7"></a>

## Ansible


<a id="org00a308e"></a>

### Defining variables for a group in Ansible's hosts.ini outside [GROUPNAME:vars] subsection (forgetting the ':vars' modificator)

I used just the [GROUPNAME], instead of this:
[aws:vars]
\#ansible<sub>user</sub>=ec2-user
ansible<sub>user</sub>=vagrant
ansible<sub>ssh</sub><sub>private</sub><sub>key</sub><sub>file</sub>="../vault/id<sub>25519</sub><sub>aws</sub><sub>flaskcicd</sub>"


<a id="org53ba485"></a>

### Using a shell builtin with ansible command module - only the shell module has bash builtins.


<a id="orga0fe576"></a>

## Not refactoring the plan often enough. As we go deeper into the project, we gain knowledge and experience. In the light of newfound knowledge, the old plan becomes obsolete and should be replaced with more refined new plan. It doesn't mean that I was stupid by making the wrong plan in the beginning. Acting incompetently is the only way to gain competence to start acting competently.


<a id="org8ea0ad9"></a>

## Not reading up enough of previous documentation when coming back to project after a break. This led to duplicate work and thinking that the current task is more complicated than it was, in effect causing a longer delay in the project.


<a id="orgd933dec"></a>

## Jenkins:


<a id="org842997a"></a>

### Tried to configure Jenkins the same way I once configured Icinga server in an automatic deployment - by dropping in configuration files from a preconfigured working server. Instead I should've looked for a more classic solution.

The right way to do it was trough Jenkins CLI. I tried the drop in method to avoid learning how to use JCasC. If the plugin installation was that straightforward, I coul've finished the project without learning how to configure Jenkins with CLI (with the JCasC updating itself and installing other plugins from IaC).


<a id="org6f1b48c"></a>

# Extras:


<a id="orgda26a3c"></a>

## DONE Following a Jenkins Tutorial to learn how to make pipelines based on Jenkinsfiles


<a id="org94ecdc4"></a>

### DONE Set the goal: Jenkinsfile building my docker image and hosting it on ECS Fargate


<a id="orgf7b1c45"></a>

### DONE Starting with tutorial titled "How to Use Jenkins to Build and Run an Image Using Docker"


<a id="org5437860"></a>

### DONE Preparing the Jenkins Controller Instance to also server as a Docker building agent (manually for now, but later need to modify the ansible and eventually JCasC configuration):

1.  Suggested requirements to run docker:

    1.  Docker Engine: This is the core component required to build Docker images. You don't need to run containers, but the Docker engine must be installed to execute the docker build command.
    
    2.  Docker CLI: This is typically bundled with the Docker Engine installation. It provides the command-line interface to interact with Docker, including building images.
    
    3.  Jenkins Docker Plugin (optional): While not strictly necessary if you're using shell commands in Jenkins to build images, the Docker plugin can provide better integration and additional features for Docker within Jenkins.
    
    4.  Appropriate Permissions: The user under which Jenkins is running needs to have permissions to interact with the Docker daemon. This is often achieved by adding the Jenkins user to the docker group.

2.  Summary: steps taken:

    1.  Install CentOS docker repo:
    
        $ sudo dnf config-manager &#x2013;add-repo <https://download.docker.com/linux/centos/docker-ce.repo>
    
    2.  Remove conflicting packages preinstalled on AlmaLinux
    
        sudo dnf remove podman buildah -y
    
    3.  Install docker packages
    
        sudo dnf install docker-ce docker-ce-cli containerd.io
    
    4.  Start docker service
    
        sudo systemctl enable &#x2013;now docker.service
    
    5.  Add jenkins (and vagrant) users to docker group
    
        sudo usermod -aG docker jenkins
    
    6.  Install git package
    
    7.  Restart Jenkins service after changing the group.

3.  Summary: How do I need to modify my Ansible playbook?

    Install repo: <https://download.docker.com/linux/centos/docker-ce.repo>
    
    Remove packages:
    podman
    buildah
    
    Install packages:
    bash-completion (for debugging and usability)
    docker-ce docker-ce-cli containerd.io
    git
    
    Add jenkins user to docker group
    !! jenkins service shouldn't be started before jenkins is added to the
    docker group !!
    
    Start and enable the docker.service


<a id="org024dd35"></a>

### Writing the Jenkinsfile:

Shamelessly copying the example from the YouTube video.


<a id="org87d9b51"></a>

### Fixing agent to 'any' to allow building on the Jenkins controller


<a id="org8a16c6c"></a>

### Installing git

