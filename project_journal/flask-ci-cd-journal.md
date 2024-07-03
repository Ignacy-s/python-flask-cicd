
# Table of Contents

-   [Sat 25 Mar 2023 08:25:40 PM CET](#org24802af)
    -   [Write a step by step guide to create a most basic devops project to show in portfolio. Fully automated, using most popular technologies. It is just a simplest pipeline in jenkins or circleci. It should be deployed by cloning a git repo and running terraform. Before you start, ask questions about details with possible options and arguments for each choice. Only generate the step by step guide after you have all required data.](#org3f14a04)
        -   [Before creating the step-by-step guide for your basic DevOps project, I need some clarification on a few details. Please provide information on the following:](#org7816d11)
    -   [A.D. 1. I don't know, I would like something simple. In a later project version, we can use something more complicated. Please give me some options for a most basic project. Maybe some open source web app?](#org4d981a4)
        -   [Thank you for providing the necessary details. Based on your preferences, I suggest using a simple Python Flask web application as the base project for your portfolio. Here's the step-by-step guide for creating a basic DevOps project:](#org4a9602f)
    -   [The deployment of the CI/CD should be fully automated, configuring Jenkins by hand wont do. Maybe you have to use CircleCI to be able to have CI/CD configuration in YAML format?](#org4d2e956)
        -   [You're correct. CircleCI allows you to store your CI/CD configuration in a YAML file, which simplifies the automation process. Here's the updated step-by-step guide for creating a basic DevOps project using CircleCI, Terraform, and Ansible:](#org18fc5e2)
    -   [Is it possible to make it even simpler? CircleCI requires logging in. Maybe it's possible to have jenkins configuration saved in a file and have jenkins load this configuration from repo? Maybe use a separate repo for the jenkins provisioning and installation and configuration?](#org15f17a3)
        -   [I apologize for the confusion. Here's the complete step-by-step guide for creating a basic DevOps project using Jenkins Configuration as Code (JCasC), Terraform, and Ansible:](#orgcd328b2)
    -   [How could the Jenkins provisioning (\`jenkins<sub>playbook.yml</sub>\`) playbook be modified to also install the Jenkins config from the \`jenkins.yml\` file?](#org94804ca)
        -   [To modify the jenkins<sub>playbook.yml</sub> to install the Jenkins config from the jenkins.yaml file, you can add a few tasks to the Ansible playbook. These tasks will clone the jenkins<sub>config</sub> repository, copy the jenkins.yaml file to the JCasC configuration directory, and restart Jenkins to apply the changes.](#orgfd6b086)
-   [Sun 26 Mar 2023 09:30:15 AM CEST](#org14ccd55)
    -   [Preparing org-style plan for what needs to be done.](#org3c5c459)
        -   [It's easier to follow the instructions in ChatGPT web app than what's copied into the org document. Might be because the numbered list doesn't get copied correctly (it's copied without the numbers).](#orgc00a77b)
        -   [Going to use the basic 6 steps from the prompt as the first level tasks for the org document.](#org5b15137)
        -   [For now leaving it with just 6 steps, will plan each step as I approach it.](#org72e6e9e)
    -   [Copying the code snippets from ChatGPT into one organized place.](#org539b25a)
        -   [Code is already in this org file. I've made screenshots of the whole conversation in case I need some more organized reference.](#org83fd8f1)
    -   [Moved the journal to another file, so it can be removed from the repo if it's required.](#org3efc93b)
    -   [A problem needs solving before I start work. This project calls for usage of two more repositories, while I like to have one big repo that also includes the journal files. Maybe if I could explain the situation verbosely enough to ChatGPT, it could have some insights. I'm using the same conversation as for the whole project, so I assume that ChatGPT has context enough for this question (i.e. I don't have to tell it about the project).](#orgfe7ea94)
        -   [Based on your requirements and priorities, I suggest going with Option Four. This option strikes a balance between simplicity and showcasing your DevOps skills, while also allowing you to maintain your project journal alongside the code.](#org27af050)
        -   [Comment: Just describing the problem well let me have an insight on how to solve it. I wonder if some of the power of large language models doesn't lie in the rubberducking nature of using them. Rubber-ducking is a process of troubleshooting a problem by first describing it thoroughly to a rubber duck before we go and ask other people about it. What's special about it, is that just by talking and explaining the problem to a rubber duck, or any imaginary entity, we often arrive at solutions to our problems.](#org1af3739)
-   [Sun 26 Mar 2023 11:57:06 AM CEST](#org8a9dca4)
    -   [After deciding on how project will look (including repos and such), I'm preparing the first commit that will include basic directory structure, but also contain project's description. Actually I'm going to cut a corner here and have ChatGPT generate project's description.](#org3458e82)
        -   [Create a project description to be included at the beginning of project documentation file. It is to be read by people checking out the portfolio. You can base it on this:](#org4f3cf5e)
-   [Sun 26 Mar 2023 02:57:37 PM CEST](#orgbde058f)
    -   [Just posting this project description would make me feel weak inside. How can I use it and still have clean conscience? By adding a note that it was written by ChatGPT and also informing potential readers that ChatGPT assisted in planning the project and writing parts of the documentation. Maybe just a general info in the project description, and then specific notes in places where ChatGPT does most of the work, like in the project description? This feels good. I have a feeling that this kind of ethical questions is what many people ask themselves at the moment. Problem in my case is that if I just had ChatGPT do 90% of the work in every aspect, it would be insincere to claim that I've done the work or that it shows any skills on my part other than prompt engineering.](#orged085df)
    -   [I should explicitly say in the project's readme (which can be just a .md version of project description from the documentation .org file) what ChatGPT helped with.](#org1c0f0e3)
-   [Thu 06 Apr 2023 05:09:35 PM CEST](#org6873655)
    -   [Prompt:](#org6984b89)
    -   [Reply:](#org0838fab)
    -   [Conclusions: I'm finishing the second chapter, focusing especially on what might be relevant to the flask CI/CD pipeline project.](#orgf382ca7)
-   [Sun 16 Apr 2023 12:45:42 PM CEST](#org2a57787)
-   [Tue 18 Apr 2023 06:45:06 PM CEST](#orga0e458d)
    -   [Choose OS and AMI](#orgf8bc848)
        -   [Debian or Redhat family?](#org7823052)
        -   [AMI, use an existing or build own?](#org92223ed)
-   [Wed 19 Apr 2023 08:38:35 PM CEST](#orgb48c8ca)
-   [Sat 22 Apr 2023 01:47:05 PM CEST](#org5362c97)
    -   [Getting the AMI](#orgad991d8)
        -   [grep method](#orgece1a02)
        -   [awk method](#orgd8c83a9)
        -   [Terraform Data Source method](#org1b87016)
-   [Mon 01 May 2023 02:40:31 PM CEST](#org5b66c1e)
    -   [Differences:](#org0a7cfdf)
        -   [Defined VPC and Subnet](#orgbc921a7)
        -   [Explicitly defining egress traffic rules in the Security Group](#orgb004158)
-   [Sun 07 May 2023 01:09:21 PM CEST](#org2d91a48)
-   [Tue 09 May 2023 07:31:53 PM CEST](#orgc6ecabb)
    -   [Generated instructions on how to create and upload an ssh key:](#org2b257ed)
    -   [Generated instructions on how to create a LUKS container for SSH key:](#org7b5e735)
    -   [Generated a script to create, open and close the container.](#org9d86b80)
    -   [V2 version of script for management of LUKS container](#org257e9fe)
    -   [Generated a script to init the project, create the ssh key and the container. Also auto export passphrase so it can be used in the project.](#org5c56b77)
-   [Sat 13 May 2023 12:59:08 PM CEST](#org1765292)
-   [Sun 21 May 2023 03:33:45 PM CEST](#orge24e9e8)
-   [Tue 30 May 2023 08:26:54 PM CEST](#orgf953a85)
-   [Tue Jun  6 02:50:54 PM CEST 2023](#orgb1b30d8)
-   [Tue 06 Jun 2023 02:53:54 PM CEST](#orge10fbac)
-   [Thu 08 Jun 2023 03:21:05 PM CEST](#org7a23c7d)
-   [Thu 08 Jun 2023 04:58:58 PM CEST](#orgc528305)
-   [Sat 10 Jun 2023 02:58:43 PM CEST](#orgc5d55c4)
-   [Sun 11 Jun 2023 12:21:44 PM CEST](#orgce941ad)
-   [Tue Jun 13 11:54:45 AM CEST 2023](#orgcce42c6)
-   [Wed 14 Jun 2023 09:39:44 AM CEST](#orga829190)
-   [Wed 14 Jun 2023 11:10:31 AM CEST](#org6576608)
-   [Wed 14 Jun 2023 02:31:55 PM CEST](#orgcabc7b9)
-   [Wed 14 Jun 2023 04:53:32 PM CEST](#org5976b6e)
-   [Thu 15 Jun 2023 01:24:53 PM CEST](#org93a6e92)
-   [Thu 15 Jun 2023 01:57:37 PM CEST](#orgdf59b92)
-   [Thu 15 Jun 2023 02:49:19 PM CEST](#orgb4f788f)
-   [Sat 17 Jun 2023 01:05:28 PM CEST](#org06b827a)
-   [Sat 17 Jun 2023 05:19:27 PM CEST](#orgc25de51)
-   [Sun 18 Jun 2023 12:32:43 PM CEST](#org820a414)
-   [Sun 18 Jun 2023 02:46:28 PM CEST](#orgdada656)
-   [Mon 19 Jun 2023 05:40:59 PM CEST](#org827e719)
-   [Mon 19 Jun 2023 05:51:44 PM CEST](#org68eb226)
    -   [Planning:](#org95a2045)
    -   [Create a file for VPC](#org277c697)
    -   [Create a file for Public Subnet](#org65bc94d)
    -   [Create a file for Internet Gateway](#org3763a44)
    -   [Create a file for the Route Table for the Public Subnet](#org144e450)
    -   [Create a file for the Security Group](#org48115bc)
    -   [Create a file for the Public EC2 Instance](#orgb9e1583)
    -   [Create a variable file](#org5d747b5)
    -   [Creating a NAT with an Elastic IP - what I'm not going to do.](#orgd0f4366)
        -   [Create a file for the Public Subnet for NAT Gateway](#org094729f)
        -   [Create a file for Elastic IP (EIP)](#orgfc98a36)
        -   [Create a file for the NAT Gateway](#orgbd73996)
        -   [Create a file for the Route Table for the NAT Gateway](#org79d3c06)
        -   [Create a file for the Private Subnet](#org006869e)
        -   [Create a file for the Route Table for the Private Subnet](#org516e1f8)
        -   [Create a file for the Private EC2 Instance](#orgee84852)
    -   [Run and see if it works](#orgc908b0d)
        -   [Strange error, looked like one line was "disappeared" in Emacs.](#org2d9e2ff)
        -   [Had to add the ssh key uploading code.](#orgf4549c7)
    -   [Find the differences](#org4ee064a)
    -   [Add them to flask-ci-cd Terraform code.](#orgb554845)
-   [Thu 22 Jun 2023 06:28:17 PM CEST](#org61d2281)
    -   [Creating a file with secrets in the vault](#orgcabd717)
        -   [Secrets are: VM IP address, AWS access keys (danger!!), maybe also instance type, region and some other things that come up later on.](#org8a347cb)
        -   [At first the data will be entered manually.](#org2d3eb53)
        -   [Later on there also will be an option to start the playthrough.sh script with an interview asking for all the required settings.](#org88889f7)
        -   [To keep things safe, a trap can be added to playthrough.sh that would close the files.](#org219ce7c)
-   [Sat 08 Jul 2023 04:29:38 PM CEST](#org6d52248)
    -   [Having a shot at doing some tests with Ansible using given ssh key.](#orgb234e1f)
    -   [Problems with EC2 key pair - it already exists.](#org11898d6)
        -   [Prompt:](#orgb387c7c)
        -   [Answer:](#org403c8e9)
        -   [Error: Incorrect condition type](#orgba9d7b2)
        -   [Answer:](#org130bdde)
        -   [Summary:](#org7ebfc87)
-   [Sun 09 Jul 2023 05:44:10 PM CEST](#orgc04c01a)
    -   [But I want to pass some data to it (namely in IP address). What format should I use to perform variable substitution when running the script from terraform, so that the script receives the ip address string as one of it's parameters?](#org0dc5ad6)
    -   [How to make this 'null resource' work every time, so that it updates the file every time, not just when resource is "created"?](#orga682bde)
-   [Fri 14 Jul 2023 01:33:57 PM CEST](#org3d9e655)
    -   [Would be cool to have some kind of Backlog? Or should I use the TODO list at the end of docs?](#org0bea49f)
    -   [It felt weird and unnatural to use $PROJECT<sub>ROOT</sub>/vault/ssh<sub>key</sub><sub>mountpoint</sub> as the mountpoint for the vault. Changed it so that the /vault is the mountpoint for vault and the LUKS image sits at /vault.img.](#orge51dfa0)
-   [Sat Jul 22 12:22:18 PM CEST 2023](#org22c8f22)
    -   [Prompt: I would like to commit Ansible's hosts.ini file, but there are IP addresses inside.](#org4c20ea2)
        -   [Answer: You can use a Git hook to automate this process. Git hooks are scripts that Git executes before or after events such as commit, push, and so on.](#orge1804ff)
        -   [Followup prompt: Would it run everytime or only when the hosts.ini is staged?](#orgd0ee60c)
    -   [There are only minor errors in ChatGPT script generated that I see initially.](#org6b748c3)
-   [Sun Jul 23 08:19:51 PM CEST 2023](#org838cfa0)
    -   [Created a pre-commit hook for git to remove IP addresses form Ansible's hosts.ini file.](#orgb9a02d4)
        -   [curly braces \\{  - (for regex repetition pattern)](#org4fe9b8c)
        -   [round braces \\(  - (for regex block to be f.ex. repeated)](#orgeae91ae)
        -   [dot . if we need literal dot \\.](#org81c39f2)
    -   [pre-commit script in the final form:](#org79d0d04)
-   [Mon Jul 24 12:19:04 PM CEST 2023](#org6632888)
    -   [Run into some issues starting a Vagrant project. Vagrant complained on it's plugins. I also had to force Vagrant to use libvirt as it's plugin. When looking into info on Vagrant found out that there is a Vagrant flavor vagrant-libvirt that uses kvm/quemu (instead of Virtualbox) as it's default provider.](#org5ad34f1)
    -   [Had to install libvirt-devel, then libvirt and then enable libvirt service.](#org18a1f53)
    -   [Hard to find a correct box. Since the last RedHat drama (some business people thought someone will switch from rocky/alma to RH if they ban RH rebuilds), Geerling said he is switching his work to Debian. No official vagrant box from RedHat, no CentOS box either. No rocky box. Looks like Alma Linux people do release a vagrant image. It's called 'almalinux/9'.](#org899d2a0)
    -   [Got a vagrant box working](#org3c803d0)
    -   [And got Jenkins working using instructions from Jenkins docs](#org8d0770b)
-   [Wed Aug  2 01:48:49 PM CEST 2023](#orgdea1ade)
    -   [Got to translate the Jenkins installation instructions from Jenkins' docs (bash) to an Ansible playbook.](#orgb1dcbef)
    -   [First going to put the instructions in one file](#orgfc3e55a)
    -   [Actually, first going to nuke the local VM and check if installing Jenkins installs also firewalld configuration, which would simplify firewall setup.](#orgbbeb62e)
    -   [Had some error when changed the name of the mountpoint in the playthrough.sh. Used 'sudo rm /dev/mapper/LUKS<sub>CONTAINER</sub><sub>NAME</sub>' to delete the old container that didn't want to cooperate.](#org13e8d73)
-   [Fri Aug  4 10:40:53 AM CEST 2023](#org37a5a59)
    -   [The 'firewalld' module in Ansible didn't work.](#org9d57de3)
    -   [Had issues connecting to the local VM using the key generated for Ansible](#org9fa4b4a)
    -   [Another problem connecting to the local VM - Ansible interpreted ssh options from hosts.ini as host definitions. Turns out, that a proper way to set variables for a group is to name a subsection [GROUPNAME:vars].](#org67d4a97)
    -   [Problem with adding of the Jenkins repo - cannot download repodata/repomd.xml](#orgcd7e6dd)
    -   [Error in the 'service' module. "This module does not currently support using glob patterns, found '[' in service name: ['jenkins', 'firewalld']".](#org1dca687)
    -   [Ansible Firewalld module says that the Jenkins service is absent. Pretty sure I checked it before and it wasn't.](#org2a01446)
    -   [Can't connect to the Jenkins web server. Looks like firewall misconfiguration.](#org4b4e527)
-   [Sat 12 Aug 2023 04:33:17 PM CEST](#org328bab3)
-   [Thu Sep  7 08:17:31 PM CEST 2023](#orga3da678)
-   [Fri Sep  8 06:58:54 PM CEST 2023](#orgb8b023b)
-   [Sat Sep  9 11:59:03 AM CEST 2023](#orgeacdabc)
-   [Mon Sep 11 07:09:48 PM CEST 2023](#orgaba3b42)
-   [Tue Sep 12 08:15:08 PM CEST 2023](#orgf13b1d6)
-   [Fri Sep 15 12:08:57 PM CEST 2023](#org8f6b236)
    -   [Installing Docker Pipeline plugin](#org0b12d27)
    -   [Created a Jenkinsfile in the code repo](#org5f44745)
    -   [Installing Emacs Jenkins major mode](#orgcc92d95)
-   [Sat Sep 16 01:28:32 PM CEST 2023](#org21f4bb3)
-   [Sat Sep 16 01:44:38 PM CEST 2023](#org878e83d)
-   [Sun Sep 17 03:18:55 PM CEST 2023](#org2af1ee9)
    -   [.dockerignore](#org4f72b7e)
    -   [Dependency Hell](#orgb40450c)
        -   [Timeboxing](#org0541fb9)
        -   [Error from python - complaining on lack of compilation tools - switching base image to python](#org5f1c260)
        -   [Pasted the errors to ChatGPT and found out that it's a dependency issue, most likely due to old libraries being pinned.](#orgea3dbff)
        -   [Now there are errors with cffi. Trying the same as with Markupsafe, changing the dependency from equal to greater than equal. Success!](#orgd708b2e)
    -   [Errors with the app](#org1715c9f)
    -   [Another dependency error. It's a third one. I'm unpinning all dependencies.](#org440743a)
    -   [Problem with DB credentials not being set](#orgc44f468)
-   [Mon Sep 18 12:43:09 PM CEST 2023](#orgc2da912)
    -   [&#x2013;no-cache-dir option for pip install -r requirements](#org708884b)
    -   [ENV FLASK<sub>ENV</sub>=production](#org49e0fd0)
    -   [CMD ["python", "app.py"] instead of CMD python app.py](#orgb3df264)
-   [Mon Sep 18 03:32:56 PM CEST 2023](#org84b8d59)
-   [Mon Sep 18 04:28:53 PM CEST 2023](#org2a2af45)
-   [Tue Sep 19 10:36:24 AM CEST 2023](#org61d3dc0)
-   [Wed Sep 20 10:07:03 AM CEST 2023](#org4efcbba)
-   [Wed Sep 20 11:03:30 AM CEST 2023](#org564942f)
-   [Wed Sep 20 02:10:56 PM CEST 2023](#org2bffff7)
-   [Wed Sep 20 03:05:19 PM CEST 2023](#orgd919531)
-   [Wed Sep 20 06:57:28 PM CEST 2023](#org3da80ee)
-   [Thu Sep 21 09:16:34 AM CEST 2023](#org3a0cd8b)
    -   [Value of making clean notes](#org7e30c9e)
    -   [Ansible tutorial from Ansible Pilot YouTube channel](#orgf6b1fa3)
    -   [Full module names (example - 'ansible.builtin.rpm<sub>key</sub>') - a good practice](#org1d96fa1)
    -   [Setting the distribution name using 'ansible.builtin.set<sub>fact</sub>'](#orgffb0a1c)
        -   [I don't like the length of that line and wonder if it's possible to refactor it into a more readable form](#orgbef40a7)
-   [Fri Sep 22 12:13:59 PM CEST 2023](#orgf9d0652)
-   [Sun Sep 24 02:14:59 PM CEST 2023](#org49e50d2)
-   [Sun Sep 24 05:33:44 PM CEST 2023](#orge7160e7)
-   [Mon Sep 25 07:34:01 PM CEST 2023](#orgd7d0e92)
-   [Tue Sep 26 07:58:53 PM CEST 2023](#org005b3ad)
    -   [Task Definition - like a docker-compose file that also mentions hardware requirements](#org30f706c)
    -   [Task - a working, self sufficient instance of your workload, made up of multiple cooperating containers. Like a Kubernetes Pod.](#orgcb61c0e)
    -   [Cluster - like a Kubernetes instance, this is a group of EC2 instances where the Tasks are executed/run](#org13c2b5c)
    -   [More ECS info:](#org0d58e60)
-   [Fri Sep 29 09:47:00 PM CEST 2023](#org4e45d1c)
-   [Sat Sep 30 01:47:22 PM CEST 2023](#orgd8aae77)
-   [Fri Oct 13 07:38:28 AM CEST 2023](#org3395be6)
-   [Sat Oct 14 02:34:50 PM CEST 2023](#org6d1bdf3)
-   [Sun Oct 15 01:08:36 PM CEST 2023](#org510573f)
-   [Sun Oct 22 12:13:14 PM CEST 2023](#orgb3c7d30)
-   [Tue Nov  7 01:16:16 PM CET 2023](#orga404f61)
-   [sø. 18. feb. 15:38:41 +0100 2024](#org4ff1bec)
-   [Sun Feb 25 02:51:02 PM CET 2024](#org03bc5e5)
-   [Mon Feb 26 07:46:42 PM CET 2024](#org103be87)
-   [Tue Mar 12 04:09:13 PM CET 2024](#org52f1fe8)
-   [Tue Mar 12 10:28:18 PM CET 2024](#org6ae1bed)
-   [Wed Mar 13 03:12:01 PM CET 2024](#org0e708c1)
-   [Sat Mar 16 02:36:47 PM CET 2024](#org4fa1815)
-   [Tue Mar 19 09:00:14 PM CET 2024](#org613a57f)
-   [Sat Mar 23 11:44:43 AM CET 2024](#org294836c)
-   [Sun Mar 31 05:39:14 PM CEST 2024](#orge9226a8)
-   [Mon Apr  1 01:49:18 PM CEST 2024](#org8b03e66)
-   [Tue Apr  2 06:30:25 PM CEST 2024](#org3d30025)
-   [Sat Apr  6 11:28:50 AM CEST 2024](#orgc667197)
-   [Fri May 10 10:05:03 AM CEST 2024](#org0de397c)
-   [Fri May 10 04:17:05 PM CEST 2024](#orga9e23c4)
-   [Sat May 11 04:45:30 PM CEST 2024](#org8e82706)
-   [Mon May 13 03:01:03 PM CEST 2024](#org508a0b6)
    -   [Asked ChatGPT about how DNF stores repository info.](#org869c69f)
    -   [So, going to compare the .repo files. But first will clear the cache manually.](#org1e490d2)
-   [Sun Jun  2 06:04:15 PM CEST 2024](#orgb28b933)
    -   [Error MSG](#orgda04750)
    -   [dnf output on the server](#org6e3ba01)
-   [Tue Jun 11 09:25:28 AM CEST 2024](#orge3ac93f)
-   [Tue Jun 11 09:39:58 AM CEST 2024](#org99924a9)
    -   [Here is the code again:](#org6c83681)
-   [Thu Jun 13 01:43:30 PM CEST 2024](#org7e94e4e)
-   [Thu Jun 13 07:45:23 PM CEST 2024](#orgce7fd72)
-   [Sat Jun 15 03:49:15 PM CEST 2024](#org55fad33)
    -   [this alternative task:](#org16be5c2)
-   [Sun Jun 16 04:27:48 PM CEST 2024](#orga0e78ff)
-   [Mon Jun 17 07:00:09 PM CEST 2024](#org8933cdf)
-   [Mon Jun 17 08:22:59 PM CEST 2024](#org25b7e7e)
-   [Tue Jun 18 01:57:47 PM CEST 2024](#org64fce52)
-   [Wed Jun 19 10:39:36 AM CEST 2024](#org93d6e27)
-   [Thu Jun 20 09:48:59 AM CEST 2024](#org51940ce)
-   [Wed Jun 19 04:52:29 PM CEST 2024](#orga560bd2)
-   [Tue Jun 25 08:47:45 PM CEST 2024](#org639a30f)
-   [Thu Jun 27 06:58:45 PM CEST 2024](#orgc73a45e)
-   [Fri Jun 28 10:52:06 AM CEST 2024](#org48a0e8a)
    -   [Name](#orga382cc0)
    -   [Image](#org39bd09b)
    -   [Memory](#orga17ef5f)
    -   [Port mappings](#orgb2bc131)
    -   [Private Repository Credentials](#orge4d2426)
    -   [Other parameters:](#orgef94e3b)
-   [Fri Jun 28 11:15:02 AM CEST 2024](#org74c37e9)
    -   [Template Task Definition](#orgaca713c)
-   [Fri Jun 28 10:29:28 PM CEST 2024](#org478f1d3)
-   [Sat Jun 29 01:46:13 PM CEST 2024](#org99d060e)
-   [Sun Jun 30 08:48:12 PM CEST 2024](#org05d3698)
-   [Mon Jul  1 08:28:25 PM CEST 2024](#orgba331e1)
-   [Tue Jul  2 12:53:42 PM CEST 2024](#org94c6d8f)
-   [Wed Jul  3 01:06:37 PM CEST 2024](#org7796d0a)

Coding Journal for the python-flask-cicd learning project. This are my
notes. Writing helps with thinking and also makes it easier to repeat
something done over two weeks ago.


<a id="org24802af"></a>

# Sat 25 Mar 2023 08:25:40 PM CET

First conversation with ChatGPT on the project.


<a id="org3f14a04"></a>

## Write a step by step guide to create a most basic devops project to show in portfolio. Fully automated, using most popular technologies. It is just a simplest pipeline in jenkins or circleci. It should be deployed by cloning a git repo and running terraform. Before you start, ask questions about details with possible options and arguments for each choice. Only generate the step by step guide after you have all required data.


<a id="org7816d11"></a>

### Before creating the step-by-step guide for your basic DevOps project, I need some clarification on a few details. Please provide information on the following:

Programming language: Which programming language is used for the application you want to build?
Application type: Is it a web application, a command-line tool, or something else?
Source code repository: Which Git hosting platform do you prefer (e.g., GitHub, GitLab, Bitbucket)?
Infrastructure provider: On which cloud provider or platform do you want to deploy your application (e.g., AWS, GCP, Azure, DigitalOcean)?
Target environment: Do you want to deploy to a specific environment like Kubernetes, or just to a virtual machine or container?

Once I have this information, I will provide you with a tailored
step-by-step guide for creating a basic DevOps project for your
portfolio.


<a id="org4d981a4"></a>

## A.D. 1. I don't know, I would like something simple. In a later project version, we can use something more complicated. Please give me some options for a most basic project. Maybe some open source web app?

A.D. 2. I would like it to be a web app, that we would also deploy to
a web server using terraform and ansible/bash.
A.D. 3. GitHub,
A.D. 4. AWS A.D. 5. Virtual machine for CI/CD and container/VM for
webapp.

Remember it's a CV project. It should ask the person running it for
all credentials required to deploy to AWS, or take it from some
credentials file.


<a id="org4a9602f"></a>

### Thank you for providing the necessary details. Based on your preferences, I suggest using a simple Python Flask web application as the base project for your portfolio. Here's the step-by-step guide for creating a basic DevOps project:

Fork a simple Python Flask web application:
Go to <https://github.com/CoreyMSchafer/code_snippets/tree/master/Python/Flask_Blog> and fork the repository to your GitHub account.

Clone the forked repository to your local machine:

bash

git clone <https://github.com/><your<sub>github</sub><sub>username</sub>>/code<sub>snippets.git</sub>
cd code<sub>snippets</sub>/Python/Flask<sub>Blog</sub>

Create a virtual environment and install dependencies:

bash

python -m venv venv
source venv/bin/activate
pip install -r requirements.txt

Test the application locally:

arduino

export FLASK<sub>APP</sub>=flaskblog.py
flask run

Open your browser and visit <http://127.0.0.1:5000> to view the web application.

Set up a Jenkins instance on AWS using Terraform and Ansible:

Create a jenkins<sub>setup</sub> directory and change into it:

bash

mkdir jenkins<sub>setup</sub>
cd jenkins<sub>setup</sub>

Create a main.tf file for Terraform configuration and add the necessary AWS resources (VPC, subnet, security group, and EC2 instance). Use the Amazon Linux 2 AMI and install Jenkins on the EC2 instance using user<sub>data</sub>.
Create an Ansible playbook (jenkins<sub>playbook.yml</sub>) to install Jenkins and its dependencies, like Java and Git, on the EC2 instance.
Set up AWS credentials by providing your access key and secret key either through environment variables or the ~/.aws/credentials file.
Run terraform init to initialize the Terraform working directory.
Run terraform apply to create the infrastructure on AWS.
Once the EC2 instance is up and running, use ansible-playbook to run the jenkins<sub>playbook.yml</sub> file.

Configure Jenkins:
    Access the Jenkins instance using the public IP address of the created EC2 instance.
    Unlock Jenkins using the initial admin password found in /var/lib/jenkins/secrets/initialAdminPassword.
    Install the recommended plugins and set up an admin user.

Create a Jenkins pipeline:
    In Jenkins, create a new pipeline job.
    In the pipeline configuration, select "Pipeline script from SCM" and provide the GitHub repository URL and credentials.
    Add a Jenkinsfile to the root of the Flask web application repository with the following stages:
	Checkout: Clone the repository.
	Build: Set up a Python virtual environment and install dependencies.
	Test: Run unit tests, if any.
	Deploy: Use a Dockerfile to containerize the application, push the Docker image to a container registry, and deploy the application to a container platform like Amazon ECS or a VM using Ansible.

Trigger the Jenkins pipeline:
    Manually trigger the pipeline by clicking "Build Now" in Jenkins.
    Optionally, set up a webhook on GitHub to automatically trigger the pipeline whenever new changes are pushed to the repository.

Access the deployed web application using the URL or public IP address of the target environment (e.g., Amazon ECS or the VM).

Now you have a fully automated DevOps project that showcases your
ability to create a CI/CD pipeline using popular technologies like
Jenkins, Terraform, and Ansible.


<a id="org4d2e956"></a>

## The deployment of the CI/CD should be fully automated, configuring Jenkins by hand wont do. Maybe you have to use CircleCI to be able to have CI/CD configuration in YAML format?


<a id="org18fc5e2"></a>

### You're correct. CircleCI allows you to store your CI/CD configuration in a YAML file, which simplifies the automation process. Here's the updated step-by-step guide for creating a basic DevOps project using CircleCI, Terraform, and Ansible:

Fork the simple Python Flask web application:
Follow the same steps as mentioned earlier to fork and clone the Flask web application.

Sign up for CircleCI and connect your GitHub account:
    Go to <https://circleci.com/signup/> and sign up using your GitHub account.
    Once logged in, add your forked Flask web application repository by clicking on "Add Projects" and selecting your repository.

Create a CircleCI configuration file in your repository:
In the root of the Flask web application repository, create a .circleci directory, and inside it, create a config.yml file with the following configuration:

    
    version: 2.1
    jobs:
      build:
        docker:
          - image: circleci/python:3.8
        steps:
          - checkout
          - run:
              name: Set up virtual environment
              command: |
                python -m venv venv
                . venv/bin/activate
          - run:
              name: Install dependencies
              command: |
                . venv/bin/activate
                pip install -r requirements.txt
      deploy:
        docker:
          - image: circleci/python:3.8
        steps:
          - checkout
          - run:
              name: Set up virtual environment
              command: |
                python -m venv venv
                . venv/bin/activate
          - run:
              name: Install dependencies
              command: |
                . venv/bin/activate
                pip install -r requirements.txt
          - setup_remote_docker
          - run:
              name: Build and push Docker image
              command: |
                echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin
                docker build -t <your_dockerhub_username>/flask-webapp:latest .
                docker push <your_dockerhub_username>/flask-webapp:latest
          - run:
              name: Deploy to AWS
              command: |
                . venv/bin/activate
                ansible-playbook -i ansible/inventory.ini ansible/deploy.yml
    workflows:
      version: 2
      build-and-deploy:
        jobs:
          - build
          - deploy:
              requires:
                - build
              filters:
                branches:
                  only: main

Set up environment variables in CircleCI:

Go to your project's settings in CircleCI.
Under "Environment Variables", add the following variables:
    AWS<sub>ACCESS</sub><sub>KEY</sub><sub>ID</sub>: Your AWS access key.
    AWS<sub>SECRET</sub><sub>ACCESS</sub><sub>KEY</sub>: Your AWS secret key.
    DOCKER<sub>USERNAME</sub>: Your Docker Hub username.
    DOCKER<sub>PASSWORD</sub>: Your Docker Hub password.

Create an Ansible playbook for deployment:

In the repository, create an ansible directory.
Inside the ansible directory, create the following files:
    inventory.ini: A file containing the target AWS EC2 instance for deployment.
    deploy.yml: The main Ansible playbook to deploy the Docker container to the target instance.

The deploy.yml file should include tasks for:

Installing Docker on the target instance.
Logging in to Docker Hub.
Pulling the latest Docker image of your Flask web application.
Running a Docker container with the pulled image.

Set up AWS infrastructure using Terraform:
Follow the same


<a id="org15f17a3"></a>

## Is it possible to make it even simpler? CircleCI requires logging in. Maybe it's possible to have jenkins configuration saved in a file and have jenkins load this configuration from repo? Maybe use a separate repo for the jenkins provisioning and installation and configuration?


<a id="orgcd328b2"></a>

### I apologize for the confusion. Here's the complete step-by-step guide for creating a basic DevOps project using Jenkins Configuration as Code (JCasC), Terraform, and Ansible:

Fork the simple Python Flask web application:
    Go to <https://github.com/CoreyMSchafer/code_snippets/tree/master/Python/Flask_Blog> and fork the repository to your GitHub account.
    Clone the forked repository to your local machine:

bash

git clone <https://github.com/><your<sub>github</sub><sub>username</sub>>/code<sub>snippets.git</sub>
cd code<sub>snippets</sub>/Python/Flask<sub>Blog</sub>

Create a separate repository for Jenkins provisioning, installation, and configuration:

On GitHub, create a new repository called jenkins<sub>config</sub>.
Clone the new repository on your local machine:

bash

git clone <https://github.com/><your<sub>github</sub><sub>username</sub>>/jenkins<sub>config.git</sub>
cd jenkins<sub>config</sub>

Set up Jenkins on AWS using Terraform and Ansible:

Create a jenkins<sub>setup</sub> directory and change into it:

bash

mkdir jenkins<sub>setup</sub>
cd jenkins<sub>setup</sub>

Create a main.tf file for Terraform configuration and add the necessary AWS resources (VPC, subnet, security group, and EC2 instance). Use the Amazon Linux 2 AMI and install Jenkins on the EC2 instance using user<sub>data</sub>.
Create an Ansible playbook (jenkins<sub>playbook.yml</sub>) to install Jenkins and its dependencies, like Java, Git, and the JCasC plugin, on the EC2 instance:

yaml

-   name: Install Jenkins and dependencies
    hosts: all
    become: yes
    vars:
      jenkins<sub>plugins</sub>:
    
    -   name: git
    -   name: configuration-as-code
    
    tasks:
    
    -   name: Install Java
        package:
          name: java-1.8.0-openjdk-devel
          state: present
    
    -   name: Add Jenkins repository
        yum<sub>repository</sub>:
          name: jenkins
          description: Jenkins Repository
          baseurl: <http://pkg.jenkins.io/redhat/jenkins.repo>
          gpgkey: <https://pkg.jenkins.io/redhat/jenkins.io.key>
          gpgcheck: yes
    
    -   name: Install Jenkins
        package:
          name: jenkins
          state: present
    
    -   name: Start and enable Jenkins service
        systemd:
          name: jenkins
          state: started
          enabled: yes
    
    -   name: Install Jenkins plugins
        jenkins<sub>plugin</sub>:
          name: "{{ item.name }}"
        with<sub>items</sub>: "{{ jenkins<sub>plugins</sub> }}"

Set up AWS credentials by providing your access key and secret key either through environment variables or the ~/.aws/credentials file.
Run terraform init to initialize the Terraform working directory.
Run terraform apply to create the infrastructure on AWS.
Once the EC2 instance is up and running, use ansible-playbook to run the jenkins<sub>playbook.yml</sub> file.

Configure Jenkins using JCasC:

In the jenkins<sub>config</sub> repository, create a jenkins.yaml file for Jenkins Configuration as Code (JCasC).
Add the following configuration to create a pipeline job:

yaml

jobs:

-   script: >
    pipelineJob('flask-webapp') {
      definition {
        cpsScm {
          scm {
    	git {
    	  remote { url('https://github.com/<your<sub>github</sub><sub>username</sub>>/code<sub>snippets.git</sub>') }
    	  branches('master')
    	}
          }
          scriptPath


<a id="org94804ca"></a>

## How could the Jenkins provisioning (\`jenkins<sub>playbook.yml</sub>\`) playbook be modified to also install the Jenkins config from the \`jenkins.yml\` file?


<a id="orgfd6b086"></a>

### To modify the jenkins<sub>playbook.yml</sub> to install the Jenkins config from the jenkins.yaml file, you can add a few tasks to the Ansible playbook. These tasks will clone the jenkins<sub>config</sub> repository, copy the jenkins.yaml file to the JCasC configuration directory, and restart Jenkins to apply the changes.

Here's the updated jenkins<sub>playbook.yml</sub>:

yaml

-   name: Install Jenkins and dependencies
    hosts: all
    become: yes
    vars:
      jenkins<sub>plugins</sub>:
    
    -   name: git
    -   name: configuration-as-code
    
    tasks:
    
    -   name: Install Java
        package:
          name: java-1.8.0-openjdk-devel
          state: present
    
    -   name: Add Jenkins repository
        yum<sub>repository</sub>:
          name: jenkins
          description: Jenkins Repository
          baseurl: <http://pkg.jenkins.io/redhat/jenkins.repo>
          gpgkey: <https://pkg.jenkins.io/redhat/jenkins.io.key>
          gpgcheck: yes
    
    -   name: Install Jenkins
        package:
          name: jenkins
          state: present
    
    -   name: Start and enable Jenkins service
        systemd:
          name: jenkins
          state: started
          enabled: yes
    
    -   name: Install Jenkins plugins
        jenkins<sub>plugin</sub>:
          name: "{{ item.name }}"
        with<sub>items</sub>: "{{ jenkins<sub>plugins</sub> }}"
    
    -   name: Clone Jenkins configuration repository
        git:
          repo: <https://github.com/><your<sub>github</sub><sub>username</sub>>/jenkins<sub>config.git</sub>
          dest: /var/lib/jenkins/jenkins<sub>config</sub>
    
    -   name: Ensure JCasC configuration directory exists
        file:
          path: /var/lib/jenkins/configuration-as-code
          state: directory
          owner: jenkins
          group: jenkins
          mode: '0755'
    
    -   name: Copy Jenkins configuration file
        copy:
          src: /var/lib/jenkins/jenkins<sub>config</sub>/jenkins.yaml
          dest: /var/lib/jenkins/configuration-as-code/jenkins.yaml
          owner: jenkins
          group: jenkins
          mode: '0644'
    
    -   name: Restart Jenkins to apply configuration changes
        systemd:
          name: jenkins
          state: restarted

These new tasks perform the following actions:

Clone the jenkins<sub>config</sub> repository to /var/lib/jenkins/jenkins<sub>config</sub> on the Jenkins EC2 instance.
Ensure that the JCasC configuration directory /var/lib/jenkins/configuration-as-code exists.
Copy the jenkins.yaml file from the cloned repository to the JCasC configuration directory.
Restart Jenkins to apply the configuration changes.

After running the updated playbook, Jenkins will load the
configuration from the jenkins.yaml file located in the JCasC
configuration directory.


<a id="org14ccd55"></a>

# Sun 26 Mar 2023 09:30:15 AM CEST


<a id="org3c5c459"></a>

## Preparing org-style plan for what needs to be done.

Offtop: My eyes hurt a little and vision is blurry again, think it's because some of the under-eyes cream got into the eyes.


<a id="orgc00a77b"></a>

### It's easier to follow the instructions in ChatGPT web app than what's copied into the org document. Might be because the numbered list doesn't get copied correctly (it's copied without the numbers).


<a id="org5b15137"></a>

### Going to use the basic 6 steps from the prompt as the first level tasks for the org document.


<a id="org72e6e9e"></a>

### For now leaving it with just 6 steps, will plan each step as I approach it.


<a id="org539b25a"></a>

## Copying the code snippets from ChatGPT into one organized place.


<a id="org83fd8f1"></a>

### Code is already in this org file. I've made screenshots of the whole conversation in case I need some more organized reference.


<a id="org3efc93b"></a>

## Moved the journal to another file, so it can be removed from the repo if it's required.

At first thought to remove it completely from git tracking. Then I
would lose the advantage of having notes and thoughts connected with
specific code changes in one place.

After thinking deeper, I realized that I wanted to hide the fact that
I used ChatGPT to help me decide on what project to choose for MVP
DevOps project for most basic portfolio of one. But after considering
it, I've realized that the only thing that would be dishonest here
would be trying to hide that I got help from a ChatGPT tutor.


<a id="orgfe7ea94"></a>

## A problem needs solving before I start work. This project calls for usage of two more repositories, while I like to have one big repo that also includes the journal files. Maybe if I could explain the situation verbosely enough to ChatGPT, it could have some insights. I'm using the same conversation as for the whole project, so I assume that ChatGPT has context enough for this question (i.e. I don't have to tell it about the project).

You are a tutor, Senior DevOps expert helping me, aiming for a Junior
DevOps position, by giving me guidance and assistance where I need it.

I like to work by writing a project journal with general thoughts and
notes on what I'm doing and why I'm doing it, and also a project
documentation with more specific information on steps performed when
working on a project with details on each step so it can be understood
later on. Because of that I tended to have one big repository for both
the code and journals, so commits with code also include journal
commits, which gives each code commit much more context.

This project however requires usage of two more repositories. One for
Jenkins deployment and Configuration. Second one being the cloned
repository of the flask web app.

Later web app maintenance is not a concern. Readability is, but even
more important is to not make the project too complicated, so I can
finish it quickly. It's just a portfolio project to showcase basic
DevOps skills, so I can have something to link from the CV.

What should I do?
I see three options, but maybe you have other insights:

Option one: Create just one big repo, with the two other repos not
really repos but directories inside the big repo. It will make work on
the 'Jenkins deployment and configuration' part much easier, as each
code commit will also be accompanied by relevant journal entries. It
will also make it near-impossible to have CI/CD pipeline triggered on
new commits, since the commits will be not only to the cloned flask
app, but also to CI/CD configuration and deployment.

Option two: Create one big repo, and then somehow create two others
inside it. I'm not sure if it's possible with git. It might cause
problems later on, but as long as basic deployment of the CI/CD
pipeline is possible, it should be ok. However, I'm not shy of sharing
these journals publicly.

Option three: Create three separate repos in three separate directory
trees. One for journals and files specific to the whole project,
second for CI/CD deployment and configuration, third for the web
app. This means that repos will not disturb each other, but also that
the journal entries wont be connected with code commits, so I can't
show my thought process and can't easily see documentation entries
connected to code entries.

Option four (idea I had while writing down previous options): Have two
repos. First one would merge the repo for the project as a whole and
the CI/CD pipeline. Showcasing CI/CD skills is at the heart of the
project. The second repo with the cloned web app repository could
include just the web app (and eventually some CI/CD configuration that
would normally reside in the same repo as the app). Then commits to
this separate repo could properly trigger build and deployment process
from Jenkins.


<a id="org27af050"></a>

### Based on your requirements and priorities, I suggest going with Option Four. This option strikes a balance between simplicity and showcasing your DevOps skills, while also allowing you to maintain your project journal alongside the code.

Here's a breakdown of Option Four:

Create a main repository for the project documentation, journal, and CI/CD pipeline configuration. This repository will include the following directories and files:
    /project<sub>journal</sub> - for your project journal and general thoughts.
    /project<sub>documentation</sub> - for your project documentation with step-by-step details.
    /jenkins<sub>config</sub> - for Jenkins provisioning, installation, and configuration.
    /terraform - for your Terraform configuration files.
    /ansible - for your Ansible playbooks.

Fork the Flask web application repository and clone it. This will serve as your second repository. You can add the required CI/CD configuration files (such as Jenkinsfile) directly to this repository. This will allow Jenkins to trigger builds and deployments based on commits to this repository.

This way, you can have your project journal and documentation connected to the CI/CD pipeline configuration and deployment, while keeping the web application repository separate. The separation ensures that your CI/CD pipeline works as expected, and it demonstrates your ability to create and manage a basic DevOps project for your portfolio.

Remember to update the paths in your CI/CD pipeline configuration and
scripts to point to the correct directories in your new repository
structure.


<a id="org1af3739"></a>

### Comment: Just describing the problem well let me have an insight on how to solve it. I wonder if some of the power of large language models doesn't lie in the rubberducking nature of using them. Rubber-ducking is a process of troubleshooting a problem by first describing it thoroughly to a rubber duck before we go and ask other people about it. What's special about it, is that just by talking and explaining the problem to a rubber duck, or any imaginary entity, we often arrive at solutions to our problems.


<a id="org8a9dca4"></a>

# Sun 26 Mar 2023 11:57:06 AM CEST


<a id="org3458e82"></a>

## After deciding on how project will look (including repos and such), I'm preparing the first commit that will include basic directory structure, but also contain project's description. Actually I'm going to cut a corner here and have ChatGPT generate project's description.


<a id="org4f3cf5e"></a>

### Create a project description to be included at the beginning of project documentation file. It is to be read by people checking out the portfolio. You can base it on this:

This is a simple CI/CD project to showcase my skills in &#x2026;.

It's aim is for someone to be able to download this repository and run it
himself to create a working CI/CD pipeline in AWS based on Jenkins
that deploys a container with a flask web app to AWS each time a
commit is made to the tracked flask app repository.

-   Title: Basic DevOps Portfolio Project - CI/CD Pipeline with Jenkins and AWS

    Project Description:
    
    Welcome to my Basic DevOps Portfolio Project. The primary goal of this project is to showcase my skills in setting up a Continuous Integration and Continuous Deployment (CI/CD) pipeline using Jenkins, AWS, and containerization.
    
    In this project, you will find a fully functional CI/CD pipeline that automates the process of deploying a Flask web application to an AWS environment each time a commit is made to the tracked repository. The pipeline is designed to be easily reproducible, allowing you to download this repository and set up the pipeline in your own AWS account with minimal effort.
    
    The project highlights my proficiency in:
    
    Jenkins: Configuring and managing Jenkins as a CI/CD tool, including setting up jobs, pipelines, and plugins.
    AWS: Leveraging various AWS services, such as EC2, RDS, and ECS, to create a scalable and secure infrastructure for the web application.
    Terraform: Using Terraform to define and provision the infrastructure resources required for the pipeline and the web application.
    Ansible/Bash: Automating the deployment and configuration of the Jenkins server, as well as the web application, using Ansible playbooks or Bash scripts.
    Containerization: Packaging the Flask web application in a Docker container to ensure consistent deployment across environments.
    
    By following the detailed instructions provided in this project documentation, you will be able to create a working CI/CD pipeline in your own AWS account, gaining a deeper understanding of the processes and tools involved in modern DevOps practices.

-   Comment: Description generated by GPT-4 is flawless. Why I feel uneasy about it then? For a Junior engineer it's important to do things yourself, that's the only way to learn them. I guess in places that are not a core ability for a DevOps, cutting corners like that may be essential to work against my tendency to over complicate things and to fall into rabbit holes. On the other hand, if I'm doing something that I later want to say I can do as a professional, I might use ChatGPT as a web search or a guide on what to do next or how to solve a problem, but not to get a complete solution that I would mindlessly copy. Still, there is a certain knowledge required to use these solutions correctly and to spot when ChatGPT is hallucinating. So I shouldn't accredit all work to ChatGPT either.


<a id="orgbde058f"></a>

# Sun 26 Mar 2023 02:57:37 PM CEST


<a id="orged085df"></a>

## Just posting this project description would make me feel weak inside. How can I use it and still have clean conscience? By adding a note that it was written by ChatGPT and also informing potential readers that ChatGPT assisted in planning the project and writing parts of the documentation. Maybe just a general info in the project description, and then specific notes in places where ChatGPT does most of the work, like in the project description? This feels good. I have a feeling that this kind of ethical questions is what many people ask themselves at the moment. Problem in my case is that if I just had ChatGPT do 90% of the work in every aspect, it would be insincere to claim that I've done the work or that it shows any skills on my part other than prompt engineering.


<a id="org1c0f0e3"></a>

## I should explicitly say in the project's readme (which can be just a .md version of project description from the documentation .org file) what ChatGPT helped with.


<a id="org6873655"></a>

# Thu 06 Apr 2023 05:09:35 PM CEST

In the past 1.5 weeks I've put about 31 pomodoros into learning
Terraform. I think that's taking too much time, going to experiment
with a prompt to create a seasoned DevOps professional guide and ask
him whether I should keep following the Terraform Up and Running book
sequentially or just try to learn the absolute minimum required to
continue with the project.

I've learned a little more about using ChatGPT and practiced a
lot. I've also found a project that takes in your prompt and upgrades
it to be more effective. <https://promptperfect.jina.ai/prompts>


<a id="org6984b89"></a>

## Prompt:

As an experienced DevOps guide and tutor, your task is to provide
advice for a user working on a basic portfolio project involving the
deployment of a Python Flask web application using Jenkins. The user
has spent 1.5 weeks learning Terraform but feels that it may be taking
too much time.

Please evaluate whether they should continue with the "Terraform Up
and Running" book sequentially or focus only on learning the minimum
required to complete their current project. In your response, consider
factors such as efficiency, long-term benefits, and skill development
in relation to a junior DevOps professional's career
growth. Additionally, feel free to offer alternative suggestions if
you believe there are more effective ways for them to achieve their
goals while also considering time constraints and overall
effectiveness in accomplishing their objectives.

Your response should clearly explain the pros and cons of each option
(continuing with the book versus focusing on the minimum
requirements), provide recommendations based on your evaluation, and
offer any alternative approaches you think might help them reach their
goals more effectively. Please ensure that your advice takes into
account both short-term needs related to completing the project at
hand and long-term career growth considerations for a junior DevOps
professional.

This is what can be found in the book, right now I'm halfway through the second chapter.
Chapter 2, “Getting Started with Terraform”
Installing Terraform; an overview of Terraform syntax; an overview of
the Terraform CLI tool; how to deploy a single server; how to deploy a
web server; how to deploy a cluster of web servers; how to deploy a
load balancer; how to clean up resources you’ve created.
Chapter 3, “How to Manage Terraform State”
What Terraform state is; how to store state so that multiple team
members can access it; how to lock state files to prevent race
conditions; how to isolate state files to limit the damage from errors;
how to use Terraform workspaces; a best-practices file and folder layout
for Terraform projects; how to use read-only state.
Chapter 4, “How to Create Reusable Infrastructure with Terraform
Modules”
What modules are; how to create a basic module; how to make a
module configurable with inputs and outputs; local values; versionedmodules; module gotchas; using modules to define reusable,
configurable pieces of infrastructure.
Chapter 5, “Terraform Tips and Tricks: Loops, If-Statements, Deployment,
and Gotchas”
Loops with the count parameter, for<sub>each</sub> and for expressions,
and the for string directive; conditionals with the count parameter,
for<sub>each</sub> and for expressions, and the if string directive; built-in
functions; zero-downtime deployment; common Terraform gotchas and
pitfalls, including count and for<sub>each</sub> limitations, zero-downtime
deployment gotchas, how valid plans can fail, and how to refactor
Terraform code safely.


<a id="org0838fab"></a>

## Reply:

As an experienced DevOps guide and tutor, I understand the importance
of balancing short-term project goals with long-term career
development. In this case, the user has spent 1.5 weeks learning
Terraform and is considering whether to continue with the "Terraform
Up and Running" book sequentially or focus only on learning the
minimum required to complete their current project.

Option 1: Continue with the book sequentially Pros:

Comprehensive understanding of Terraform's features and best
practices.  Developing a strong foundation in Terraform, which is
widely used in the industry.  Exposure to advanced Terraform
concepts that can be useful for future projects.

Cons:

Time-consuming, which may delay the completion of the current
project.  Some topics covered in the book may not be immediately
relevant to the user's current project.

Option 2: Focus on the minimum requirements Pros:

Faster completion of the current project.  Allows the user to
focus on learning just the necessary Terraform concepts for the
project.

Cons:

Limited understanding of Terraform's features and best practices.
May need to revisit the book in the future for more advanced
topics.

Recommendation: Considering the user's current situation, I recommend
focusing on the minimum requirements to complete the project. This
approach will allow the user to apply their Terraform knowledge more
quickly, demonstrate their skills in a portfolio project, and
potentially secure a junior DevOps position sooner.

To ensure the user's long-term career growth, I suggest the following
alternative approach:

Finish Chapter 2 of the book, which covers the basics of Terraform
and should be sufficient for the current project.  Prioritize
applying the learned concepts in the current project, focusing on
building a functional CI/CD pipeline for the Flask web
application.  After completing the project, return to the book and
continue learning more advanced Terraform concepts (Chapters 3-5)
at a comfortable pace. This way, the user can gradually build
their Terraform expertise without delaying the current project.

This approach balances the user's short-term project goals with their
long-term career development, ensuring they have the necessary skills
to complete their project while also laying the groundwork for future
growth as a DevOps professional.


<a id="orgf382ca7"></a>

## Conclusions: I'm finishing the second chapter, focusing especially on what might be relevant to the flask CI/CD pipeline project.


<a id="org2a57787"></a>

# Sun 16 Apr 2023 12:45:42 PM CEST

Had a first sit down to project after I've spent some time learning
Terraform. Downloaded the code for the flask app that will be later
committed to the code repo of the project (infrastructure and CI/CD
part has it's own repo, that also includes documentation and the
journal). I'm going to make one last jump into Terraform Up and
Running to learn about data sources. This will provide a solid
foundation of Terraform knowledge, sufficient for this project
and a basis for building further Terraform competence in the future.


<a id="orga0e458d"></a>

# Tue 18 Apr 2023 06:45:06 PM CEST

With both the pipeline and code repositories ready, time to create a
VM in the cloud to hold the Jenkins server. But what OS to use?


<a id="orgf8bc848"></a>

## Choose OS and AMI


<a id="org7823052"></a>

### Debian or Redhat family?

I used to do servers using CentOS. Since CentOS got nuked, I was
wondering whether Fedora wouldn't be a good choice for this
project. Another alternative would be Alma Linux, which is a RHEL
repackaged system in CentOS spirit. Another similar to Alma is Rocky
Linux. I don't exclude Debian family from the equation, especially if
there are some issues standing Jenkins on Redhat family.

I think I'll go with Alma, because I haven't tried it before and it's
kind of CentOS, so I might use it in the future for similar use
cases. Fedora is on second place. If there are any repos missing for
Alma that exist for Fedora, I'll fallback to Fedora Server edition.


<a id="org92223ed"></a>

### AMI, use an existing or build own?

I could build my own ami using Packer, but to reduce complexity, I'll
go with a ready-made AMI from AWS AMI Marketplace.


<a id="orgb48c8ca"></a>

# Wed 19 Apr 2023 08:38:35 PM CEST

Trying to iron out the details for the Terraform setup. It's quite
simple, because it's just one instance. There are however some aspects
that were not covered in the part of Terraform Up and Running I've
read. I need to make sure the Instance gets my ssh-key baked in. The
firewall rules (security group) also has to accept Jenkins traffic.


<a id="org5362c97"></a>

# Sat 22 Apr 2023 01:47:05 PM CEST

Preparing what's required for the Terraform configuration. In the
simplest form, I just need a Linux cloud instance with a web and ssh
ports open. I also need to pass the IP address of the instance to
Ansible.

Firewall configuration will be done using AWS Security Group. SSH key
will be generated on host and inserted onto the instance using
Terraform. I'll probably just get the instances IP using Terraform
output variable and paste it into the inventory file with a script.


<a id="orgad991d8"></a>

## Getting the AMI

AMI IDs are a source of fun (problems), because the same virtual
machine image will have different AMI number on each region.

I've downloaded AMI IDs list from Alma Linux project's website, file
is named aws<sub>amis.csv</sub>. Need to extract the correct (and just one) AMI
number from it. Or find an alternative that doesn't include
downloading files from Alma's website.


<a id="orgece1a02"></a>

### grep method

$ grep eu-north-1 aws<sub>amis.csv</sub> | grep x86 | sort -nrk 2 -t',' | head -1 | cut -f4 -d','


<a id="orgd8c83a9"></a>

### awk method

$ awk -F, '$3 `= "\"eu-north-1\"" && $5 =` "\\"x86<sub>64</sub>\\"" { \\               
           version=$2; \\
           if (version > max<sub>version</sub>) { \\
             max<sub>version</sub> = version; \\
             ami<sub>id</sub> = $4 \\
           } \\
         } \\
         END { print ami<sub>id</sub> }' aws<sub>amis.csv</sub>


<a id="org1b87016"></a>

### Terraform Data Source method

Still didn't like downloading the file (should it be in repo, should
it be re-downloaded each time?) and grepping for the AMI. Had a hunch
that it might be solved in Terraform, so I asked if it's possible to
have an elegant solution using Terraform only:

To use Terraform Data Source to get the AMI of AlmaLinux OS 9 for x86<sub>64</sub> on the \`eu-north-1\` region, you can use the \`aws<sub>ami</sub>\` data source with the appropriate filters. Here's a Terraform configuration that demonstrates this:

    provider "aws" {
      region = "eu-north-1"
    }
    
    data "aws_ami" "alma_linux_9" {
      most_recent = true
    
      filter {
        name   = "name"
        values = ["AlmaLinux OS 9*"]
      }
    
      filter {
        name   = "architecture"
        values = ["x86_64"]
      }
    
      filter {
        name   = "root-device-type"
        values = ["ebs"]
      }
    
      filter {
        name   = "virtualization-type"
        values = ["hvm"]
      }
    
      filter {
        name   = "hypervisor"
        values = ["xen"]
      }
    
      owners = ["amazon", "aws-marketplace", "self"]
    }
    
    output "alma_linux_9_ami_id" {
      value = data.aws_ami.alma_linux_9.id
    }

This configuration sets up the AWS provider for the \`eu-north-1\` region and defines an \`aws<sub>ami</sub>\` data source that filters the available AMIs based on the name pattern, architecture, and other properties. The \`most<sub>recent</sub> = true\` option ensures that you get the latest available version of the AMI.

After running \`terraform init\` and \`terraform apply\`, the output should display the AMI ID of the most recent AlmaLinux OS 9 for x86<sub>64</sub> in the \`eu-north-1\` region.


<a id="org5b66c1e"></a>

# Mon 01 May 2023 02:40:31 PM CEST

Back after a break. From the three methods to get AMI, the terraform
looks like easiest to read and maintain. AWK is cool, but few people
know it well. And it depends on the Alma site working and not changing
the name of the file with list of the AMIs. Terraform solution needs
the AWS to be online, just like the rest of the project.

I've copied the main.tf file from what I wrote with Terraform Up and
Running. Need to slightly modify it before I can commit both the AMI
data source and the initial version of the main.tf.

I've also got an example file from ChatGPT. Had it explain the file
line by line. There are few differences between the file I had
already, but ChatGPT made good arguments on why the changes were
introduced.


<a id="org0a7cfdf"></a>

## Differences:


<a id="orgbc921a7"></a>

### Defined VPC and Subnet

VPC and Subnet are a must have if our infrastructure is not the only
one defined on that account. It's a good practice to define them, as
it enhances security by isolating this and other projects. Subnets
allow for even more network segregation.

They also allow usage of more advanced network tools like Network ACL
(Access Control Lists) and Route Tables.

-   I'm keeping the definitions.


<a id="orgb004158"></a>

### Explicitly defining egress traffic rules in the Security Group

I asked for explanation on why to do that, if the default AWS behavior
is to allow outbound traffic anyway. Reply was that it shows that all
outgoing traffic is allowed purposefully and also makes it easier to
understand our intentions for people reading our IaC.


<a id="org2d91a48"></a>

# Sun 07 May 2023 01:09:21 PM CEST

Replaced variable code parts like region, instance type or ports with
variables, defined in the vars.tf. Going to commit the first version
of Terraform files before taking on the SSH keys.

It's not proper to make huge commits with multiple changes. I'm
dividing changes into smaller commits. Divided it into commits with:
a decision on what would make Terraform part of the project complete,
adding the data source that fetches the AMI of latest Alma Linux,
adding the two alternatives of main.tf file,
finally consolidating the two files into one with some variables
separated into a vars.tf file.


<a id="orgc6ecabb"></a>

# Tue 09 May 2023 07:31:53 PM CEST

Time to solve the problem of SSH keys. I have no idea what are good
practices of SSH keys management when working with a project like
that.

Maybe I'll make a script that would auto generate such a key, put it
in a safe LUKS vault and also upload public key to AWS.


<a id="org2b257ed"></a>

## Generated instructions on how to create and upload an ssh key:

I understand your concern about SSH key management. Here's an approach you can consider for your project:

Generate a new ed25519 SSH key pair with a custom number of iterations for the key derivation function (KDF):

bash

ssh-keygen -t ed25519 -a <number<sub>of</sub><sub>iterations</sub>> \\
  -f <project<sub>location</sub>>/my<sub>project</sub><sub>key</sub>

Replace <number<sub>of</sub><sub>iterations</sub>> with the desired number of iterations (e.g., 100) and <project<sub>location</sub>> with the path to your project directory.

<a id="orge48c444"></a>:

hcl

resource "aws<sub>key</sub><sub>pair</sub>" "my<sub>project</sub><sub>key</sub>" {
  key<sub>name</sub>   = "my<sub>project</sub><sub>key</sub>"
  public<sub>key</sub> = file("<project<sub>location</sub>>/my<sub>project</sub><sub>key.pub</sub>")
}

Use the generated key pair when creating the EC2 instance:

hcl

resource "aws<sub>instance</sub>" "jenkins" {
  ami           = <ami<sub>id</sub>>
  instance<sub>type</sub> = "t2.micro"

key<sub>name</sub> = aws<sub>key</sub><sub>pair.my</sub><sub>project</sub><sub>key.key</sub><sub>name</sub>

}

Add the private key file (my<sub>project</sub><sub>key</sub>) to your .gitignore file to avoid accidentally committing it to your version control system.

Configure your Ansible inventory and playbook to use the generated private key when connecting to the remote host.

This approach will generate a project-specific SSH key pair in your
project directory, upload the public key to AWS, and associate it with
the EC2 instance. This allows you to manage the keys more efficiently
and avoid using a single key for multiple projects or machines.


<a id="org7b5e735"></a>

## Generated instructions on how to create a LUKS container for SSH key:

To create a small LUKS container to store your SSH key securely at rest, follow these steps:

Install the required packages for LUKS (Linux Unified Key Setup). On Debian/Ubuntu-based systems, you can use the following command:

bash

sudo apt-get install cryptsetup

On CentOS/RHEL/Fedora systems:

bash

sudo yum install cryptsetup

Create an empty file to use as the LUKS container. Here, we'll create a 10MB container:

bash

dd if=/dev/zero of=my<sub>ssh</sub><sub>key</sub><sub>container.img</sub> bs=1M count=10

Set up the LUKS container using the cryptsetup command:

bash

sudo cryptsetup luksFormat my<sub>ssh</sub><sub>key</sub><sub>container.img</sub>

This command will prompt you to enter a passphrase to protect the container. Make sure you choose a strong passphrase.

Open the LUKS container:

bash

sudo cryptsetup luksOpen my<sub>ssh</sub><sub>key</sub><sub>container.img</sub> my<sub>ssh</sub><sub>key</sub><sub>container</sub>

Enter the passphrase you set earlier when prompted.

Create a file system inside the container:

bash

sudo mkfs.ext4 /dev/mapper/my<sub>ssh</sub><sub>key</sub><sub>container</sub>

Mount the container to a directory:

bash

mkdir my<sub>ssh</sub><sub>key</sub><sub>mount</sub>
sudo mount /dev/mapper/my<sub>ssh</sub><sub>key</sub><sub>container</sub> my<sub>ssh</sub><sub>key</sub><sub>mount</sub>

Now you can copy the SSH key files into the mounted directory:

bash

sudo cp <project<sub>location</sub>>/my<sub>project</sub><sub>key</sub> my<sub>ssh</sub><sub>key</sub><sub>mount</sub>/
sudo cp <project<sub>location</sub>>/my<sub>project</sub><sub>key.pub</sub> my<sub>ssh</sub><sub>key</sub><sub>mount</sub>/

Set the appropriate ownership and permissions for the key files:

bash

sudo chown $(whoami):$(whoami) my<sub>ssh</sub><sub>key</sub><sub>mount</sub>/my<sub>project</sub><sub>key</sub>\*
sudo chmod 600 my<sub>ssh</sub><sub>key</sub><sub>mount</sub>/my<sub>project</sub><sub>key</sub>
sudo chmod 644 my<sub>ssh</sub><sub>key</sub><sub>mount</sub>/my<sub>project</sub><sub>key.pub</sub>

When you're done using the keys, unmount the container and close it:

bash

sudo umount my<sub>ssh</sub><sub>key</sub><sub>mount</sub>
sudo cryptsetup luksClose my<sub>ssh</sub><sub>key</sub><sub>container</sub>

This will create a LUKS container, store your SSH keys securely inside
it, and allow you to mount and unmount the container as needed. To
access the keys, you'll need to open the container with the
passphrase, mount it, and then use the keys from the mounted
directory.


<a id="org9d86b80"></a>

## Generated a script to create, open and close the container.

    #!/bin/bash
    
    set -e
    
    VAULT_DIR="vault"
    CONTAINER="$VAULT_DIR/my_ssh_key_container.img"
    MOUNT_POINT="$VAULT_DIR/my_ssh_key_mount"
    
    function create_container() {
      dd if=/dev/zero of="$CONTAINER" bs=1M count=30
      sudo cryptsetup luksFormat "$CONTAINER"
      sudo cryptsetup luksOpen "$CONTAINER" \
        my_ssh_key_container
      sudo mkfs.ext4 /dev/mapper/my_ssh_key_container
      sudo cryptsetup luksClose my_ssh_key_container
    }
    
    function open_container() {
      sudo cryptsetup luksOpen "$CONTAINER" \
        my_ssh_key_container
      sudo mkdir -p "$MOUNT_POINT"
      sudo mount /dev/mapper/my_ssh_key_container "$MOUNT_POINT"
    }
    
    function close_container() {
      sudo umount "$MOUNT_POINT"
      sudo cryptsetup luksClose my_ssh_key_container
    }
    
    case "$1" in
      create)
        create_container
        ;;
      open)
        open_container
        ;;
      close)
        close_container
        ;;
      *)
        echo "Usage: $0 {create|open|close}"
        exit 1
        ;;
    esac


<a id="org257e9fe"></a>

## V2 version of script for management of LUKS container

    # Here's the updated script that uses a SHELL_VARIABLE for the passphrase when creating and opening the LUKS container. The second script initializes the project and creates an SSH key inside the container.
    
    # vault_management.sh:
    
    # bash
    
    #!/bin/bash
    
    set -e
    
    VAULT_DIR="vault"
    CONTAINER="$VAULT_DIR/my_ssh_key_container.img"
    MOUNT_POINT="$VAULT_DIR/my_ssh_key_mount"
    PASS_VAR="VAULT_PASSPHRASE"
    
    function create_container() {
      dd if=/dev/zero of="$CONTAINER" bs=1M count=30
      echo -n "${!PASS_VAR}" | sudo cryptsetup luksFormat \
        --key-file=- "$CONTAINER"
      open_container
      sudo mkfs.ext4 /dev/mapper/my_ssh_key_container
      close_container
    }
    
    function open_container() {
      echo -n "${!PASS_VAR}" | sudo cryptsetup luksOpen \
        --key-file=- "$CONTAINER" my_ssh_key_container
      sudo mkdir -p "$MOUNT_POINT"
      sudo mount /dev/mapper/my_ssh_key_container "$MOUNT_POINT"
    }
    
    function close_container() {
      sudo umount "$MOUNT_POINT"
      sudo cryptsetup luksClose my_ssh_key_container
    }
    
    case "$1" in
      create)
        create_container
        ;;
      open)
        open_container
        ;;
      close)
        close_container
        ;;
      *)
        echo "Usage: $0 {create|open|close}"
        exit 1
        ;;
    esac


<a id="org5c56b77"></a>

## Generated a script to init the project, create the ssh key and the container. Also auto export passphrase so it can be used in the project.

    #!/bin/bash
    
    set -e
    
    VAULT_DIR="vault"
    MOUNT_POINT="$VAULT_DIR/my_ssh_key_mount"
    KEY_NAME="my_project_key"
    PASS_VAR="VAULT_PASSPHRASE"
    
    # Prompt for the passphrase
    echo -n "Enter the passphrase for the LUKS container and SSH key: "
    read -s PASSPHRASE
    echo
    export $PASS_VAR="$PASSPHRASE"
    
    # Create and open the LUKS container
    ./vault_management.sh create
    ./vault_management.sh open
    
    # Generate the SSH key inside the container
    echo -n "${!PASS_VAR}" | ssh-keygen -t ed25519 \
      -N "" -f "$MOUNT_POINT/$KEY_NAME"
    
    # Close the LUKS container
    ./vault_management.sh close

In this version, the vault<sub>management.sh</sub> script uses the passphrase
stored in the SHELL<sub>VARIABLE</sub> when creating and opening the LUKS
container. The init<sub>project.sh</sub> script initializes the project, creates
the container, generates an SSH key inside it, and then closes the
container. The passphrase is read once using read -s and stored in the
SHELL<sub>VARIABLE</sub>.


<a id="org1765292"></a>

# Sat 13 May 2023 12:59:08 PM CEST

A script to create, open and close the LUKS container will simplify
usage of the vault for SSH key and possibly other secrets.

A script to glue the whole Jenkins deployment process would also be
useful. It can use the vault<sub>management</sub> script to create, open vault
and generate an SSH key inside.

Initial vault management script is ready, but it shouldn't create a
container if there is one already.


<a id="orge24e9e8"></a>

# Sun 21 May 2023 03:33:45 PM CEST

General script for the project "execution", starting with
pseudocode. Eventually moving on to steps defined in bash. Expected
semi-production grade, but aiming at professional quality, easily
usable by non-experts.

Volume management and ssh creation automation can be a bit more rough.


<a id="orgf953a85"></a>

# Tue 30 May 2023 08:26:54 PM CEST

Another short sit down to the project, hopefully can get momentum back
up after a break.

Finishing up the vault<sub>management</sub> script.


<a id="orgb1b30d8"></a>

# Tue Jun  6 02:50:54 PM CEST 2023

Some really annoying thing happened to date, where as above, the year
got moved to the end of the date string printed by vanilla \`date\`
command. Only on Fedora, happened when updating from Fedora 36 to 38.
Might consider binding \`date +'%a %d %b %Y %X %Z'\` as \`date\`, but for
now can just use it to generate a proper date. So annoying when things
are not correct.


<a id="orge10fbac"></a>

# Tue 06 Jun 2023 02:53:54 PM CEST

I have a working container management script, but it doesn't detect if
container is already open and reports an error in this case. Fixing it
smells of Yak Shaving, so I'm leaving it as an extra TODO.


<a id="org7a23c7d"></a>

# Thu 08 Jun 2023 03:21:05 PM CEST

Starting pseudocode for the general project execution script. Would be
nice to find a better name for it.

For now it's called start<sub>project.sh</sub>.

Wrote all the main points of the project, from creating a VM, through
provisioning a Jenkins instance and configuring it (setting up a CI/CD
pipeline) to testing Jenkins by pushing a commit to the app repository
and testing if a new container has been build and pushed out.
It will probably become more detailed as the project develops.

Because there is a DJ playing at the airport where I'm sitting now,
and the master script is going play through all the points in the
script, I'm renaming it to playthrough.sh.


<a id="orgc528305"></a>

# Thu 08 Jun 2023 04:58:58 PM CEST

Defined some more steps in the playthrough.sh.


<a id="orgc5d55c4"></a>

# Sat 10 Jun 2023 02:58:43 PM CEST

Consultation with a friend revealed that using a LUKS Vault for
secrets is not a typical approach and Hashicorp's Vault would be
better. LUKS Vault is fine for now though. But upgrading the
vault<sub>management.sh</sub> is kind of pointless (if a similar amount of work
can be put into learning to use an industry standard tool).


<a id="orgce941ad"></a>

# Sun 11 Jun 2023 12:21:44 PM CEST

For testing purposes (integration testing of the whole project and
it's elements), it would be cool to have a kind of fall through switch
statement. So that we could (knowing first which number belongs to
which step in project's playthrough) execute only certain chain of
steps, maybe starting in the middle or not going all the way to the
end.

Bash doesn't have such a statement, but it can be simulated and even
improved by using a chain of if tests testing variables START<sub>POINT</sub>
and LAST<sub>POINT</sub>. So that for each step, the variables are tested and
they would prevent re-running non idempotent steps to avoid extra fun
(problems). Fully idempotent script is a goal, but it's lower priority
than having a working MVP of the project.

Example:

    START_POINT=2
    LAST_POINT=3
    
    STEP=1
    if [[ (( START_POINT <= STEP )) && (( LAST_POINT >= STEP )) ]]; then
      echo "step 1"
    fi
    STEP=2
    if [[ (( START_POINT <= STEP )) && (( LAST_POINT >= STEP )) ]]; then
      echo "step 2"
    fi
    STEP=3
    if [[ (( START_POINT <= STEP )) && (( LAST_POINT >= STEP )) ]]; then
      echo "step 3"
    fi
    STEP=4
    if [[ (( START_POINT <= STEP )) && (( LAST_POINT >= STEP )) ]]; then
      echo "step 4"
    fi

This would print:
step 2
step 3

Kinda cool, and copying and pasting can be used to save a lot of
writing.


<a id="orgcce42c6"></a>

# Tue Jun 13 11:54:45 AM CEST 2023

Got an idea that I can quickly find out if the current directory is
project's root dir by testing for the presence of a file. Same goes
for checking of vault accessibility.

To have a persistent vault password, it can be exported as a shell
variable. Exported shell variables are accessible from inside of
scripts run in the same shell, as proven with this script:

    ENV_VAR_NAME="var1"
    
    echo "This is the value of var ${ENV_VAR_NAME}:"
    echo "${!ENV_VAR_NAME}"
    exit 0


<a id="orga829190"></a>

# Wed 14 Jun 2023 09:39:44 AM CEST

Just solved an annoying bug, where a test for password length would
fail (and say that password is empty) because I miss-typed the
variable name. I then copied the whole test few lines later in code
(to make sure that password was properly assigned), which made the
typo named variable VAULT<sub>PASSHPRASE</sub> appear twice and not be detected
by shellcheck (Bash linter, static code analysis tool).

I even suspected there might be a typo, but it appeared correct on the
first pass. Man needs eagle eyes to spot typos for programming. That's
maybe even more important than being good at coming with algorithmic
solutions to abstract problems. A good solution is not worth much if
it doesn't work because of a typo.


<a id="org6576608"></a>

# Wed 14 Jun 2023 11:10:31 AM CEST

Vault management command is displaying the 'sudo warning' multiple
times. It's ok to only show it if the sudo password hasn't been
recently entered. There is a way to check for cached sudo password
with a non interactive sudo command, (sudo -n), for example \`sudo -n
true\` and then testing the result.

Running \`playthrough.sh 1 2\` (to execute steps 1 and 2) works well,
whether user has exported a vault passphrase or types it in. Vault
creation and access test works, whether it had to be created, opened
or just accessed. Can commit changes.


<a id="orgcabc7b9"></a>

# Wed 14 Jun 2023 02:31:55 PM CEST

Time to generate the SSH key. Best practices for SSH key generation on
Linux can be found in this stack exchange answer:
<https://security.stackexchange.com/a/144044>
In short, use the ed25519 as the type of the key, if using passphrase,
have 100 rounds of hashing algorithm and also have a comment for the
key that says what it's used for.

Since this key is meant for automatic use with Ansible, we could do
without a passphrase (especially since it's kept in a safe place). On
the other hand, it's not really a fully automatic use-case, since we
are explicitly going to run the Ansible playbooks. Then it doesn't
really matter if we use the passphrase in addition to the vault's
password. To make things simpler, I'm not using passphrase for now.


<a id="org5976b6e"></a>

# Wed 14 Jun 2023 04:53:32 PM CEST

Now it's time to add the SSH key uploading step to playthrough.sh.

[This AI generated snippet](#orge48c444) for uploading the SSH key differs a little
from documentation at
[this address](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/key_pair).

The difference is usage of a special function that is something like
bash substitution, during execution it is replaced/substituted with
the file it links to. I'm going to test it to make sure that AI didn't
just hallucinate this solution. Otherwise I would have to create some
extra Terraform file, not tracked by git, for secrets.


<a id="org93a6e92"></a>

# Thu 15 Jun 2023 01:24:53 PM CEST

Spent almost an hour debugging issues with Terraform. It looked like a
network issue, especially since I don't have internet at home at the
moment (using USB tethering from mobile). It was a dead end, but the
address that Terraform reported as not working was
"<https://sts.var.aws_region.amazonaws.com/>",
which looked like a variable not being properly expanded. Error
message even pointed to the offending line, where instead of a
variable reference I used a literal string, by encapsulating the
variable reference in double quotes.

    provider "aws" {
      # region = "var.aws_region" # THIS IS WRONG
      region = var.aws_region
    }

I wonder why wasn't the error reported before. Maybe because it is
only checked once when initializing the project?


<a id="orgdf59b92"></a>

# Thu 15 Jun 2023 01:57:37 PM CEST

Another issue during testing of the ssh key creation, but not
connected to the ssh key pair itself. Usage of Alma Linux AMI requires
accepting of their Terms of Use. Nothing special there, just regular
"it's not our fault if you burn yourself with hot coffee drank from
this cup" type of message, but about usage of a Linux OS. Still, it
might be smart to switch to AWS Linux just to make the project
execution process easier.

    │ Error: creating EC2 Instance: UnsupportedOperation: The instance
    configuration for this AWS Marketplace product is not
    supported. Please see the AWS Marketplace site for more information
    about supported instance types, regions, and operating systems.

Looks like I'm not meant to use Alma Linux. Falling back to AWS Linux
which also is some kind of free Red Hat Enterprise Linux spin-off,
just a little more stable than Fedora. I'm not sure I can use AWS
Linux images for local testing, as I'm planning to write the Ansible
playbook based on Jenkins documentation for manual installation. But
hopefully, differences between local Vagrant Alma/Rocky installation
and AWS Linux in the cloud will remain minimal.


<a id="orgb4f788f"></a>

# Thu 15 Jun 2023 02:49:19 PM CEST

Trying to use the Alma Linux finder Terraform data source as a
template for a data source that finds the latest Amazon Linux AMI.

It doesn't work and is quite frustrating. Trying manually entering the
AMI ID of ami-04e4606740c9c9381. Manual entering is going to break if
a potential user chooses a different AWS region.


<a id="org06b827a"></a>

# Sat 17 Jun 2023 01:05:28 PM CEST

Automatic AMI finder doesn't work, because it gets too many hits and
then chooses the most recent out of them. I could remove the order to
choose the most recent and do something to limit the amount of
hits. Maybe somehow pin a specific version of AWS Linux through some
version number? Or some regex? Or some main version number and regex
to still allow for automatic upgrade to higher versions as they come?

Need internet to verify that the SSH key generation steps work. After
we have a confirmed working process for creation of vault, ssh key and
VM with key baked in, we are off to write Ansible playbooks.

There is an issue with new VM not having an external IP address
assigned. I have a hunch it's connected to using VPC and subnet. Going
to look into the examples from Terraform Up and Running and see if I
notice any obvious mistakes and then try a lucky shot online. It might
be a good idea to timebox it, maybe one pomodoro for the book and one
for online search. When time runs out, I'll ask ChatGPT for help (like
I'd normally ask a more senior engineer at work).


<a id="orgc25de51"></a>

# Sat 17 Jun 2023 05:19:27 PM CEST

Found the culprit: I've most likely used a private subnet. When
creating most basic Terraform projects, we use the default VPC/subnet
(which are ways to segment our workloads), which are public. If we
create a new subnet, it's private by default. However, only public
subnets can be reached from outside and therefore only public subnets
have public IP addresses assigned to them. I have to somehow define my
subnet as public to be able to connect to it.

There is some wisdom behind having default subnets private, because in
a properly set up cloud infrastructure, all our workload is sitting in
private subnets, where it can only communicate with other machines in
our private cloud. The only instances that are set up in public subnets
are either reverse proxies (which are super hardened down) and/or load
balancers.


<a id="org820a414"></a>

# Sun 18 Jun 2023 12:32:43 PM CEST

Just adding "map public ip on launch" parameter didn't help. But
Terraform applies changes without killing the already existing
machines, maybe need to re-deploy for it to take effect. Changed
subnet definition:

    resource "aws_subnet" "jenkins" {
      vpc_id                  = aws_vpc.jenkins.id
      cidr_block              = "10.0.1.0/24"
      map_public_ip_on_launch = true
      tags = {
        Name = "JenkinsSubnet"
      }
    }

Success! We have a public IP.


<a id="orgdada656"></a>

# Sun 18 Jun 2023 02:46:28 PM CEST

Can't connect with my ssh key.
Using netcat to check if there is any available service on port 22
doesn't work either (used command was \`nc -vz $PUBLIC<sub>IP</sub> 22, where v
is for verbose and z for not trying to establish connection but just
check if service is up). I get timeout on netcat and on ssh.

Going to try to create a machine with EC2 console (without Terraform)
to check if there isn't something wrong with my ssh keys. This would
point to errors in my Terraform configuration.

I created a machine in the same VPC and subnet as the Terraform
machine and it didn't work. Then I created one with the same ssh key
uploaded by Terraform, in default VPC, without specifying a subnet and
using some earlier created security group named sshOn22 which I guess
allows TCP traffic to port 22. This one worked. Conclusion: something
is wrong with VPC, subnet or security group.

I've shown my VPC, subnet and security group Terraform code to ChatGPT
and told him that the error was singled out to network
misconfiguration. It suggested that there should be something called
an internet gateway defined for the VPC and that without it there
won't be connecting anything from the internet to the VPC. I'll add
this code to Terraform configuration and see if it works:

    resource "aws_internet_gateway" "jenkins" {
      vpc_id = aws_vpc.jenkins.id
    
      tags = {
        Name = "JenkinsIGW"
      }
    }

Still no luck.


<a id="org827e719"></a>

# Mon 19 Jun 2023 05:40:59 PM CEST

Searched the whole Terraform Up and Running but found no solutions to
how to define a publicly accessible subnet (searched word was
VPC). The book assumes it to be trivial and just mentions that in any
production grade infrastructure we shouldn't use the default VPC or
use public subnets for workload that doesn't have to be accessed from
the internet.

Tried my luck with a web search and had some luck with blog posts
about setting up a public subnet on AWS using Terraform that were
fairly recent. [This one](https://medium.com/geekculture/how-to-manage-public-and-private-subnets-in-aws-with-terraform-69c272003c81) seems to do what I wanted to achieve. There
are several more steps included in deploying a publicly accessible
subnet that aren't mentioned (or which I haven't seen) in either
documentation or ChatGPT generated solutions.

I have to mention something I really liked in the way Dhruvin Soni
wrote his Terraform code. He separated parts of the defined
infrastructure into smaller files, instead of having VPC, subnet,
security groups, all in the main.tf file. I think this way it might be
more readable. Or at least for a beginner like me.

It might be
actually annoying to have


<a id="org68eb226"></a>

# Mon 19 Jun 2023 05:51:44 PM CEST

Following instructions in the [blog post](https://medium.com/geekculture/how-to-manage-public-and-private-subnets-in-aws-with-terraform-69c272003c81) for deploying a private and public subnet on AWS using Terraform.


<a id="org95a2045"></a>

## Planning:

I'll create this infrastructure copying the solution from the blog
word for word in a separate directory. After confirming that it works,
I'll note the differences between the working infrastructure and what
I had. Afterwards I'll use the notes to modify mine to comply with the
working one and hope it will be what's needed. From skimming the
document quickly, I guess that my problem was not adding the routing
table to the public subnet, but it might not be everything.


<a id="org277c697"></a>

## DONE Create a file for VPC


<a id="org65bc94d"></a>

## DONE Create a file for Public Subnet


<a id="org3763a44"></a>

## DONE Create a file for Internet Gateway


<a id="org144e450"></a>

## DONE Create a file for the Route Table for the Public Subnet


<a id="org48115bc"></a>

## DONE Create a file for the Security Group


<a id="orgb9e1583"></a>

## DONE Create a file for the Public EC2 Instance


<a id="org5d747b5"></a>

## DONE Create a variable file


<a id="orgd0f4366"></a>

## DONE Creating a NAT with an Elastic IP - what I'm not going to do.


<a id="org094729f"></a>

### Create a file for the Public Subnet for NAT Gateway


<a id="orgfc98a36"></a>

### Create a file for Elastic IP (EIP)


<a id="orgbd73996"></a>

### Create a file for the NAT Gateway


<a id="org79d3c06"></a>

### Create a file for the Route Table for the NAT Gateway


<a id="org006869e"></a>

### Create a file for the Private Subnet


<a id="org516e1f8"></a>

### Create a file for the Route Table for the Private Subnet


<a id="orgee84852"></a>

### Create a file for the Private EC2 Instance


<a id="orgc908b0d"></a>

## DONE Run and see if it works


<a id="org2d9e2ff"></a>

### Strange error, looked like one line was "disappeared" in Emacs.

Terraform signaled an error of redefining type. This type of error
happens if we have a double definition of something that can only be
defined once.

I didn't see anything wrong in the file. Turning on the 'linum-mode'
in Emacs showed, that there was one line that "disappeared". Line 4
was right after the second line. I didn't investigate, just went to
the end of line 2 and held delete until I deleted the phantom line.


<a id="orgf4549c7"></a>

### Had to add the ssh key uploading code.

I thought I can just link the name of the key uploaded by the flask
terraform code. It didn't work, maybe because 'terraform destroy'
destroys also SSH keys that are defined in the project. I just copied
what had to be copied and got the ssh-key name using terraform
variable substitution instead of the name I could get from AWS. Thanks
to writing out all the code I feel like I'm getting the hang of
Terraform. At least the hang of how things tend to be named and how to
get id's or inside-secret-names of things, using variables.


<a id="org4ee064a"></a>

## DONE Find the differences

Differences were the routing table and routing table association.


<a id="orgb554845"></a>

## DONE Add them to flask-ci-cd Terraform code.

Added all networking infrastructure code to main.tf.


<a id="org61d2281"></a>

# Thu 22 Jun 2023 06:28:17 PM CEST


<a id="orgcabd717"></a>

## Creating a file with secrets in the vault


<a id="org8a347cb"></a>

### Secrets are: VM IP address, AWS access keys (danger!!), maybe also instance type, region and some other things that come up later on.

-   I'd rather not store AWS access keys. Maybe they can be exported to a environment variable, like the way I'm authorizing at the moment?

-   If we could somehow test if we have AWS access to stand up a virtual machine? Then there would be no need to ask for the AWS keys. There are a few ways one can authorize Terraform to work on his behalf.


<a id="org2d3eb53"></a>

### At first the data will be entered manually.


<a id="org88889f7"></a>

### Later on there also will be an option to start the playthrough.sh script with an interview asking for all the required settings.


<a id="org219ce7c"></a>

### To keep things safe, a trap can be added to playthrough.sh that would close the files.


<a id="org6d52248"></a>

# Sat 08 Jul 2023 04:29:38 PM CEST


<a id="orgb234e1f"></a>

## Having a shot at doing some tests with Ansible using given ssh key.


<a id="org11898d6"></a>

## Problems with EC2 key pair - it already exists.


<a id="orgb387c7c"></a>

### Prompt:

Error in terraform, probably because the key has already been uploaded before. How to make terraform upload key only if it doesn't exist yet?
Here is the error and code from main.tf

aws<sub>key</sub><sub>pair.jenkins</sub>-key: Creating&#x2026;
╷
│ Error: importing EC2 Key Pair (cicd-project-key): InvalidKeyPair.Duplicate: The keypair already exists
│       status code: 400, request id: ba2b8cd1-53de-43d0-b63b-d5c5f821efff
│ 
│   with aws<sub>key</sub><sub>pair.jenkins</sub>-key,
│   on main.tf line 79, in resource "aws<sub>key</sub><sub>pair</sub>" "jenkins-key":
│   79: resource "aws<sub>key</sub><sub>pair</sub>" "jenkins-key" {
│

resource "aws<sub>key</sub><sub>pair</sub>" "jenkins-key" {
  key<sub>name</sub>      = "cicd-project-key"
  public<sub>key</sub>    = file("../vault/my<sub>ssh</sub><sub>key</sub><sub>mount</sub>/id<sub>25519</sub><sub>aws</sub><sub>flaskcicd.pub</sub>")
}

resource "aws<sub>instance</sub>" "jenkins" {
  ami           = "ami-04e4606740c9c9381"

instance<sub>type</sub> = var.instance<sub>type</sub>

key<sub>name</sub>      = aws<sub>key</sub><sub>pair.jenkins</sub>-key.key<sub>name</sub>


<a id="org403c8e9"></a>

### Answer:

Terraform does not natively support conditional creation of resources. However, you can work around this limitation by using a combination of a data block and a resource block.

First, you can use a data block to check if the key pair already exists:

hcl

data "aws<sub>key</sub><sub>pair</sub>" "existing" {
  key<sub>name</sub> = "cicd-project-key"
}

Then, you can use a resource block to create the key pair only if it does not already exist. You can do this by using the count parameter and the aws<sub>key</sub><sub>pair.existing</sub> data source:

hcl

resource "aws<sub>key</sub><sub>pair</sub>" "jenkins-key" {
  count       = data.aws<sub>key</sub><sub>pair.existing</sub> ? 0 : 1
  key<sub>name</sub>    = "cicd-project-key"
  public<sub>key</sub>  = file("../vault/my<sub>ssh</sub><sub>key</sub><sub>mount</sub>/id<sub>25519</sub><sub>aws</sub><sub>flaskcicd.pub</sub>")
}

In this code, the count parameter is set to 0 if the key pair already exists (which means the resource will not be created), and 1 if it does not (which means the resource will be created).

Finally, you can modify the aws<sub>instance</sub> resource block to use the existing key pair if it exists, and the new key pair otherwise:

hcl

resource "aws<sub>instance</sub>" "jenkins" {
  ami           = "ami-04e4606740c9c9381"
  instance<sub>type</sub> = var.instance<sub>type</sub>

  key<sub>name</sub>      = data.aws<sub>key</sub><sub>pair.existing</sub> ? data.aws<sub>key</sub><sub>pair.existing.key</sub><sub>name</sub> : aws<sub>key</sub><sub>pair.jenkins</sub>-key[0].key<sub>name</sub>
}

In this code, the key<sub>name</sub> parameter is set to the name of the
existing key pair if it exists, and the name of the new key pair
otherwise. Note the use of [0] to access the first (and only) element
of the aws<sub>key</sub><sub>pair.jenkins</sub>-key resource, since it is a list due to
the use of the count parameter.

Planning failed. Terraform encountered an error while generating this plan.


<a id="orgba9d7b2"></a>

### Error: Incorrect condition type

│ 
│   on main.tf line 86, in resource "aws<sub>key</sub><sub>pair</sub>" "jenkins-key":
│   86:   count         = data.aws<sub>key</sub><sub>pair.existing</sub> ? 0 : 1                 
│     ├────────────────
│     │ data.aws<sub>key</sub><sub>pair.existing</sub> is object with 12 attributes                      
│ 
│ The condition expression must be of type bool.
╵


<a id="org130bdde"></a>

### Answer:

I apologize for the confusion earlier. The \`data.aws<sub>key</sub><sub>pair.existing</sub>\` is an object, not a boolean. We need to check if the key pair exists by checking if the key pair's \`key<sub>name</sub>\` attribute is not \`null\`.

Here's how you can modify the \`count\` parameter to do this:

\`\`\`hcl
resource "aws<sub>key</sub><sub>pair</sub>" "jenkins-key" {
  count       = data.aws<sub>key</sub><sub>pair.existing.key</sub><sub>name</sub> != null ? 0 : 1
  key<sub>name</sub>    = "cicd-project-key"
  public<sub>key</sub>  = file("../vault/my<sub>ssh</sub><sub>key</sub><sub>mount</sub>/id<sub>25519</sub><sub>aws</sub><sub>flaskcicd.pub</sub>")
}
\`\`\`

In this code, the \`count\` parameter is set to \`0\` if the key pair's \`key<sub>name</sub>\` attribute is not \`null\` (which means the key pair exists), and \`1\` if it is \`null\` (which means the key pair does not exist).

Please note that this will only work if the data source does not
produce an error when the key pair does not exist. If it does produce
an error, you may need to use a different method to check if the key
pair exists.


<a id="org7ebfc87"></a>

### Summary:

Conditionals in hcl don't automatically substitute 'null' or boolean
'no' for structures that don't exist.

      #But we can compare them (thestructure) to a null with
      # logical equals (==) or not_equals (!=) operators:
    key_name      = (data.aws_key_pair.existing != null ?
      data.aws_key_pair.existing.key_name :
      aws_key_pair.jenkins-key[0].key_name)

Also, when using 'count' to create only a certain number of resources,
it's changing that resource into a list, so even if we only have one
of these items, we need to refer to it as to the first element of an
array. C trick doesn't work here, address of the array is not same as
the address of it's first element.


<a id="orgc04c01a"></a>

# Sun 09 Jul 2023 05:44:10 PM CEST

I'd like the terraform to auto update the hosts.ini file.
It's possible, I used a null<sub>resource</sub> and provisioner "local-exec" in
it, where I run a bash script, passing the IP address as an argument
to the bash script.

At first it only run once, but then I modified it to make it run every
time. Here is the ChatGPT convo:


<a id="org0dc5ad6"></a>

## But I want to pass some data to it (namely in IP address). What format should I use to perform variable substitution when running the script from terraform, so that the script receives the ip address string as one of it's parameters?

You can pass variables to the script by including them in the command string. Here's an example of how you might do it:

hcl

resource "null<sub>resource</sub>" "ansible<sub>inventory</sub><sub>edit</sub>" {
  provisioner "local-exec" {
    command = "bash ${path.module}/edit<sub>inventory.sh</sub> ${self.private<sub>ip</sub>}"
  }
}

In this example, ${self.private<sub>ip</sub>} is a placeholder for the actual IP address you want to pass to the script. You would replace this with the actual Terraform expression that gets the IP address you want.

Then, in your bash script, you can access this IP address as an argument:

bash

\#!/bin/bash

IP<sub>ADDRESS</sub>=$1

INVENTORY<sub>FILE</sub>="/path/to/your/inventory.ini"

sed -i "s/IP<sub>ADDRESS</sub><sub>PLACEHOLDER</sub>/$IP<sub>ADDRESS</sub>/g" $INVENTORY<sub>FILE</sub>

In this script, $1 is a special variable that holds the first argument
passed to the script. The script then uses sed to replace the
placeholder text "IP<sub>ADDRESS</sub><sub>PLACEHOLDER</sub>" with the actual IP address
in the inventory file. You would replace "IP<sub>ADDRESS</sub><sub>PLACEHOLDER</sub>" with
whatever placeholder text you have in your inventory file.


<a id="orga682bde"></a>

## How to make this 'null resource' work every time, so that it updates the file every time, not just when resource is "created"?

The \`null<sub>resource</sub>\` in Terraform is a resource that allows you to configure provisioners that are not directly associated with a single, specific resource. By default, the provisioners associated with a \`null<sub>resource</sub>\` are only run when the \`null<sub>resource</sub>\` is created, and not when it is updated.

However, you can force the \`null<sub>resource</sub>\` to be recreated every time you run \`terraform apply\` by using the \`triggers\` argument. The \`triggers\` argument is a map of arbitrary strings that, when changed, will cause the resource to be replaced, thus re-running the provisioners.

Here's an example of how you might use it:

\`\`\`hcl
resource "null<sub>resource</sub>" "ansible<sub>inventory</sub><sub>edit</sub>" {
  triggers = {
    always<sub>run</sub> = "${timestamp()}"
  }

  provisioner "local-exec" {
    command = "bash ${path.module}/edit<sub>inventory.sh</sub> ${self.private<sub>ip</sub>}"
  }
}
\`\`\`

In this example, the \`timestamp()\` function returns the current date
and time. Since this value changes every time you run \`terraform
apply\`, it will cause the \`null<sub>resource</sub>\` to be recreated, and the
provisioners to be re-run, every time.


<a id="org3d9e655"></a>

# Fri 14 Jul 2023 01:33:57 PM CEST


<a id="org0bea49f"></a>

## Would be cool to have some kind of Backlog? Or should I use the TODO list at the end of docs?

The documentation file should be one.


<a id="orge51dfa0"></a>

## It felt weird and unnatural to use $PROJECT<sub>ROOT</sub>/vault/ssh<sub>key</sub><sub>mountpoint</sub> as the mountpoint for the vault. Changed it so that the /vault is the mountpoint for vault and the LUKS image sits at /vault.img.


<a id="org22c8f22"></a>

# Sat Jul 22 12:22:18 PM CEST 2023

Ready to start with Ansible part of the project, as the absolute
minimum is already done by Terraform, namely creating a VM on AWS and
putting it's IP address in Ansible's inventory file.

Inventory file needs to be stripped from the IP address(es) before
it's committed. Git has a functionality called post and pre-commit
hooks for such occasions. These are scripts executed by git
automatically on specific triggers.

It's not an essential functionality, but work to improve work,
therefore I don't feel it's wrong to use ChatGPT to do it.


<a id="org4c20ea2"></a>

## Prompt: I would like to commit Ansible's hosts.ini file, but there are IP addresses inside.

How can I have git run a script stripping a specific line in the file
before commiting? Don't need a regexp to detect IPs since I can locate
the file and the IP is placed in double quotes after an equal (=)
sign.


<a id="orge1804ff"></a>

### Answer: You can use a Git hook to automate this process. Git hooks are scripts that Git executes before or after events such as commit, push, and so on.

They're a built-in feature - no need to download anything. They
are stored in the .git/hooks directory.

In your case, you can use a pre-commit hook to modify the hosts.ini
file before it gets committed. Here's a simple example of how you
could do this:

Navigate to your repository's .git/hooks directory.

Create a new file named pre-commit (no file extension).

Open the file in a text editor and add the following bash script:

bash

\#!/bin/sh

FILE="path/to/your/hosts.ini"

cp $FILE "$FILE.bak"

sed -i 's/=".\*"/="0.0.0.0"/g' $FILE

git add $FILE

Save and close the file.

Make the pre-commit hook executable by running chmod +x pre-commit
in your terminal.

Now, every time you run git commit, the pre-commit hook will replace
all IP addresses in your hosts.ini file with 0.0.0.0 before the commit
is created.

Please note that this will modify the actual hosts.ini file in your
working directory. If you want to keep the original IP addresses in
your working directory, you could create a copy of the hosts.ini file,
modify the copy, commit the copy, and then delete the copy. However,
this would mean that the hosts.ini file in your repository would
always have the placeholder IP addresses, not the real ones.

Also, remember to restore the original hosts.ini file after the
commit, if necessary. You can do this by adding a post-commit hook
that restores the hosts.ini file from the hosts.ini.bak backup.


<a id="orgd0ee60c"></a>

### Followup prompt: Would it run everytime or only when the hosts.ini is staged?

The \`pre-commit\` hook, as written, will run every time you execute
\`git commit\`, regardless of whether \`hosts.ini\` is staged or not. It
will replace the IP addresses in \`hosts.ini\` and add the modified file
to the commit.

If you want the script to only run when \`hosts.ini\` is staged, you can
modify the script to check if \`hosts.ini\` is in the list of staged
files before performing the replacement. Here's an example of how you
could do this:

\`\`\`bash
\#!/bin/sh

FILE="path/to/your/hosts.ini"

if git diff &#x2013;cached &#x2013;name-only | grep &#x2013;quiet "$FILE"; then

cp $FILE "$FILE.bak"

sed -i 's/=".\*"/="0.0.0.0"/g' $FILE

  git add $FILE
fi
\`\`\`

In this version of the script, \`git diff &#x2013;cached &#x2013;name-only\` lists
the names of all staged files, and \`grep &#x2013;quiet "$FILE"\` checks if
\`hosts.ini\` is in that list. The rest of the script only executes if
\`hosts.ini\` is staged.


<a id="org6b748c3"></a>

## There are only minor errors in ChatGPT script generated that I see initially.

We'll see if and how it works. I could make a regexp to catch any IP
addresses, but for now it's ok to just edit the line starting with
'jenkins'.

The 'git add' command puts the file in cache as it is, so we can
revert the file to backup right after we perform the add. At least
that's how I understand it.

It worked with a minor issue - magit (Emacs git handler) keeps showing
the hosts.ini as modified (since the IP address it sees is not equal
to the placeholder XXX that sits in repo), but I can live with that.

I like that now the config file can be tracked in repo, since it makes
it easier for new people to understand and use it.


<a id="org838cfa0"></a>

# Sun Jul 23 08:19:51 PM CEST 2023


<a id="orgb9a02d4"></a>

## Created a pre-commit hook for git to remove IP addresses form Ansible's hosts.ini file.

In the process I've learned about what special characters for bash sed
have to be escaped inside single quotes:


<a id="org4fe9b8c"></a>

### curly braces \\{  - (for regex repetition pattern)


<a id="orgeae91ae"></a>

### round braces \\(  - (for regex block to be f.ex. repeated)


<a id="org81c39f2"></a>

### dot . if we need literal dot \\.


<a id="org79d0d04"></a>

## pre-commit script in the final form:

    #!/bin/bash
    
    # # log function for debugging
    # log(){
    #   echo "$(date +%F+%T):${*}" \
    #        >> hook-debug.$(date +%F).log
    # }
    
    # Path to your hosts.ini file
    FILE="ansible/hosts.ini"
    
    # Check if hosts.ini is staged
    if git diff --cached --name-only \
        | grep --quiet "${FILE}"
    then 
      # Backup original file
      cp -p "${FILE}" "${FILE}.bak"
    
      # Define a regexp catching IP addresses
      IP_REGEX='\([0-9]\{1,3\}\.\)\{3\}[0-9]\{1,3\}'
    
      # Replace IP addresses with placeholder
      sed -i \
        '/ansible_host="'"${IP_REGEX}"'"/s/=".*"/="XXX"/' \
        "${FILE}"
    
      # Add the modified file to the commit
      git add "${FILE}"
    
      # Copy back the backup file
      mv "${FILE}.bak" "${FILE}"
    fi
    
    exit 0


<a id="org6632888"></a>

# Mon Jul 24 12:19:04 PM CEST 2023


<a id="org5ad34f1"></a>

## Run into some issues starting a Vagrant project. Vagrant complained on it's plugins. I also had to force Vagrant to use libvirt as it's plugin. When looking into info on Vagrant found out that there is a Vagrant flavor vagrant-libvirt that uses kvm/quemu (instead of Virtualbox) as it's default provider.


<a id="org18a1f53"></a>

## Had to install libvirt-devel, then libvirt and then enable libvirt service.


<a id="org899d2a0"></a>

## Hard to find a correct box. Since the last RedHat drama (some business people thought someone will switch from rocky/alma to RH if they ban RH rebuilds), Geerling said he is switching his work to Debian. No official vagrant box from RedHat, no CentOS box either. No rocky box. Looks like Alma Linux people do release a vagrant image. It's called 'almalinux/9'.


<a id="org3c803d0"></a>

## Got a vagrant box working


<a id="org8d0770b"></a>

## And got Jenkins working using instructions from Jenkins docs


<a id="orgdea1ade"></a>

# Wed Aug  2 01:48:49 PM CEST 2023


<a id="orgb1dcbef"></a>

## Got to translate the Jenkins installation instructions from Jenkins' docs (bash) to an Ansible playbook.


<a id="orgfc3e55a"></a>

## First going to put the instructions in one file


<a id="orgbbeb62e"></a>

## Actually, first going to nuke the local VM and check if installing Jenkins installs also firewalld configuration, which would simplify firewall setup.

In the process cleaned up the installation script a little.

Found Jenkins service. Reloading firewall and testing if it works.
It works, have to remember about the &#x2013;permanent option and to reload the firewall afterwards. Added these to the script.


<a id="org13e8d73"></a>

## Had some error when changed the name of the mountpoint in the playthrough.sh. Used 'sudo rm /dev/mapper/LUKS<sub>CONTAINER</sub><sub>NAME</sub>' to delete the old container that didn't want to cooperate.

Maybe I could add a check for it in the vault management script.
The 'rm' command wasn't enough. What did the job was using 'cryptsetup close my<sub>project</sub><sub>container</sub>'.


<a id="org37a5a59"></a>

# Fri Aug  4 10:40:53 AM CEST 2023

Debugging the playbook.


<a id="org9d57de3"></a>

## The 'firewalld' module in Ansible didn't work.

Module documentation said to test if it's present with 'ansible-galaxy
collection list'. It returned nothing. Docs said that the module
should've been installed with a regular Ansible install, (dnf package
'ansible') but not when installing only ansible-core. So I tried
installing the 'ansible' package and it started installation - looks
like I only had ansible-core installed.


<a id="org9fa4b4a"></a>

## Had issues connecting to the local VM using the key generated for Ansible

There was some glitch with ssh-copy-id, where it thought the key
submitted in the command was already installed while it wasn't. Had to
modify the ssh-copy-id command to include the -f (force) flag, which
solved the problem.

    # Copying the key (forcefully)
    ssh-copy-id -fi ../vault/id_25519_aws_flaskcicd.pub -o "IdentityFile /home/igi/Coding/projekty/cv-portfolio/python-flask-cicd/vagrant/.vagrant/machines/jenkins/libvirt/private_key" vagrant@jenkins
    
    # Checking if the key got copied
    ssh jenkins 'cat ~/.ssh/authorized_keys'


<a id="org67d4a97"></a>

## Another problem connecting to the local VM - Ansible interpreted ssh options from hosts.ini as host definitions. Turns out, that a proper way to set variables for a group is to name a subsection [GROUPNAME:vars].


<a id="orgcd7e6dd"></a>

## Problem with adding of the Jenkins repo - cannot download repodata/repomd.xml

    # Code in question:
        - name: Add the Jenkins repo
          yum_repository:
            name: jenkins
            description: jenkins stable repo
            baseurl: https://pkg.jenkins.io/redhat-stable/jenkins.repo
            gpgcheck: yes

Looks like the general way of using the yum<sub>repo</sub> module is correct,
but the repo link I used from the Jenkins documentation shell script
is not correct. This is a link to the repository configuration file
and not the actual repository. We need to go one directory level
up. Trying again with <https://pkg.jenkins.io/redhat-stable>


<a id="org1dca687"></a>

## Error in the 'service' module. "This module does not currently support using glob patterns, found '[' in service name: ['jenkins', 'firewalld']".

Looks like it's about the way YAML works. ChatGPT claimed that the
Ansible version I was using should be high enough for the service
module to accept a list. I used a list in a 'block style', (each element
on a new line, prepended with a dash). ChatGPT suggests going around
this limitation using a loop, but I'll first check if it will work
using the 'flow style' list (each element on the same line, coma separated).

Problematic piece of code:

    - name: Start and enable jenkins and firewalld services
      service:
        # (block list)
        # name:
        #   - jenkins
        #   - firewalld
        # (flow list)
        name: jenkins, firewalld
    
        state: started
        enabled: yes

It didn't work either, will create a loop. I wonder which is a better
alternative, loop or with<sub>items</sub>?
Looks like it's the loop, because it's more robust (accepts complex
data types, not just lists). 'with<sub>items</sub>' is here for backwards
compatibility.


<a id="org2a01446"></a>

## Ansible Firewalld module says that the Jenkins service is absent. Pretty sure I checked it before and it wasn't.

There is a command to list all pre-defined services - 'firewall-cmd
&#x2013;get-services' (&#x2013;list-services lists only the active ones).

    ssh jenkins 'sudo firewall-cmd --get-services' | grep -q jenkins && echo "Found jenkins" || echo "No jenkins"
    Found jenkins

So the 'jenkins' service is here, but the Ansible module can't see
it. Maybe I need to name it some other way? I could "just make it
work" by adding the tcp port 8080, but nothing looks more confusing
than a list of seemingly random ports when looking at firewall
settings.

The 'jenkins' service name was supplied to the firewalld module in the
form of a block list. Changed it to a simple parameter. That was
it. The module expected a string with the name (or maybe names too?)
of the service/s and I supplied a list.


<a id="org4b4e527"></a>

## Can't connect to the Jenkins web server. Looks like firewall misconfiguration.

[igi@fedora ansible]$ nc -z 10.11.12.5 8080 && echo true || echo false
false
[igi@fedora ansible]$ ssh jenkins 'nc -z localhost 8080 && echo true || echo false'
true
[igi@fedora ansible]$ ssh jenkins 'sudo firewall-cmd &#x2013;list-services'
cockpit dhcpv6-client ssh

For some reason, Ansible's change of firewall settings didn't
hold. Maybe the firewalld module doesn't reload the firewall
automatically?

I'm on a plane right now and the playbook fails on the first task
(can't get the key). In ansible-playbook manual there is a parameter
called '&#x2013;start-at-task TASK<sub>NAME</sub>'. When supplied with the name
string, it did start with the firewall setup task.

Since there's no internet, I'll try to find an example in the Ansible
for DevOps book.

Found an example in the server hardening chapter. Looks like it's a
common error and it's caused by the "permanent: yes" parameter. In
case we use 'permanent', we need to add another parameter "immediate:
yes" to have the firewall changes applied immediately.

[igi@fedora ansible]$ ssh jenkins 'sudo firewall-cmd &#x2013;list-services'
cockpit dhcpv6-client jenkins ssh
[igi@fedora ansible]$ nc -z 10.11.12.5 8080 && echo true || echo false
true

Now the Jenkins service is properly listed and netcat says it can
connect to port 8080. The webpage loads too. We can say that the
deployment of a basic Jenkins installation was successful.


<a id="org328bab3"></a>

# Sat 12 Aug 2023 04:33:17 PM CEST

Needed refreshing information on the theory behind CI/CD. The ULSAH
(Unix-Linux System Administrator's Handbook) has a concise and
interesting chapter on it.


<a id="orga3da678"></a>

# Thu Sep  7 08:17:31 PM CEST 2023

Wasted over 30 min because the code for management of Vault is too
brittle. It should tolerate a situation when a vault image already
exists and/or a LUKS device has already been created.


<a id="orgb8b023b"></a>

# Fri Sep  8 06:58:54 PM CEST 2023

Instead of creating my own tools, it might be better to use the ones
already existing and broadly used in the industry, which I will have
to learn at some point anyway. I already have a short course on Vault
from Jakub Mrugalski's educational network. Why not go with that?

It's gonna take a moment and requires running a vault server. I will
do the Vault course at my own time, but since it would block me for a
while, I'll just reset the stuff by hand and keep working on the
project.


<a id="orgeacdabc"></a>

# Sat Sep  9 11:59:03 AM CEST 2023

Updating the ansible playbook to also install Jenkins Configuration as
Code plugin. Can't automatically (as Code) install other plugins
without this plugin being installed first.

Looks like the most straightforward method (apart from using
Geerlingguy's Jenkins role) is to use Jenkins CLI on the server.

Looking over Geerlingguy's code I've noticed that he makes sure
Jenkins server is up and running before he installs plugins. Might
have to add some kind of delay or check, or eventually just separate
Jenkins installation from Jenkins configuration steps.

It was difficult to crack this "chicken and egg" problem. Online
solutions aren't widely available, as most people either use the ready
Ansible role prepared by Jeff Gerling or the Jenkins docker image.

At first I tried using Jenkins CLI. But it requires authentication
which itself requires some initial server configuration.

Have another idea - just have any version of JCasC (Jenkins plugin for
configuration as code) downloaded and ready to by pushed to the server
by Ansible. Then, this plugin can be used to configure the server,
including updating of itself (the JCasC plugin). With the plugin
installed, rest of the configuration is performed with a yaml file.

Jenkins needs to be restarted after the plugins and configuration
files are pushed to the server. But if we restart Jenkins during the
initial startup, we can damage the installation. A solution would be
to use Ansible's 'wait<sub>for</sub>' module. It's documentation even mentions
waiting for a port to be open after a Java application is installed! I
wonder if it was written with Jenkins in mind.


<a id="orgaba3b42"></a>

# Mon Sep 11 07:09:48 PM CEST 2023

I'm starting Jenkins to play a little with it.

Installed recommended plugins, but that's what I wasn't supposed to
do. I need a clean install and just the JCasC plus it's
dependencies. To make it easier to see it's dependencies.

Have a fresh install with just JCasC and it's dependencies. It's
almost 3MB total, which is a lot, but at the same time, in 2023 it's
almost nothing.

Permissions for all plugins are 644 jenkins:jenkins.

Have all the plugins in a .tgz file in /jenkins<sub>config</sub> directory.
There is one problem, they got tarred along with their full path, so
it might be easier/harder to extract, depending on whether I remember
about it.


<a id="orgf13b1d6"></a>

# Tue Sep 12 08:15:08 PM CEST 2023

Committed all the hanging changes to declutter git status output (or
rather the magit-status window in Emacs).

Just realized that I can't really have a working Jenkins configuration
before I create the pipeline and export it as Pipeline as Code. On the
other hand, the configuration doesn't have to be "working" to create
the initial version of mechanisms to push it to the server with
Ansible. I'll just nuke the Vagrant machine, reinstall Jenkins and do
a manual installation of default plugins and create a pipeline by
hand.

This one-liner destroys the vagrant machine, updates local .ssh/config
to include login credentials for the machine (using a script), removes
ssh fingerprint of the previous machine, copies the project's ssh key
onto the machine, and then runs the Ansible playbook against it (now
that it contains the ssh key that Ansible knows about).

    # To be run in the /vagrant dir.
    vagrant destroy -f \
    && vagrant up \
    && update_ssh_config.sh \
    && ssh-keygen -f "/home/igi/.ssh/known_hosts" -R "10.11.12.5" \
    && sshpass -p 'vagrant' \
      ssh-copy-id -i ../vault/id_25519_aws_flaskcicd.pub \
      vagrant@10.11.12.5 \
    && ANSIBLE_CONFIG=../ansible/ansible.cfg \
      ansible-playbook -i ../ansible/hosts.ini \
      ../ansible/playbook.yml


<a id="org8f6b236"></a>

# Fri Sep 15 12:08:57 PM CEST 2023

Going to bind the python-flask-cicd-code repo with Jenkins.

Not sure how. I'll go with the Jenkins tutorials from here:
<https://www.jenkins.io/doc/tutorials/>


<a id="org0b12d27"></a>

## Installing Docker Pipeline plugin

Clicking through the Web UI


<a id="org5f44745"></a>

## Created a Jenkinsfile in the code repo

Copied from Python example from the tutorial


<a id="orgcc92d95"></a>

## Installing Emacs Jenkins major mode

Noticed there is no syntax highlighting in the Jenkinsfile. Fixed by
downloading a plugin from packages list. There was also Butler - a
plugin to manage the Jenkins server from Emacs. Can find out how to
use it later on.


<a id="org21f4bb3"></a>

# Sat Sep 16 01:28:32 PM CEST 2023

Looks like I overlooked some things in planning of the third part of
the project, mostly due to being unaware of the complexity of it. I
determined that the 'code-repo' side of the project to be trivial. It
is however a bunch of separate tasks, so I have to rewrite the plan
and divide the Jenkins setup and the Jenkins pipeline setup into
smaller tasks and/or reorder them.

This is because I feel a block when thinking about making the code
repo into something that can produce an artifact (in this case a
docker image, artifact is a product of the ci-cd pipeline, a ready
compiled program or something that can later be tested and
deployed). A block is feeling based. It's either fear or anxiety, and
anxiety is usually a sign of complexity or too many paths forward to
be able to comfortably determine what is the best action right now. A
way to reduce the anxiety is to reduce the surface of possible
actions, by for example being a little more specific in planning. So
planning it is.


<a id="org878e83d"></a>

# Sat Sep 16 01:44:38 PM CEST 2023

Looks like what caused the problem was wrong order of tasks. You can't
configure Jenkins automatically if you don't know what to configure
for. For that you need to have a finished and working Jenkins
pipeline. For that you need the code repo to contain the code to
manually generate the artifact. So the proper order would be:

1.  Code repo has all it needs to produce a working artifact, in this
    case that would most likely be a Dockerfile.
2.  Code repo contains a Jenkinsfile which is just the automated
    creation of the artifact mentioned in previous step (normally it
    would also include testing, before creating the artifact and after,
    but this would add too much complexity).
3.  Jenkins installation can be configured to create the pipeline for
    the code-repo based on a Jenkinsfile in the repo.


<a id="org2af1ee9"></a>

# Sun Sep 17 03:18:55 PM CEST 2023

Getting into the weeds with python flask docker images. Following a
youtube tutorial from Hitesh Choudhary called "How to build docker
image for python flask app".


<a id="org4f72b7e"></a>

## .dockerignore

First issue that popped up is that I have all the code from CoreyMS's
(an online programming teacher) GitHub repo inside the flask app repo
directory and can't simply copy it all onto the docker image. Testing
a solution called .dockerignore which seems to work like .gitignore.


<a id="orgb40450c"></a>

## Dependency Hell

This are the dependencies:

    bcrypt==3.1.4
    blinker==1.4
    certifi==2016.2.28
    cffi==1.11.5
    click==6.7
    Flask==1.0
    Flask-Bcrypt==0.7.1
    Flask-Login==0.4.1
    Flask-Mail==0.9.1
    Flask-SQLAlchemy==2.3.2
    Flask-WTF==0.14.2
    itsdangerous==0.24
    Jinja2==2.10
    MarkupSafe>=1.0
    Pillow==5.3.0
    pycparser==2.18
    six==1.11.0
    SQLAlchemy==1.2.7
    Werkzeug==0.14.1
    WTForms==2.1


<a id="org0541fb9"></a>

### Timeboxing

Since I can choose any other python project and I'd rather have
something that works with current versions of libraries due to
security concerns, I'll try to solve the dependency issues in 1h. If
it's not working by that time, I'll choose a different project.


<a id="org5f1c260"></a>

### Error from python - complaining on lack of compilation tools - switching base image to python

Maybe what's missing is only missing in the thin alpine image.

Didn't work.


<a id="orgea3dbff"></a>

### Pasted the errors to ChatGPT and found out that it's a dependency issue, most likely due to old libraries being pinned.

I'm going to unpin the version, see if PIP will just pull the latest.

Changed Markupsafe dependency to >=1.0 from ==1.0
It worked.


<a id="orgd708b2e"></a>

### Now there are errors with cffi. Trying the same as with Markupsafe, changing the dependency from equal to greater than equal. Success!


<a id="org1715c9f"></a>

## Errors with the app

Wasn't sure what was wrong and since right now the focus is not
learning Python but publishing any app in a docker image, I'm getting
the code from the latest version of the Python Flask tutorial.


<a id="org440743a"></a>

## Another dependency error. It's a third one. I'm unpinning all dependencies.

    sed -i 's/==/>=/' requirements.txt


<a id="orgc44f468"></a>

## Problem with DB credentials not being set

Still debugging in the same way, by building the image, running it,
hoping it will show up in 'docker ps' output (because it would mean it
is running and didn't die right after startup). If it's not visible in
ps output, I get it's name from ps -a and run docker logs against it's
hash.

Looks like to go further with it I would need to co-deploy a
database. It would be cool, but for now I'll just mock the fully
fledged blog with a ChatGPT generated code that returns Hello World!
on HTTP requests.


<a id="orgc2da912"></a>

# Mon Sep 18 12:43:09 PM CEST 2023

Going for a simple Hello World generated with ChatGPT.

The Hello World python code seems legit for what I can I know of
python which is not much.
Even though I had a Dockerfile ready, I've looked at what ChatGPT
suggested and there were some things I asked more about:


<a id="org708884b"></a>

## &#x2013;no-cache-dir option for pip install -r requirements

This would be an equivalent to 'apt clean' run after installing apps
inside the docker image (inside a Dockerfile) and is meant to stop pip
from saving downloaded packages in cache for later use, as there will
be no later use and it only bloats the image.


<a id="org49e0fd0"></a>

## ENV FLASK<sub>ENV</sub>=production

Flask has two modes of operation, 'development' and 'production',
with the development mode having additional debugging features
activated. These shouldn't be active in an internet facing app, hence
the production setting to disable them.


<a id="orgb3df264"></a>

## CMD ["python", "app.py"] instead of CMD python app.py

I remember vaguely from a Docker course, that it's just about what is
the typical way to set it up. ChatGPT explained that when run with
arguments not in brackets, the shell form, a shell is called and
performs a an "sh -c 'arguments here'", while the exec form doesn't
call a shell, but most likely performs an exec, where the container
process becomes the binary in the first argument and gets run without
the extra shell overhead.


<a id="org84b8d59"></a>

# Mon Sep 18 03:32:56 PM CEST 2023

The flask app works, docker image builds and the container based on
that image stays open and keeps returning "Hello, World!" when poked.


<a id="org2a2af45"></a>

# Mon Sep 18 04:28:53 PM CEST 2023

Issues trying to push the code repo. Github denies the public
key. Troubleshooting by trying the 'ssh git@github.com'
command. Spoiler: same error.

Looks like GitHub is not accepting my ssh key. I also don't have an
ssh/config entry for github.com, which I now fixed.

Added .pub part of the main ssh key from my laptop. Strange that it
didn't come up earlier.

Pushed the image to dockerhub.com without issues.


<a id="org61d3dc0"></a>

# Tue Sep 19 10:36:24 AM CEST 2023

Time to follow tutorial from Jenkins site at create a Jenkins Pipeline
as Code (aka Jenkinsfile) and save it in the repo along with the flask
app code.


<a id="org4efcbba"></a>

# Wed Sep 20 10:07:03 AM CEST 2023

Turned out I had the AWS services names and usage wrong. There are
actually multiple ways to deploy a container to the cloud. For a very
simple setup with one container, the most straightforward method to
use is to couple AWS ECS (Elastic Container Service) with Fargate
(serverless engine for containers). They can be managed with Terraform.


<a id="org564942f"></a>

# Wed Sep 20 11:03:30 AM CEST 2023

Following online tutorials to learn how to make pipelines based on
Jenkinsfiles. Most important thing to do is setting a clear goal, and
here it is:
Writing a Jenkinsfile that will build a docker image with given
Dockerfile and deploying it to ECS Fargate.

Starting with a YouTube tutorial from CloudBees, Jenkins authors,
titled "How to Use Jenkins to Build and Run an Image Using Docker".

Need to prepare my Jenkins Controller (so that's how mater server is
called) to be able to build docker images. For that I'm going to do a
regular docker install. I also need to give the jenkins user
permission to use docker by assigning him the docker group.

There are a ton of methods to install docker on CentOS (which is
closes to Alma Linux I've chosen for this project). But to make it
more straightforward, I'll just install Docker from already existing
repos and test it with 'docker run hello-world'. If it doesn't work,
we can look at more complicated methods of installation.

First finding docker packages with 'dnf search docker'. Fun: dnf
search command get's killed. An 'echo $?' returns '137'. Rebooting the
server, so I don't have to search for the reason why it doesn't
work. I'm working with Jenkins server installed to a Vagrant VM with
Ansible.

Looks like the Fun persists between reboots. How much time should I
put to the issue before nuking and reinstalling the server with
Ansible? Until the end of this pomodoro and one more. This is still a
chance to learn something on Linux Administration.

Logs show a ton of jenkins entries connected to the python flask
job. Looks like misconfigured Jenkins job uses up all the resources on
system. Strange because the 'free' command still shows some RAM left.
Trying to delete the job using Jenkins UI.

Job was deleted, tail -f on /var/log/messages shows that jenkins is
still bombarding the server with some request:
Sep 20 09:57:01 jenkins-master jenkins[1065]: 2023-09-20
09:57:01.054+0000
[id=18]#011WARNING#011hudson.security.csrf.CrumbFilter#doFilter: No
valid crumb was included in request for
/job/python-flask-app/widget/ExecutorsWidget/ajax by
admin. Returning 403.

I'm working on a laptop, maybe there is a browser window with Jenkins
opened on the desktop machine that keeps trying to access Jenkins
using old session data?

That was exactly the case.

Another problem - there is no regular docker on AlmaLinux. RedHat
derivatives stopped using docker because of security issues. Running
docker service as root is not safe, so they switched to podman. Doing
a Vagrant halt & up, and then trying if just installing podman will
work. Else I can add docker repo and go with this method.

After reboot performed from host, dnf works normally.
After installing podman, and running 'docker run hello-world' we get a
'hello podman world' message from a podman container. Good enough for
now, tho I have a hunch that this can be a source of Fun in the
future.

Looks like I can't push the container. Leaving learning how to replace
docker with podman for later. Now I will just add the docker repo and
install a regular docker.

Removing podman first.

The VM hanged again. Now I see why people use Jenkins in Docker.
It required accepting some fingerprint. Hope that Ansible can deal
with it automatically.

Starting docker service and adding myself and jenkins to docker group.
Still doesn't work, but that's because groups are assigned on
login. Need to relog.
Works!


<a id="org2bffff7"></a>

# Wed Sep 20 02:10:56 PM CEST 2023

Now that the Jenkins server is prepared to build docker images and I
have documented the steps (Ansible playbook not yet updated) I can
write the Jenkinsfile and commit it along with the code.

And it's done and committed. Now I should create a Jenkins job or
whatever it's called on the Jenkins server.


<a id="orgd919531"></a>

# Wed Sep 20 03:05:19 PM CEST 2023

I sort of know I should use a Jenkins multi-branch pipeline but that's
pretty much it. Time to watch some more YouTube tutorials! But before
I launch on this adventure, just checking online if there is a simple
Jenkins tutorial on how to create a pipeline based on a
Jenkinsfile. Manually in Jenkins GUI.

Not many tutorials, but I just clicked through a multi-branch pipeline
setup and filled sane defaults.

Got first error, Jenkins doesn't like my # prepended comments. Need to
find out what's the proper way to comment inside a
Jenkinsfile. Answer: It's C++ style comments:

    // double dash for one line
    /* dash - asterisk start and asterisk dash at the end
     for multi-line comments */

So I'm making updates to the Jenkinsfile and iterating it, but there
might be some details I'm missing that I don't even know that I could
ask about. I'm going to just watch 4 episode long Jenkins Tutorial
from "TechWorld with Nana", which is only 3 years old. The part on
Jenkins set up (she uses a docker image) will go at 2x speed.

So far nothing special done by Nana except for using a regexp to
decide which branches should get their pipelines. She used
"<sup>master</sup>|dev|feature.\*$" so only the master, dev and feature branches
will be selected.

She also used 'agent any' instead of 'agent { label "linux" }' which
should allow building on the main Jenkins server.


<a id="org3da80ee"></a>

# Wed Sep 20 06:57:28 PM CEST 2023

Changed the agent to 'any'. Now there is another issue, looks like git
is not installed on the Jenkins server. 'git &#x2013;version' returns 'git
not found'. Oops.

Git is there now. Another problem, Jenkins seems to be missing
permissions to use docker. But I've added Jenkins to docker
group. However, for an already logged in user, permissions don't
change. User needs to re-log. Trying with 'systemctl restart
jenkins'. That was it.

Had to remove the "run" step, as it would hang the pipeline. It could
work with a one-shot app, but this container contains a web server
which will just keep running indefinitely.

It builds!


<a id="org3a0cd8b"></a>

# Thu Sep 21 09:16:34 AM CEST 2023

Right now I could start learning how to use Terraform to deploy to ECS
Fargate, but first I'll finish updating the Ansible playbook. I get
anxious thinking that the current server configuration starts
diverging from my configuration as code. It started diverging already,
because I've added changes that were very Vagrant specific. A Vagrant
plugin, which updated set of packages that helps with host-VM
communication, required libraries to build these packages. I installed
them by hand and didn't document what was installed. That could've
been solved differently. Even though these changes are Vagrant
specific and as such shouldn't end up in the Jenkins server playbook,
I could've added them to a separate playbook. Or have their execution
activated by some label. Next time I'll do better.


<a id="org7e30c9e"></a>

## Value of making clean notes

While troubleshooting the Jenkinsfile I've learned what's missing from
the server and made a clean list of requirements - how the playbook
needs to be modified. Most of these changes are just to install
Docker. While all the steps for installation of software from external
repositories are similar, I still searched for a tutorial to see how a
pro would do it, just to make sure there are no caveats I'm
missing.


<a id="orgf6b1fa3"></a>

## Ansible tutorial from Ansible Pilot YouTube channel

Found "Install Docker in RedHat-like systems - Ansible module rpm<sub>key</sub>"
from Ansible Pilot YouTube channel.

Generalized list of tasks to install from external repo:

1.  Download GPG key for the repo (to make sure that packaged we
    downloaded were not tampered with)
2.  Add the repo using it's URL
3.  Refresh packages list and install the packages (done in the same
    step on RedHat systems)


<a id="org1d96fa1"></a>

## Full module names (example - 'ansible.builtin.rpm<sub>key</sub>') - a good practice

Ansible Pilot host uses full names for all modules, that is, including
their source and middle name (maybe group?) in addition to the module
name, all three separated with dots. I guess that if somebody uses
Ansible heavily, using multiple namespaces is not uncommon. It doesn't
really take so much more time to use full names for modules,
especially if fixing them after the fact might take more than a couple
of sed commands.


<a id="orgffb0a1c"></a>

## Setting the distribution name using 'ansible.builtin.set<sub>fact</sub>'

Host uses an interesting construction, using a conditional statement
and a pipe (and 'lowercase' command) to set the value of the
'mydistribution' variable so that our playbook can be used for all the
RedHat variants that existed year ago, namely CentOS, Fedora and RHEL.

    - name: set mydistribution
      ansible.builtin.set_fact:
        mydistribution: "{{ 'rhel' if (ansible_distribution == 'Red Hat Enterprise Linux') else (ansible_distribution | lower) }}"


<a id="orgbef40a7"></a>

### I don't like the length of that line and wonder if it's possible to refactor it into a more readable form

An online YAML linter says this is correct:

    - name: set mydistribution
      ansible.builtin.set_fact:
        mydistribution: >-
          {{
          'rhel' if (ansible_distribution == 'Red Hat Enterprise Linux')
          else (ansible_distribution | lower)
          }}

The '>-' is a subcategory of YAML folded style ('>') strings, which
replace newline characters with spaces. The minus '-' sign says that
we don't want to put a trailing newline at the end of this long
one-line string.

There is also a way to shorten very long strings that would normally
span more than 72 characters (like URLs).
Instead of this:
"an example of veeeeeeeeeeeeeeeeeeeeeeeeeeeeeeery long string"
We can do this:
"an example of "
"veeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeery "
"long string"

Note the extra spaces at the end of each sub-string. When
concatenating strings, there are no spaces added in place for
newlines. This is why it would work with URLs too.

Video author puts the source address of the GPG key as a parameter for
the yum<sub>repository</sub> command. I omitted it, let's see what
happens. Jenkins installed without it. Maybe an older version of
yum<sub>repository</sub> wasn't that smart? I added docker-compose-plugin to the
list of installed packages. I'm not using compose in this project, but
if I ever reuse this code, I'd like it to be here, just in case.

Note that Ansible Pilot adds a dnf module parameter, 'update<sub>cache</sub>:
true'. This way we explicitly say that we want to re-download packages
list from repositories. I'm guessing that Ansible's optimizations
could cause problems if cache wasn't updated after adding a new
repository.

Time to test the playbook. I've made multiple changes without
committing and testing them. This is an anti-pattern, as it often
wastes more time than it saves.


<a id="orgf9d0652"></a>

# Fri Sep 22 12:13:59 PM CEST 2023

Rewritten the Vagrantfile to create two VMs. This way I can test the
playbook without loosing the manually configured Jenkins server.

Had issues with the playbook, specifically, multi-line string.
There are a few ways to separate a long parameter into multiple lines
in YAML.
We have the '>' and '|', folded scalar and literal scalar, which would
take multi-line unquoted string and put it either into a single line,
replacing newlines with spaces or just take it as is, with newlines in
place of newlines. Both of them need a '-' afterwards, like this '>-'
to not place a newline at the end of the created string.

But this doesn't work for URLs and strings where we want to preserve
them as they are, without additional spaces.

Testing some other method to divide long strings into multiple lines.
<https://stackoverflow.com/questions/3790454/how-do-i-break-a-string-in-yaml-over-multiple-lines>
Exactly this answer: <https://stackoverflow.com/a/21699210> (from above
question)

I'm really glad I've found it, I tried before and haven't seen it
explained like that. ChatGPT failed to provide proper answer, even
with a longer conversation and wrangling of the prompt.

Had some issues with Vagrant. Had reload the machines, because
changing the Vagrantfile messed up network settings for the existing
machine. Afterwards had problems with the amazing plugin that fixes
guest additions on the client VM from host by building it on the
client. Had to disable it, but saving it's name so I can easily find
it again: 'vagrant plugin uninstall vagrant-vbguest'.
Finally, my script that updated ~/.ssh/config with details of the new
machines stopped working. I had a replacement on a laptop, which uses
a more "correct" form of putting new files in config.d directory. But
that required adding an Include directive at the beginning of
~/.ssh/config on the desktop, like that:

    sed -i '1iInclude config.d\/\*' ~/.ssh/config

Made a typo in yum<sub>repository</sub> command. The 'enabled' parameter was
called 'enable'. I really like the way the Ansible Pilot writes his
Ansible tasks. They are very explicit, nothing is left for
chance. Compare these two yum<sub>repository</sub> tasks, one from Ansible
Pilot, the other from some Jenkins tutorial (or me, don't remember).

    - name: Add the Jenkins repo
      yum_repository:
        name: jenkins
        description: jenkins stable repo
        baseurl: https://pkg.jenkins.io/redhat-stable
        gpgcheck: yes
    
    - name: Add the Docker repo
      yum_repository:
        name: docker
        description: official docker repo
        baseurl: "https://download.docker.com/linux/\
          centos/docker-ce.repo"
        enabled: true
        gpgcheck: true

Another issue, this time problem with the repo address for
docke. Looks like dnf can't find a repo on that specific address. Need
to check that the URL is correct. URL was correct, but not for Ansible
(or it's dnf plugin). Looks like a repo can be defined in multiple
ways. One of them is less explicit and depends on system parameters to
choose the full path. But it doesn't work in this case, since Docker
repos don't support AlmaLinux. I will try with a full repo address,
that includes the system version and architecture and see if it
works. Incidentally, this is how Ansible Pilot adds the
repository. Actually, I could do just what he does, using Ansible
facts to supply $releasever and $basearch. I wonder if this would
work.
Ansible Pilot says that '$releasever' and '$basearch' will be expanded
directly by yaml dnf.

Yay! Success! Of course, it didn't go without errors. Looks like I get
some disconnected error on the manual jenkins VM. But it doesn't
matter now. This is also the reason why Configuration as Code is the
king. After I'm done debugging the manual process, I'll be able to
configure whole Jenkins instance with Jenkins as Code and if the
Jenkins server starts acting up - just nuke and pave it.

I had a thought when the playbook was being executed. In this specific
case, I started the jenkins.service only after changing the group
setting for the jenkins user (adding him to docker group). But if the
server was already running, this would fail without restarting the
jenkins service. So there should be a hook or post task (don't
remember the Ansible name for it) activated by the group changing task
to restart the Jenkins server. But then, it would be even more
complicated as we cannot simply restart the jenkins service (or maybe
we can, I'm not sure). Because if we restarted the service on it's
first run, when it's performing it's bootstrapping process, creating
directories and such, we could damage the installation. Proper way to
do this would be to only restart the server after it has become
responsive.

It works, but Jenkins didn't see JCasC plugin as
installed. Installation took 0.01 seconds, everything was instantly
downloaded, a sign that the packages copied by Ansible were recognized
as correct.

Task uploading the plugins was at the end of the playbook, so the
plugins were copied after Jenkins was already started. Jenkins only
recognizes new plugins on startup. So the right way would be to have
the task automatically trigger restarting of the jenkins.service. This
is the second time that not using it causes some extra work.
I've just checked, this is called "notifying a handler", it's done by
adding (at indent level of the task name, not task parameters)
'notify: Handler Name' at the end of task description. These special
tasks are called handlers. They are commonly used to restart
services. Another thing to note about handlers is that they are only
executed if all tasks in playbook succeeded. We can change this
behavior in ansible.cfg, as an option when calling ansible-playbook or
inside the playbook.


<a id="org49e50d2"></a>

# Sun Sep 24 02:14:59 PM CEST 2023

I've read up on what I need to do to deploy the container to the
cloud. I'm going to use ECS Fargate. For that I will need to define
some additional cloud infrastructure, some networks and some domains
and maybe even a certificate. I've divided the work required for small
tasks. Where a task felt too complicated, I removed it's core and
created a new task with a simplified version of the hard task. This
way I can start with something easy and iterate over it until I get
something of satisfying complexity.


<a id="orge7160e7"></a>

# Sun Sep 24 05:33:44 PM CEST 2023

Beginning with a hello-world deployment to ECS Fargate.
Hard to find just a hello-world example. I'll just go on the AWS web
console and click it through. And just when I gave up on searching,
found this
<https://docs.aws.amazon.com/AmazonECS/latest/developerguide/getting-started-aws-copilot-cli.html>


<a id="orgd7d0e92"></a>

# Mon Sep 25 07:34:01 PM CEST 2023

First have to install AWS Copilot. They want me to just run a one
liner on my machine. But it's legit, because it's hosted on GitHub and
additionally, by a big company.

    sudo curl -Lo /usr/local/bin/copilot https://github.com/aws/copilot-cli/releases/latest/download/copilot-linux \
       && sudo chmod +x /usr/local/bin/copilot \
       && copilot --help

Wow there are EMOTICONS in the &#x2013;help output. ?!?!
"  Getting Started 🌱" I guess the future really is now.

It has shell completion. I'm a big fan, so that's first I'm gonna set
up.
I've also installed AWS CLI on laptop.
And run 'aws configure'.

They want us to clone the repo, but since I'm inside the repo and it's
hosted on GitHub, it makes sense to download a zipped version of the
main branch instead. Main branch is called master. So this URL
<https://github.com/aws-samples/amazon-ecs-cli-sample-app> becomes this
command:
'wget
<https://github.com/aws-samples/amazon-ecs-cli-sample-app/archive/master.zip>'
which downloads an archive that can be extracted with an unzip
command.

Running 'copilot init'

Had to fill in some details. It takes ages to self setup. But it
abstracts out a lot of work. Maybe I'll use this time to send some AWS
ECS docs to my kindle to read from a more eye friendly machine.

It spat out a link under which the docker image is available.


<a id="org005b3ad"></a>

# Tue Sep 26 07:58:53 PM CEST 2023

Reading more about ECS. It's like a managed service to host your
containers. There are some concepts worth noting:


<a id="org30f706c"></a>

## Task Definition - like a docker-compose file that also mentions hardware requirements

Biggest difference is that it uses JSON and you can define CPU and RAM
requirements.


<a id="orgcb61c0e"></a>

## Task - a working, self sufficient instance of your workload, made up of multiple cooperating containers. Like a Kubernetes Pod.


<a id="org13c2b5c"></a>

## Cluster - like a Kubernetes instance, this is a group of EC2 instances where the Tasks are executed/run


<a id="org0d58e60"></a>

## More ECS info:

ECS uses Amazon's Load Balancer service, ELB. It integrates well with
other AWS services.

To run a task on ECS we create a cluster (if we already have a VPC),
then we create a Task Definition and then run a Service in our
cluster, using the Task Definition as a blueprint. Task Definitions
have to be uploaded to AWS before they can be used. So we save them in
a local file and then upload using AWS CLI.


<a id="org4e45d1c"></a>

# Fri Sep 29 09:47:00 PM CEST 2023

Had kind of a block. Too many possible things to do. Tried to solve it
through reading ECS documentation, but that didn't work. What actually
solved the block was talking to a senior colleague. I've also used
ChatGPT for some rubber ducking. Incidentally, they both pointed me to
do the same things.


<a id="orgd8aae77"></a>

# Sat Sep 30 01:47:22 PM CEST 2023

So, Terraform is not meant to be used to pushing images to a
repo. That's why it was so hard to find how to do it. The search
however resulted with [this nice SO answer](https://stackoverflow.com/a/68668097), where an user asking about
how to push using Terraform, is shown how to do it the "right way"
with AWS CLI and Docker. He also mentions that Packer can be used for
just that and has a great integration with Terraform. Downside of
using Packer is that it would require learning about another tool.
So AWS/Docker it is.

For starters I'll just test the example code verbatim.

    docker build -t ${ACCOUNT}.dkr.ecr.${REGION}.amazonaws.com/${REPO} .
    
    aws ecr get-login-password \
        --region ${REGION} \
    | docker login \
        --username AWS \
        --password-stdin ${ACCOUNT}.dkr.ecr.${REGION}.amazonaws.com
    
    docker push ${ACCOUNT}.dkr.ecr.${REGION}.amazonaws.com/${REPO}

To test this code I'd need to define the three variables in the shell
first.

Need to remember to explicitly set the target region. Each region has
it's own registry, which is a group of repos.


<a id="org3395be6"></a>

# Fri Oct 13 07:38:28 AM CEST 2023

Getting the variables like this:

    ACCOUNT=$(aws sts get-caller-identity | jq -r .Account)
    REGION='eu-north-1'
    REPO='flask_cicd_repo'


<a id="org6d1bdf3"></a>

# Sat Oct 14 02:34:50 PM CEST 2023

Started to work on how to create the repository with
Terraform. Decided to drop Terraform modules and just create multiple
Terraform projects in separate directories.

Ok, looks like a mistake. I should've had created the ECR repo with
AWS cli. 'aws ecr create-repository help' command explained how to do
it. Also, I came upon the 'create-repository' part by typing first
'aws ecr' and then pressing tab. I've setup tab completions for
aws-cli as part of this project. I love tab completions and use them
as often as possible. I am also quite proficient at setting it up, and
doing it properly, that is by adding small files to .bashrc.d/
directory, and not by editing the .bashrc file itself.

So, since most of the work for the Terraform setup is done, I'll
modify the journal to change the task to writing a simple, one
resource, Terraform project to create the ECR repository, as I would
have to do it later anyway and this will make cleaning up after the
project has run it's course much easier.


<a id="org510573f"></a>

# Sun Oct 15 01:08:36 PM CEST 2023

Pushing the image worked, but not without issues. First I forgot to
update the dockerignore file and ended up exploding the image.

Afterwards I wanted to change the container name (repo name) but
couldn't delete the old repo, even when editing the settings in
main.tf to allow deleting repos that are not empty. Looks like the
force<sub>delete</sub> parameter for ECR repos has to be set when creating the
repo.


<a id="orgb3c7d30"></a>

# Sun Oct 22 12:13:14 PM CEST 2023

Have to install AWS cli and jq on Jenkins server with Ansible. I
should've made notes when installing these tools.

[This is a link for instructions on how to install the AWS CLI on Linux.](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)

    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
    unzip awscliv2.zip
    sudo ./aws/install


<a id="orga404f61"></a>

# Tue Nov  7 01:16:16 PM CET 2023

There are just a few steps. Because the instructions for Linux assume
the user is using terminal, it's not very challenging to translate
them into Ansible tasks. In few of the steps I even already know the
Ansible modules which can help make the commands idempotent.

First I've added 'jq' to the list of installed packages. That's the
name of the package on Debian based systems. I'm not 100% sure that
the package has the same name on dnf family systems. Will test it when
I have internet. Just verified that it's the same - jq.

Now I can perform the 4 tasks for AWS CLI installation. I might start
with running a command to get the current version of the 'aws' binary,
I've read about a method to perform it in Gerling's Ansible book, but
it can be done later. For now, reinstalling on each playbook run is
fine.

Download and installation task will be joined into one. I might create
a temp dir to store the installation files in /var/tmp to make sure
they get deleted at some point after the installation.

Not sure on what to supply for mode of the extracted AWS files.


<a id="org4ff1bec"></a>

# sø. 18. feb. 15:38:41 +0100 2024

Had to use Ansible command module, because unarchive doesn't work for
zip (kinda funny that AWS hosts a file for installation on Linux
systems that is not native to Linux, while other compression programs
are).


<a id="org03bc5e5"></a>

# Sun Feb 25 02:51:02 PM CET 2024

Fixed date options. Had to set system wide locale variable. Used two
methods. Changed something in configuration files and also used 'sudo
update-locale LC<sub>TIME</sub>=en<sub>US.UTF</sub>-8'.


<a id="org103be87"></a>

# Mon Feb 26 07:46:42 PM CET 2024

Need to use a conditional expression in the playbook, because there
will be an error if we run the playbook on a server where the aws-cli
is already installed.

First I read the chapter on variables. Variables can be defined in
various ways before the playbook is run. We can also store some
command output with the 'register' keyword. This is what I'm going to
need to make an if/else statement so that we only upgrade the aws-cli
if it's already installed.


<a id="org52f1fe8"></a>

# Tue Mar 12 04:09:13 PM CET 2024

Need to fix my testing environment. Had to restart vagrant
machines. Also, I had a nice one-liner to insert public keys into
authorized<sub>keys</sub> on the VMs to let Ansible connect with the same key as
used on AWS. Used an ugly hack to have Ansible use the Vagrant key,
but it's ugly and it's a hack.

Trying to get that one-liner again. I remember using some strange ssh
command to automatically submit password to ssh.

Good that I saved another one-liner as a script - the one getting
vault pass from my password manager.

It worked without much exotics, ssh-copy-id with the (-f) forced
flag. I don't know why it wouldn't install the key without the -f
flag (it claimed that the key was already there, but then it didn't
work when trying to connect).

Might've been because of two potential problems here:
Me forgetting to use 'vagrant' as the user  - on most of systems I use
I have the same user and I'm just used to giving only the name of the
system for the ssh command.
Another, less likely is that the server has a different host key
(which is kind of a fingerprint used by ssh to re-recognize server
that we connected to before), since the server has been destroyed and
rebuild.

    for i in jenkins playbook-test-jenkins ; do ssh-copy-id -f -i
    ./vault/id_25519_aws_flaskcicd.pub vagrant@${i} ; done

I'll move some constants out as variables and add it to the repo.


<a id="org6ae1bed"></a>

# Tue Mar 12 10:28:18 PM CET 2024

The playbook would crash when trying to start the Jenkins service. I
reinstalled the jenkins package with dnf and tried again. It took a
long time (maybe even one minute ) but worked. I know that Jenkins is
a Java app and can therefore take long time to start. Jenkins is also known
to require a lot of time for the first run.


<a id="org0e708c1"></a>

# Wed Mar 13 03:12:01 PM CET 2024

Have an idea - systemd is starting Jenkins and crashing. But we can
read how it does it and do the same, just so it does the initial start
and then close it and start it with systemd.

Need to determine how to know that it started properly.

To speed up testing, I'm saving a snapshot of an Alma VM with latest
packages and the public ssh key in authorized<sub>keys</sub> using a Vagrant
command 'vagrant snapshot save jenkins'. Without creating a new
Vagrant box however, this command needs to be run for each machine.

Had issues with completions using vagrant. There was a typo in the way
Vagrant completions are added to .bashrc. Couldn't find where in
Vagrant code it is located so I just wrote in an old issue about it
that the problem still persists.


<a id="org4fa1815"></a>

# Sat Mar 16 02:36:47 PM CET 2024

Tried snapshotting the other VM (playbook-test-jenkins), with updated
packages and the ansible ssh key installed, but installation of the
ssh key didn't work. I realized, that the machine was destroyed and
rebuild, but afterwards it's ssh credentials (that we use when
connecting to the machine with 'vagrant ssh $VM<sub>NAME</sub>') were not
updated into ssh/config and I couldn't just 'ssh $VM<sub>NAME</sub>' because
computer didn't know the new key (the key that vagrant auto
generates).

So I added the script that usually does it for me into the project's
bin dir. And then updated the copy-ssh-key script to run that script
first.


<a id="org613a57f"></a>

# Tue Mar 19 09:00:14 PM CET 2024

It seems that the playbook is getting stuck on the task called "Start
and enable services" which loops over multiple services. I'll check
what happens if I remove some of the services.

AWS CLI installation quits with an error, because there already is an
AWS CLI installed. To make this task idempotent we need an if
statement that lets it run only if there is none AWS CLI installed.

Had the idea that maybe Jenkins failed to start because it was out of
memory?  Checked free memory on the system and it said it was just
98MB. I know that sometimes system reports free memory in a weird way,
not counting all free memory as free. So just to find out, I've upped
the RAM on the VMs from 2 to 3 GBs. This way I can only have one
running at the same time on the laptop, but maybe that's what's
needed.


<a id="org294836c"></a>

# Sat Mar 23 11:44:43 AM CET 2024

Was reading about how to better use the 'register' keyword in Ansible
(in the Gerling's book) and the section about conditional statements
and Python builtin functions included an example on acting when the
major version of a program is of a certain value. This is exactly what
I would need to handle AWS CLI installations properly - that is not
only not trying to reinstall if we already have it, but also to update
if the version on the server is very old.

I don't know how to create a block of code inside a playbook. I'd need
to put all the AWS CLI installation code into a block activated with
the conditional, but all the examples in the book are with a single
task.

There is a primer on blocks at the end of the playbooks chapter in the
book, which should be enough. There are also other interesting
playbook options/commands/abilities (TODO fix wording) which make more
sense now after dabbling a little more in Ansible. This calls for
(TODO fix wording) chapter re-read, as things will make much more
sense now and can be better understood.


<a id="orge9226a8"></a>

# Sun Mar 31 05:39:14 PM CEST 2024

Some issues with syncing between machines. Guessed it was problems
with system time. Found a solution for fixing it using chrony and
saved this solution as a script.

Turned out the Syncthing stopped because laptop got down to 20% free
space on /home. Changed Syncthing to use 15% instead.

Copied file from PC to a temp dir and run a diff to compare files to
test them. It works now.


<a id="org8b03e66"></a>

# Mon Apr  1 01:49:18 PM CEST 2024

I've read up on how to write Ansible code. That is Jinja, YAML, code
blocks in playbooks and using plays' (each Ansible command is called
a play) output in conditionals. The process of understanding might
have been faster with just experimenting and trying blocks,
conditionals and register variable alone and then combining them
instead of trying to use all of them at once.

Tried putting the 'when' keyword at the beginning of a playbook block,
but it didn't work. Spent a while trying to rewrite conditional until
I guessed the conditional was fine and it's just the 'when' that has
to be at the end of the block.

Issues with the 'type -a' command. (Side note: debugging ansible
playbooks is much harder than debugging bash.)
Registering output of a simple 'type' check is really complicated in
Ansible:

    - name: Check if AWS CLI is installed
      ansible.builtin.shell:
        cmd:         "type aws"
      become:        no
      register:      aws_presence_result
      ignore_errors: true
      changed_when:  false

We need to:

1.  remember to ignore<sub>errors</sub> (in case our check fails - otherwise
    it would stop the playbook execution),
2.  tell ansible that this task doesn't change anything on the
    server with 'changed<sub>when</sub>',
3.  had to "unbecome" root for this task (aws was not in root's PATH),
4.  use 'register' keyword at the correct level of indentation.

So, the command is for the shell module, but all else (become,
register, ignore, changed) is for the task. Indentation is crazy.

Looks like there are more issues with the playbook - can't install the
Jenkins repo key. Looks like it was some temporary error fixed by
machine reboot after snapshot reloading.

Still have issues with starting of the Jenkins service. I'm guessing
that adding the Jenkins plugins extends the first start time for the
Jenkins Java app significantly, which makes systemd service handler
fail.

I'm not sure we should copy the JCasC plugin every time playbook is
executed.

Tried moving the block starting the services in the playbook after the
block setting firewall rules for Jenkins.


<a id="org3d30025"></a>

# Tue Apr  2 06:30:25 PM CEST 2024

There are issues with Jenkins service not starting. It can be that
server is taking more time to start if it has many plugins, but only
on the first run. If the server is restarted, it works.

Trying with a fresh server and commenting out the section of the
playbook that copies the plugins onto the server.

It takes a lot of time on the laptop. Maybe it is getting too old for
this?

Updated Vagrant snapshots so that the Ansible playbook doesn't have to
spend time updating the system packages on the server.

Due to a pasting typo I commented out JCasC play but at the same time
pasted it again, so had to go through the whole process second time.

Ansible is not very informative when it's running playbooks. I wonder
if -v added to the ansible-playbook command would change something or
if I'd have to add a lot of debug variables to make it more
talkative. There could be some knowledge on it inside the "Debugging
Playbooks" chapter in Ansible for DevOps book.

Test results are in - Jenkins server as systemd service does work if
the plugins are not there. What should I do? Start Jenkins before
copying the plugins and then stop it, copy the plugins and start it
again? Might be less time efficient, but it sounds easier and more
straightforward then modifying systemd service file or starting
Jenkins without systemd (which would require finding out as what user
it's started, with what location as the working directory and then how
to do it inside of an Ansible playbook).

Trying the start plugin-less, stopping, installing plugins, starting.
Updating the snapshot saved a lot of time when testing the playbook
on a fresh install.

It still doesn't work. It fails when trying to start the Jenkins
service after extracting the JCasC plugin. I must admit that it's
a quite brutal way to install plugins. But let's log in to the server
and look at the logs. Why does Jenkins fail to start, but then, after
some time it works. Or does it work after server (machine) restart.


<a id="orgc667197"></a>

# Sat Apr  6 11:28:50 AM CEST 2024

Trying to find out the issue with starting jenkins.service after
installation of the plugins. Found something in the /var/log/messages:

    Apr  2 17:44:03 playbook-test-jenkins systemd[1]: Starting Jenkins Continuous Integration Server...
    Apr  2 17:44:03 playbook-test-jenkins systemd[11601]: jenkins.service: Changing to the requested working directory failed: Permission denied
    Apr  2 17:44:03 playbook-test-jenkins systemd[11601]: jenkins.service: Failed at step CHDIR spawning /usr/bin/jenkins: Permission denied
    Apr  2 17:44:03 playbook-test-jenkins systemd[1]: jenkins.service: Main process exited, code=exited, status=200/CHDIR
    Apr  2 17:44:03 playbook-test-jenkins systemd[1]: jenkins.service: Failed with result 'exit-code'.
    Apr  2 17:44:03 playbook-test-jenkins systemd[1]: Failed to start Jenkins Continuous Integration Server.

Does the playbook set permissions after copying the files? Are these
permissions correct?

Play that copies the plugins:

    - name: Copy JCasC plugin onto Jenkins server
      ansible.builtin.unarchive:
        src: ../jenkins_config/jcasc_and_deps.tgz
        dest: /
        mode: 0644
        owner: jenkins
        group: jenkins

It does set the owner and group. But it might be a good idea to verify
it by hand, maybe the jenkins user and/or service has a different name
on the server.


<a id="org0de397c"></a>

# Fri May 10 10:05:03 AM CEST 2024

Looks like copying the files was not the right way to install the
JCasC plugin after all. I tried to do it like I configured an Icinga
server in another project. Jenkins doesn't accept drop in
plugins. They would also be quite out of date. Using latest versions
might cause issues on a production server, but I believe that in a
proof of concept setup like this, it will make things easier. Need to
update the "roadmap" and remove or mark parts about placing the
configuration as not relevant, but will first test if the playbook
works without the plugin's insertion. This way I can mark currently
worked on part of the roadmap as done.

There are still positives coming out of that dead end - I was forced
to learn about and become proficient using Vagrant snapshots. While
provisioning time was acceptable on PC, nuking boxes and
re-provisioning them to test the playbook took too long. Loading a
snapshot was much faster.

After destroying and vagrant upping a new machine, I need to run
update-ssh-config.sh to put the server info in ~/.ssh/config (so the
Ansible can connect to it easily), then run
copy-ssh-key-onto-machines.sh with the ssh key from vault as an
argument (and the vault has to be opened). It could be added to the
playthrough script.

Playbook works after removing the JCasC bruteforce installation.


<a id="orga9e23c4"></a>

# Fri May 10 04:17:05 PM CEST 2024

We need Terraform on the Jenkins server. Time to update the playbook.
[Installation instructions from Hashicorp](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli).


<a id="org8e82706"></a>

# Sat May 11 04:45:30 PM CEST 2024

Look what happened after just copying the .repo link from the instructions:
fatal: [jenkins]: FAILED! => {"changed": false, "msg": "Failed to download metadata for repo 'hashicorp': Cannot download repomd.xml: Cannot download repodata/repomd.xml: All mirrors were tried", "rc": 1, "results": []}

I remember this error. It has something to do with directory structure
and how different tools need different links. Either this link is too
specific or not specific enough. Need to look at other tasks that add
a repo with the yum<sub>repo</sub> ansible builtin.  Looking at tasks didn't
help, but a look at the [file](https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo) that was linked in the command \`sudo
yum-config-manager &#x2013;add-repo $URL\` shows this:

    [hashicorp]
    name=Hashicorp Stable - $basearch
    baseurl=https://rpm.releases.hashicorp.com/RHEL/$releasever/$basearch/stable
    enabled=1
    gpgcheck=1
    gpgkey=https://rpm.releases.hashicorp.com/gpg
    
    [hashicorp-test]
    name=Hashicorp Test - $basearch
    baseurl=https://rpm.releases.hashicorp.com/RHEL/$releasever/$basearch/test
    enabled=0
    gpgcheck=1
    gpgkey=https://rpm.releases.hashicorp.com/gpg

This file has fields that correspond to fields in a repository adding
task:

    - name: Add the Docker repo
      ansible.builtin.yum_repository:
        name: docker
        description: official docker repo
        baseurl: "https://download.docker.com/linux/\
          centos/$releasever/$basearch/stable"
        enabled: true
        gpgcheck: true

Looks like I need to copy the baseurl link. And I can add this to the
list of mistakes, so it will be easier to find later on. And easier to
remember. I wonder if I really should add the key in a separate task?
Let's see if there will be an error.
Also, what if we submitted the gpg key as an entry in the repo adding
task?

The previous repo (one with wrong URL) causes errors. Can we delete it
from the playbook with this?:

    - name: Remove wrong Hashicorp repository
      ansible.builtin.yum_repository:
        name: hashicorp
        present: false

fatal: [playbook-test-jenkins]: FAILED! => {"changed": false, "msg":
"Unsupported parameters for (ansible.builtin.yum<sub>repository</sub>) module:
present. Supported parameters include: async, attributes, bandwidth,
baseurl, cost, deltarpm<sub>metadata</sub><sub>percentage</sub>, deltarpm<sub>percentage</sub>,
description, enabled, enablegroups, exclude, failovermethod, file,
gpgcakey, gpgcheck, gpgkey, group, http<sub>caching</sub>, include, includepkgs,
ip<sub>resolve</sub>, keepalive, keepcache, metadata<sub>expire</sub>,
metadata<sub>expire</sub><sub>filter</sub>, metalink, mirrorlist, mirrorlist<sub>expire</sub>, mode,
module<sub>hotfixes</sub>, name, owner, password, priority, protect, proxy,
proxy<sub>password</sub>, proxy<sub>username</sub>, repo<sub>gpgcheck</sub>, reposdir, retries,
s3<sub>enabled</sub>, selevel, serole, setype, seuser, skip<sub>if</sub><sub>unavailable</sub>,
ssl<sub>check</sub><sub>cert</sub><sub>permissions</sub>, sslcacert, sslclientcert, sslclientkey,
sslverify, state, throttle, timeout, ui<sub>repoid</sub><sub>vars</sub>, unsafe<sub>writes</sub>,
username (attr, ca<sub>cert</sub>, client<sub>cert</sub>, client<sub>key</sub>, validate<sub>certs</sub>)."}

No, we can't. But we received a list of supported parameters. 'gpgkey'
is present. Also, there is a state parameter. I'm guessing that the
'absent' state is what will remove the repo.

    - name: Remove wrong Hashicorp repository
      ansible.builtin.yum_repository:
        name: hashicorp
        state: absent

And it worked.

I should also modify other repo-adding tasks, to keep the style
consistent throughout the playbook.

The 'terraform' package is missing. I'll log in to the server and try
to run a \`dnf search\` to see if I can find the package myself.

[root@jenkins-master vagrant]# dnf update
Bad id for repo: Hashicorp Stable - x86<sub>64</sub> (Hashicorp Stable -
$basearch), byte =   9

So maybe I can't use bash variables in the repo name after all?

Changing this: "name: Hashicorp Stable - $basearch"
To plain "Hashicorp Stable".
The idempotent nature of Ansible should allow to just change the name
in the playbook - the command will guess that what I'd like is to just
change the name of the repo. Will it?

[root@jenkins-master vagrant]# dnf update
Bad id for repo: Hashicorp Stable, byte =   9
Bad id for repo: Hashicorp Stable - x86<sub>64</sub> (Hashicorp Stable -
$basearch), byte =   9

No, it just added another repo. And it's till wrong. Time to search
for an answer&#x2026; No conclusive answer, but some people had similar
issues and solved them by clearing the dnf cache.

Didn't work. But the instructions that use the higher level link
probably work. I just need to swap the yum command to an updated dnf
version. ChatGPT says that dnf equivalent for \`yum-config-manager\` is
the \`dnf config-manager\` which then accepts an \`&#x2013;add-repo\` flag.

Successfully added the repo and \`dnf search terraform\` successfully
finds Terraform packages now. I just need to look at the installed
repository configurations on the system and spot the difference.


<a id="org508a0b6"></a>

# Mon May 13 03:01:03 PM CEST 2024


<a id="org869c69f"></a>

## Asked ChatGPT about how DNF stores repository info.

User
How does DNF store repository info on a rhel/centos system?
ChatGPT

On a RHEL/CentOS system, DNF (Dandified YUM) stores repository information in the form of .repo files located in the *etc/yum.repos.d* directory. These files contain configuration information for enabling or disabling repositories, as well as URLs where the packages are located.

Here's a breakdown of how DNF uses these .repo files:

Repository Files: Each .repo file can contain one or more repository sections. Each section begins with [repositoryid] and includes directives like name, baseurl, enabled, and gpgcheck.

Cache: DNF maintains a cache of enabled repositories and their metadata to speed up operations without fetching data each time. This cache is located under *var/cache/dnf*.

DNF Configuration: The main configuration for DNF is located in /etc/dnf/dnf.conf. This file includes global settings that affect all repositories.

Variables: DNF allows the use of variables (like $releasever and $basearch) in the .repo files, which are dynamically replaced with the appropriate values based on the system and environment.


<a id="org1e490d2"></a>

## So, going to compare the .repo files. But first will clear the cache manually.

No luck clearing out /var/cache/dnf.

Looking at the *etc/yum.repos.d* gives an interesting info:

    [vagrant@jenkins-master ~]$ ls /etc/yum.repos.d/
    'Hashicorp Stable - $basearch.repo'
    'Hashicorp Stable.repo'
     almalinux-appstream.repo
     almalinux-baseos.repo
     almalinux-crb.repo
     almalinux-extras.repo
     almalinux-highavailability.repo
     almalinux-nfv.repo
     almalinux-plus.repo
     almalinux-resilientstorage.repo
     almalinux-rt.repo
     almalinux-sap.repo
     almalinux-saphana.repo
     docker.repo
     hashicorp.repo
     jenkins.repo

At first I thought that Ansible inserted single quotes for the
Hashicorp repo, but it didn't for the other it installed. Then I
remembered that for a few years, \`ls\` put's names containing spaces in
quotes.

I thought that the quotes are what messes up the repo name, but there
is another character that does show in the repo added by me and
doesn't show in the others - spaces.

Will now check if removing the spaces from the names will help.

It didn't.

Going to compare the working file installed by 'dnf config-manager
&#x2013;add-repo' with the one I told Ansible to add.

Looks like there is a difference in a different parameter, without a
name.
1,6c1,6
< [hashicorp]
< name=Hashicorp Stable - $basearch
< baseurl=<https://rpm.releases.hashicorp.com/RHEL/$releasever/$basearch/stable>
< enabled=1
< gpgcheck=1
< gpgkey=<https://rpm.releases.hashicorp.com/gpg>
&#x2014;
> [Hashicorp Stable]
> baseurl = <https://rpm.releases.hashicorp.com/RHEL/$releasever/$basearch/stable>
> enabled = 1
> gpgcheck = 1
> gpgkey = <https://rpm.releases.hashicorp.com/gpg>
> name = official hashicorp repo

Changed the thing in the brackets to something without spaces solved
the problem.

What an annoying thing. How was I supposed to know not to use spaces
in the name?


<a id="orgb28b933"></a>

# Sun Jun  2 06:04:15 PM CEST 2024

Looks like there is one more issue with the Hashicorp repo. Playbook
went through all steps until new packages installation and ended with a
Byzantine error:


<a id="orgda04750"></a>

## Error MSG

\#+BEGIN<sub>SRC</sub> bash
TASK [Install required packages]

An exception occurred during task execution. To see the full traceback, use -vvv. The error was: OSError: Empty mirrorlist and no basepath specified!
fatal: [playbook-test-jenkins]: FAILED! `> {"changed": false, "module_stderr": "Connection to 10.11.12.6 closed.\r\n", "module_stdout": "Traceback (most recent call last):\r\n  File \"/usr/lib/python3.9/site-packages/dnf/util.py\", line 113, in _urlopen\r\n    repo._repo.downloadUrl(url, fo.fileno())\r\n  File \"/usr/lib64/python3.9/site-packages/libdnf/repo.py\", line 433, in downloadUrl\r\n    return _repo.Repo_downloadUrl(self, url, fd)\r\nRuntimeError: Empty mirrorlist and no basepath specified!\r\n\r\nDuring handling of the above exception, another exception occurred:\r\n\r\nTraceback (most recent call last):\r\n  File \"/home/vagrant/.ansible/tmp/ansible-tmp-1717343997.6279154-268908-74966212707374/AnsiballZ_dnf.py\", line 107, in <module>\r\n    _ansiballz_main()\r\n  File \"/home/vagrant/.ansible/tmp/ansible-tmp-1717343997.6279154-268908-74966212707374/AnsiballZ_dnf.py\", line 99, in _ansiballz_main\r\n    invoke_module(zipped_mod, temp_path, ANSIBALLZ_PARAMS)\r\n  File \"/home/vagrant/.ansible/tmp/ansible-tmp-1717343997.6279154-268908-74966212707374/AnsiballZ_dnf.py\", line 47, in invoke_module\r\n    runpy.run_module(mod_name`'ansible.modules.dnf', init<sub>globals</sub>=dict(<sub>module</sub><sub>fqn</sub>='ansible.modules.dnf', \_modlib<sub>path</sub>=modlib<sub>path</sub>),\r\n  File \\"/usr/lib64/python3.9/runpy.py\\", line 225, in run<sub>module\r\n</sub>    return \_run<sub>module</sub><sub>code</sub>(code, init<sub>globals</sub>, run<sub>name</sub>, mod<sub>spec</sub>)\r\n  File \\"/usr/lib64/python3.9/runpy.py\\", line 97, in \_run<sub>module</sub><sub>code\r\n</sub>    \_run<sub>code</sub>(code, mod<sub>globals</sub>, init<sub>globals,\r\n</sub>  File \\"/usr/lib64/python3.9/runpy.py\\", line 87, in \_run<sub>code\r\n</sub>    exec(code, run<sub>globals</sub>)\r\n  File \\"/tmp/ansible<sub>ansible.legacy.dnf</sub><sub>payload</sub><sub>o95os63i</sub>/ansible<sub>ansible.legacy.dnf</sub><sub>payload.zip</sub>/ansible/modules/dnf.py\\", line 1365, in <module>\r\n  File \\"/tmp/ansible<sub>ansible.legacy.dnf</sub><sub>payload</sub><sub>o95os63i</sub>/ansible<sub>ansible.legacy.dnf</sub><sub>payload.zip</sub>/ansible/modules/dnf.py\\", line 1354, in main\r\n  File \\"/tmp/ansible<sub>ansible.legacy.dnf</sub><sub>payload</sub><sub>o95os63i</sub>/ansible<sub>ansible.legacy.dnf</sub><sub>payload.zip</sub>/ansible/modules/dnf.py\\", line 1325, in run\r\n  File \\"/tmp/ansible<sub>ansible.legacy.dnf</sub><sub>payload</sub><sub>o95os63i</sub>/ansible<sub>ansible.legacy.dnf</sub><sub>payload.zip</sub>/ansible/modules/dnf.py\\", line 1229, in ensure\r\n  File \\"/usr/lib/python3.9/site-packages/dnf/base.py\\", line 2531, in \_get<sub>key</sub><sub>for</sub><sub>package\r\n</sub>    keys = dnf.crypto.retrieve(keyurl, repo)\r\n  File \\"/usr/lib/python3.9/site-packages/dnf/crypto.py\\", line 185, in retrieve\r\n    with dnf.util.<sub>urlopen</sub>(keyurl, repo=repo) as handle:\r\n  File \\"/usr/lib/python3.9/site-packages/dnf/util.py\\", line 117, in \_urlopen\r\n    raise IOError(str(e))\r\nOSError: Empty mirrorlist and no basepath specified!\r\n", "msg": "MODULE FAILURE\nSee stdout/stderr for the exact error", "rc": 1}
\#END<sub>SRC</sub>


<a id="org6e3ba01"></a>

## dnf output on the server

Importing GPG key 0xA621E701:
 Userid     : "HashiCorp Security (HashiCorp Package Signing) <security+packaging@hashicorp.com>"
 Fingerprint: 798A EC65 4E5C 1542 8C8E 42EE AA16 FCBC A621 E701
 From       : <https://rpm.releases.hashicorp.com/gpg>
Is this ok [y/N]: 

After logging in onto the server and trying to manually install
terraform with dnf, I got asked to confirm the repo key fingerprint.
Is there a bug in the task adding the Hashicorp repo?

I will confirm the fingerprint but cancel the installation and re-run
the playbook.

A thought - is this why in many tutorials actions of adding a repo
and it's key are divided into separate tasks?

Still failed. Going to ask ChatGPT to look at the playbook code, tho
to me it looks the same as other repo adding tasks. Here is code for
docker repo and Hashicorp repo tasks:

    - name: Add the Docker repo
      ansible.builtin.yum_repository:
        name: docker
        description: official docker repo
        baseurl: "https://download.docker.com/linux/\
          centos/$releasever/$basearch/stable"
        enabled: true
        gpgcheck: true
        gpgkey: "https://download.docker.com/linux/
          centos/gpg"
    
    - name: Add Hashicorp repository
      ansible.builtin.yum_repository:
        name: hashicorp
        description: official hashicorp repo
        baseurl: "https://rpm.releases.hashicorp.com/\
          RHEL/$releasever/$basearch/stable"
        enabled: true
        gpgcheck: true
        gpgkey: "https://rpm.releases.hashicorp.com/gpg"

But before I ask ChatGPT, I'll change the "RHEL" in baseurl for
Hashicorp repo into "centos" like in the docker baseurl. No, it
doesn't work like that, here is the error msg:

    fatal: [playbook-test-jenkins]: FAILED! => {"changed": false, "msg": "Failed to download metadata for repo 'hashicorp': Cannot download repomd.xml: Cannot download repodata/repomd.xml: All mirrors were tried", "rc": 1, "results": []}

Maybe should read the docs/instructions for the
ansible.builtin.yum<sub>repository</sub> module?

What if the issue is because I've run the playbook with wrong name
once before running it again? I forgot that even though the Repo
Ansible Module is idempotent, it's not magic and if we change name of
the repo, it will loose track of it. Let's try again after reverting
to a snapshot of a fresh system install.

Note: (not correct) when running command \`vagrant snapshot restore
$SNAPSHOT<sub>NAME</sub>\`, vagrant will attempt to retrieve snapshot
$SNAPSHOT<sub>NAME</sub> for each VM. Dangerous but useful. On the other hand,
it's probably not the behavior for when the target VM is explicitly
named in the command. Ok, looks like it's a bug, because the snapshot
change is only attempted for the first VM. To restore a snapshot to
another I most likely need to explicitly name it.

Found the error, it's actually not in the Hashicorp repo. The error
message was a big wall of text, very difficult to read. By sheer luck
my eyes fell on a message I've missed, that is: "Cannot download
centos/gpg". This message is relevant only for the Docker Repo task:

    - name: Add the Docker repo
      ansible.builtin.yum_repository:
        name: docker
        description: official docker repo
        baseurl: "https://download.docker.com/linux/\
          centos/$releasever/$basearch/stable"
        enabled: true
        gpgcheck: true
        gpgkey: "https://download.docker.com/linux/
          centos/gpg"

This is the only task that has centos/gpg in it's key address. But why
is the full URL of the address not present in the error message?
Because there is a mistake in escaping the "newline". A backslash (\\)
is missing, which makes Ansible think that gpgkey received a list of
two parameters instead of one string divided over two lines. Good to
know.

Fixing it and testing again.

Works! Yuppi!

Re-read the project's task list. I was stuck on some not essential
sub section of Part 4, Deploying the Flask Web app to
Fargate. Specifically, "Upload Docker image to ECR". It is now marked
as DONE, but since so much time passed since I've done it, I should
create the repo and upload it again before moving on to the next.
Just to be sure added a new task and marked it as TODO.

I've made two modifications to the Ansible playbook that provisions
the main Jenkins server and initially wanted to commit them both at
the same time. But commits should be atomic, and since these were two
distinct changes, I've divided them into two commits. One for adding
Terraform installation and another for changing how repositories' keys
are added. Thanks to Emacs - Magit package it is very easy to commit
only some lines of changes to a file.


<a id="orge3ac93f"></a>

# Tue Jun 11 09:25:28 AM CEST 2024

I've provisioned a new container repository using Terraform, but did
it on the development machine. It's good enough.

Need to solve the issue of getting my AWS credentials to the Jenkins
server machine(s). I've written a sourced script to get the secrets
from Bitwarden with just a one command. In theory, installing
Bitwarden on such a machine would allow to use it. Since the script is
setting global variables, it has to be sourced. It has an inbuilt
check that makes sure that it's used correctly.


<a id="org99924a9"></a>

# Tue Jun 11 09:39:58 AM CEST 2024

Forgot that what was to be tested was not only creating a repo but
also uploading a container image to it.

I think that the initial Jenkins pipeline was doing just that. Not
sure if the file with pipeline definition is in the repo. Need to
check. It's not there, that's sad. At the point of working with
Jenkins I didn't realize the separation between IaC configuration of
the Jenkins Server itself and pipelines. I thought that both require
the special JCasC plugin. Now I know that IaC, i.e. saving pipeline
configuration as code in a Jenkinsfile is already a standard. If I
only copied what I've set up back then into a file in the repo, I
could easily duplicate the work.

Now time to check if I have anything about uploading the image in this
coding journal. I'm going to use git blame on the documentation,
because the line with the task for uploading the image would have been
marked as completed in the same commit (or around it) as the sections
describing it in the journal.

I didn't entry the commands. But there is a link to tutorial I
used.


<a id="org6c83681"></a>

## Here is the code again:

    ACCOUNT=$(aws sts get-caller-identity | jq -r .Account)
    REGION='eu-north-1'
    REPO='flask_cicd_repo'
    
    docker build -t ${ACCOUNT}.dkr.ecr.${REGION}.amazonaws.com/${REPO} .
    
    aws ecr get-login-password \
        --region ${REGION} \
    | docker login \
        --username AWS \
        --password-stdin ${ACCOUNT}.dkr.ecr.${REGION}.amazonaws.com
    
    docker push ${ACCOUNT}.dkr.ecr.${REGION}.amazonaws.com/${REPO}

I've put it into a script in the python-flask-cicd-code repo. Script
is called push-image-jenkinsless.sh.


<a id="org7e94e4e"></a>

# Thu Jun 13 01:43:30 PM CEST 2024

Still need secrets on the machine. It wasn't difficult to modify the
playbook to install the bitwarden-cli tool downloaded from
github. Unarchive ansible builtin can also set permissions and
unarchive directly where we need our files. I've lost some time
installing the Bitwarden desktop app instead of CLI, but soon learned
of my mistake. It seemed weird that a CLI app was 80MB in size.

With the bw-cli, helper scripts related to this project (that pull
secrets from bitwarden cli) can be used. This will make prototyping
much more comfortable. Might also come in handy in the future. Helper
packages and tasks are kept in the same playbook, but separate from
the other tasks and together, so they can be either removed or moved
to a conditional block or in some other way decoupled from the
essential parts of the playbook.

The /bin directory from the server part of the project will be copied
onto the server, thus simplifying use of the helper scripts.

Interesting, playbook started suddenly failing on bw-cli
download. Looks like somebody just removed the enterprise and open
source separation in the binaries and left only one of them, removing
both "oss" and the other adjective from the file names.


<a id="orgce7fd72"></a>

# Thu Jun 13 07:45:23 PM CEST 2024

Will continue with pulling of the repo in Ansible later. Now a quick
detour to make this repo more accessible from GitHub. We need to
create a git-hook that will automatically export both project journal
and documentation automatically to html on each commit/stage, and then
stage the resulting file. This way there can be a nice html file to
link to from project's README.

To simplify matters, I'm starting with learning how to headlessly
export an .org file to html. Afterwards will sort out the hooks part.

I can also boost the speed by first manually generating the initial
.html versions of the journal and documentation.


<a id="org55fad33"></a>

# Sat Jun 15 03:49:15 PM CEST 2024

Modified playbook to perform a sparse checkout of the repo's bin
directory and copy the pulled scripts into /usr/local/bin (not
/usr/bin or /usr/sbin, because these directories are managed by
package manager). There is also an option of replacing these two tasks
with


<a id="org16be5c2"></a>

## this alternative task:

that doesn't trigger ""changed"" in ansible playbook execution.
Did it together with ChatGPT running gpt-4-t.

    
    - name: Sparse checkout and ensure only changes are reported
      ansible.builtin.shell:
        cmd: |
          if [ ! -d "{{ sparse_checkout_path }}/.git" ]; then
            git clone --filter=blob:none --no-checkout {{ bin_repo_name }} {{ sparse_checkout_path }}
            cd {{ sparse_checkout_path }}
            git sparse-checkout init --cone
            git sparse-checkout set bin/
          else
            cd {{ sparse_checkout_path }}
            git fetch --depth=1
            BEFORE=$(git rev-parse HEAD)
            git pull
            AFTER=$(git rev-parse HEAD)
            if [ "$BEFORE" == "$AFTER" ]; then
              echo "No changes detected."
            else
              echo "Changes were pulled from the repository."
            fi
          fi
        args:
          executable: /bin/bash
      register: git_checkout
      changed_when: "'Changes were pulled from the repository.' in git_checkout.stdout"
      become: yes
      become_user: "{{ regular_user }}"

Explanation

Directory Check: This script first checks if the directory exists and initializes it as a Git repository only if it doesn't exist. This avoids re-cloning the repository unnecessarily.
Fetch and Pull: It then fetches new data from the repository and checks if the latest commit hash changes after a pull. This determines if there were any actual changes.
Change Reporting: The task reports a change only if the commit hash changes after the pull, which Ansible tracks via the changed<sub>when</sub> condition.

Notes

{{ bin<sub>repo</sub><sub>name</sub> }} should be replaced with your actual repository URL.
{{ sparse<sub>checkout</sub><sub>path</sub> }} should be the path where you want to checkout the repository, like /home/{{ regular<sub>user</sub> }}/sparse<sub>repo</sub>.
The task uses Bash scripting to control the logic, which is more flexible but requires careful handling to ensure security and proper execution.
This task assumes that the environment is set up to handle Git commands and that appropriate SSH keys or access tokens are configured for accessing private repositories.

This setup minimizes playbook complexity by consolidating multiple
operations into a single task and ensures that changes are only
reported when they actually occur, keeping your Ansible runs
idempotent and efficient.


<a id="orga0e78ff"></a>

# Sun Jun 16 04:27:48 PM CEST 2024

Back to auto-generating the .html file. Or not yet. Need to create a
README.md first.

Got an initial version of the README generated, had to modify the
prompt a little. Need to adapt it further to the project. The gpt-4o
model was better suited for the task. Strange, as I thought that the
gpt-4-turbo is actually better. Seems the 4t is better for factual
tasks while 4o better for creative tasks. Might be the models are the
same, but in the ChatGPT interface they have a different temperature
setting.

While working on the markdown README I got the idea that maybe
markdown, as a GitHub native document type, might be better? I didn't
know Emacs-Org could export to markdown, but it can. On the other
hand, will markdown really be better for very large files? I don't
think either .html or .md is any good really. But "na bezrybiu i rak
ryba" (polish: In the absence of fish, even crayfish is a fish), with
no other options, anything will do.


<a id="org8933cdf"></a>

# Mon Jun 17 07:00:09 PM CEST 2024

Refactoring the README is going well. It's a very nice
template. Describing the project's structure put to my attention the
existence of a directory that's not in use anymore -
jenkins<sub>config</sub>. Going to delete it and commit the deletion to git.


<a id="org25b7e7e"></a>

# Mon Jun 17 08:22:59 PM CEST 2024

Finished first iteration of the README, including linking back to main
project's README from README inside the app code repo. In case I
forget, to allow Emacs export org to markdown, first enable the
markdown export backend with M-x \`customize-option\`
\`org-export-backends\`. I'll make git hooks to auto generate actual
documentation versions later. For now it's just placeholder versions,
generated today.


<a id="org64fce52"></a>

# Tue Jun 18 01:57:47 PM CEST 2024

Renamed project documentation to project plan. Along with links to it
that were inside the README.

Also fixed a lot of typos throughout the project.

Attempting to manually build and upload the image from docker. Don't
need to copy any AWS credentials by hand because I can just run one of
the helper scripts to put them into environment variables.

Looks like the scripts and Bitwarden were not yet installed on the
laptop version of Jenkins VM. Run the playbook to have it done.

Needed to clone in the app repo, but it was pretty quick. At vagrant
user's home, run 'git clone
<https://github.com/Ignacy-s/python-flask-cicd-code>'
This got the repo in a second and then from there had to create the
ECR repository by moving into terraform/ecr<sub>repository</sub> and running
\`terraform {init,apply}\`

Couldn't run docker commands. The playbook is not adding the default
(vagrant) user to the docker group. Need to fix it in the
playbook. It's still much faster thanks to putting things into
scripts.

After looking at the playbook I've noticed that the jenkins user is in
the docker group already. I could just su into the jenkins user and
run it from there. Or even do a sudo -u jenkins?
\`sudo -u jenkins\` didn't work. \`su jenkins\` didn't work either. After
running \`grep jenkins /etc/passwd\` I've noticed that Jenkins is a
special, no login shell user. So it's easier to just give the extra
group to the vagrant user just for this test. Remember that groups are
assigned and re-assigned at login. So need to do a \`sudo su
$YOUR<sub>USERNAME</sub>\` to get the new access. It also means you can't stop
somebody from accessing his group right by taking the group from him
if you don't also boot that user from the system.

Had to log out from the server and log in again. Both \`bw\` and helper
scripts commands were inaccessible after doing a \`sudo su vagrant\` to
perform a soft re-login. Even after running \`exec /bin/bash\` which
should in theory restart the shell. \`exec\` command has some special
functionality and if used like in the example above, it will make our
shell "become" the new program, so the new program gets our shell's
PID and so on). Logging out of the server and ssh-ing back into it
resulted with a functional shell.

The script however didn't work. It said that there doesn't exist a
repository with the specified name. Moved to the terraform directory
to investigate. Didn't remember terraform commands, but trying
\`terraform status\` resulted in it suggesting \`terraform state\`. This
gave a list of second words for the state command. \`terraform state
list\` has shown how my ECR repository is called by terraform:
aws<sub>ecr</sub><sub>repository.flask</sub><sub>cicd</sub><sub>repo</sub>". Knowing this I could run
\`terraform state show aws<sub>ecr</sub><sub>repository.flask</sub><sub>cicd</sub><sub>repo</sub>\` which has
shown a JSON like output with this object's details:

    name                 = "flask-cicd"

So I guess that from Docker's perspective, the above name should be
used, and not the flask<sub>cicd</sub><sub>repo</sub> as used in Terraform. I think I've
included the small variation in names just to cause errors like that,
as to better know which from which side we access services with which
names. It might have also been a mistake though.

Thanks to the script using variables, it was easy to change the value
for REPO.

Now time to push the change in script to GitHub and pull the correct
version from GitHub on the server.

It worked. Image successfully pushed :)

Looks like I finally moved the project forward one notch. Now it's
time to write the Terraform code to deploy to the cloud.


<a id="org93d6e27"></a>

# Wed Jun 19 10:39:36 AM CEST 2024

Destroying the existing Terraform infrastructure to avoid incurring
costs while working with the tutorial.

Watched a YouTube video to revise how ECS works. 
Summary:

ECS is a container orchestrator like Kubernetes or Docker Swarm. ECS
works either as a managed service (Fargate) or managed by you
(EC2). Fargate works more like lambda (servers running the containers
are abstracted from us) and that's what we are going to use.

From Top to Bottom, we have:

-   ECS Clusters, which can run multiple:
-   Services, which are comprised of one or more:
-   Tasks, which are like docker-compose files, with one or more:
-   Containers

Beginning with testing the application container. Don't want to spend
hours debugging our setup only to find out that the container was
misconfigured.

    # Build the container
      docker build -t test-container .
    # Run the container
      docker run -tdi -p 9999:80 test-container
    # Test the container
      curl localhost:9999
    
    > Hello, World!

It's working :)


<a id="org51940ce"></a>

# Thu Jun 20 09:48:59 AM CEST 2024

Modifying the git pre-commit hook to auto generate markdown versions
of the docs.
In next project I could just place them in one directory under docs or
documentation.

I'll also commit the hooks to repo. But since the hooks are not
modified THAT often, I'm not going to automate copying from .git/hooks
to git<sub>hooks</sub>.


<a id="orga560bd2"></a>

# Wed Jun 19 04:52:29 PM CEST 2024

Now it's time for task definition.  It's something between a
Vagrantfile and a docker-compose file. It defines what containers we
are using and what ports they want exposed and drive mappings.  It
also defines hardware requirements like CPU or RAM.


<a id="org639a30f"></a>

# Tue Jun 25 08:47:45 PM CEST 2024

Before a Task Definition is used to deploy to an ECS cluster, we need
to define such a cluster in Terraform.

Should I define the ECS Cluster in the same file as the ECR
repository?

And how should I pass the info about the existing infrastructure to
another file?

1.  Using Terraform Remote State, where you setup an S3

bucket and use it to store the state and access it from multiple
machines.

1.  Using Terraform Data Source (which is local). In it's simplest form

it requires that the names of the resources are known. This is not a
problem in this simple, local, PoC project.


<a id="orgc73a45e"></a>

# Thu Jun 27 06:58:45 PM CEST 2024

After re-reading conversation with ChatGPT about ways to exchange data
between separate local Terraform projects I've decided to use the
simplest method. I can add an external state in the next iteration of
the project.

Reading docs about Task Definition:
[- Terraform ECS Module documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_task_definition)
[-Task Definition Parameters (AWS Developers Docs)](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task_definition_parameters.html)

So, the **family** and **container definitions** are mandatory, and there
are some other parameters that aren't.

-   Family - it's pretty much a name of the task definition, but not
    specific to any revision of a task. This is important if we auto
    generate the Task Definitions, as then each subsequent version will
    get a name that is the family + an increasing number.
-   Container Definitions - This is a whole box of new parameters:
    -   Name
    -   Image
    -   Memory
    -   Port mappings
    -   Private Repository Credentials

Going to read up on them.


<a id="org48a0e8a"></a>

# Fri Jun 28 10:52:06 AM CEST 2024

Explanation of the above parameters:


<a id="orga382cc0"></a>

## Name

The name of the container. It's not used to define the image, but it's
used when for example linking containers together (linked containers
can see each other on a local network).


<a id="org39bd09b"></a>

## Image

This parameter defines our image. If the image is not accessible from
docker hub it should also contain the link to our repo. It has form
of:
****repository-url/image:tag****
or
****repository-url/image@digest****

This is the most important part.

Example:
aws<sub>account</sub><sub>id.dkr.ecr.region.amazonaws.com</sub>/my-web-app:latest


<a id="orga17ef5f"></a>

## Memory

Amount of RAM in MB for the container. Optional when using Fargate
(which is our case).


<a id="orgb2bc131"></a>

## Port mappings

Used to expose ports from the containers.

Example:
"portMappings": [
    {
        "name": string,
        "containerPort": integer
    }
]


<a id="orge4d2426"></a>

## Private Repository Credentials

Required when using non AWS repository. Doesn't apply since we use the
ECR.


<a id="orgef94e3b"></a>

## Other parameters:

There are other parameters that are not as commonly used and mostly
correspond to docker options and AWS' own metrics and logging:
    Health check
    Environment
    Network settings
    Storage and logging
    Security
    Resource limits
    Docker labels


<a id="org74c37e9"></a>

# Fri Jun 28 11:15:02 AM CEST 2024

There is a template for a Task Definition in the AWS Developer Guide, which can
be found [here](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task-definition-template.html).

I've used a technique of "leaving some work unfinished" which is
supposed to make it easier to resume work after a break and help "hit
the ground running". It made it easier to come back into work.

The following task definition can be generated with AWS CLI using \`aws
ecs register-task-definition &#x2013;generate-cli-skeleton\`


<a id="orgaca713c"></a>

## Template Task Definition

for a Fargate type instance.

Important

For the Fargate launch type, you must include the operatingSystemFamily parameter with one of the following values:

LINUX

WINDOWS<sub>SERVER</sub><sub>2019</sub><sub>FULL</sub>

WINDOWS<sub>SERVER</sub><sub>2019</sub><sub>CORE</sub>

WINDOWS<sub>SERVER</sub><sub>2022</sub><sub>FULL</sub>

WINDOWS<sub>SERVER</sub><sub>2022</sub><sub>CORE</sub>

    {
        "family": "",
        "runtimePlatform": {"operatingSystemFamily": ""},
        "taskRoleArn": "",
        "executionRoleArn": "",
        "networkMode": "awsvpc",
        "platformFamily": "",
        "containerDefinitions": [
            {
                "name": "",
                "image": "",
                "repositoryCredentials": {"credentialsParameter": ""},
                "cpu": 0,
                "memory": 0,
                "memoryReservation": 0,
                "links": [""],
                "portMappings": [
                    {
                        "containerPort": 0,
                        "hostPort": 0,
                        "protocol": "tcp"
                    }
                ],
                "essential": true,
                "entryPoint": [""],
                "command": [""],
                "environment": [
                    {
                        "name": "",
                        "value": ""
                    }
                ],
                "environmentFiles": [
                    {
                        "value": "",
                        "type": "s3"
                    }
                ],
                "mountPoints": [
                    {
                        "sourceVolume": "",
                        "containerPath": "",
                        "readOnly": true
                    }
                ],
                "volumesFrom": [
                    {
                        "sourceContainer": "",
                        "readOnly": true
                    }
                ],
                "linuxParameters": {
                    "capabilities": {
                        "add": [""],
                        "drop": [""]
                    },
                    "devices": [
                        {
                            "hostPath": "",
                            "containerPath": "",
                            "permissions": ["read"]
                        }
                    ],
                    "initProcessEnabled": true,
                    "sharedMemorySize": 0,
                    "tmpfs": [
                        {
                            "containerPath": "",
                            "size": 0,
                            "mountOptions": [""]
                        }
                    ],
                    "maxSwap": 0,
                    "swappiness": 0
                },
                "secrets": [
                    {
                        "name": "",
                        "valueFrom": ""
                    }
                ],
                "dependsOn": [
                    {
                        "containerName": "",
                        "condition": "HEALTHY"
                    }
                ],
                "startTimeout": 0,
                "stopTimeout": 0,
                "hostname": "",
                "user": "",
                "workingDirectory": "",
                "disableNetworking": true,
                "privileged": true,
                "readonlyRootFilesystem": true,
                "dnsServers": [""],
                "dnsSearchDomains": [""],
                "extraHosts": [
                    {
                        "hostname": "",
                        "ipAddress": ""
                    }
                ],
                "dockerSecurityOptions": [""],
                "interactive": true,
                "pseudoTerminal": true,
                "dockerLabels": {"KeyName": ""},
                "ulimits": [
                    {
                        "name": "msgqueue",
                        "softLimit": 0,
                        "hardLimit": 0
                    }
                ],
                "logConfiguration": {
                    "logDriver": "awslogs",
                    "options": {"KeyName": ""},
                    "secretOptions": [
                        {
                            "name": "",
                            "valueFrom": ""
                        }
                    ]
                },
                "healthCheck": {
                    "command": [""],
                    "interval": 0,
                    "timeout": 0,
                    "retries": 0,
                    "startPeriod": 0
                },
                "systemControls": [
                    {
                        "namespace": "",
                        "value": ""
                    }
                ],
                "resourceRequirements": [
                    {
                        "value": "",
                        "type": "GPU"
                    }
                ],
                "firelensConfiguration": {
                    "type": "fluentd",
                    "options": {"KeyName": ""}
                }
            }
        ],
        "volumes": [
            {
                "name": "",
                "host": {"sourcePath": ""},
                "configuredAtLaunch":true,
                "dockerVolumeConfiguration": {
                    "scope": "task",
                    "autoprovision": true,
                    "driver": "",
                    "driverOpts": {"KeyName": ""},
                    "labels": {"KeyName": ""}
                },
                "efsVolumeConfiguration": {
                    "fileSystemId": "",
                    "rootDirectory": "",
                    "transitEncryption": "ENABLED",
                    "transitEncryptionPort": 0,
                    "authorizationConfig": {
                        "accessPointId": "",
                        "iam": "ENABLED"
                    }
                }
            }
        ],
        "requiresCompatibilities": ["FARGATE"],
        "cpu": "",
        "memory": "",
        "tags": [
            {
                "key": "",
                "value": ""
            }
        ],
        "ephemeralStorage": {"sizeInGiB": 0},
        "pidMode": "task",
        "ipcMode": "none",
        "proxyConfiguration": {
            "type": "APPMESH",
            "containerName": "",
            "properties": [
                {
                    "name": "",
                    "value": ""
                }
            ]
        },
        "inferenceAccelerators": [
            {
                "deviceName": "",
                "deviceType": ""
            }
        ]
    }


<a id="org478f1d3"></a>

# Fri Jun 28 10:29:28 PM CEST 2024

Emacs' flycheck was throwing a lot of errors when I was re-typing task
definition from the example into my project. Turns out that the
examples in AWS docs are in raw JSON, however Terraform expects us to
use HCL.

So we don't quote the keys (just values) and there is an equal sign (=),
not a colon (:), between keys and values.

There is one big caveat. AWS expects that a part of the task
definition will be presented in JSON. Therefore, when writing our task
definition in HCL we need to remember to encapsulate the
ContainerDefinitions in parenthesis as an argument to a \`jsonencode\`
function, like this:

    container_definitions = jsonencode([
      {
        name      = "my-container"
        image     = "myrepo/myimage:latest"
        essential = true
        portMappings = [
          {
            containerPort = 80


<a id="org99d060e"></a>

# Sat Jun 29 01:46:13 PM CEST 2024

There are more differences between HCL and JSON task
definitions. Maybe I should take a look and base my task definition on
a HCL example instead.


<a id="org05d3698"></a>

# Sun Jun 30 08:48:12 PM CEST 2024

I've read trough the tutorial on
[Deploying
to ECS with Terraform from Earthly](https://earthly.dev/blog/deploy-dockcontainers-to-awsecs-using-terraform/). There is quite a lot of network
configuration before we can deploy to ECS. I think I'll just re-use
the networks from the Jenkins side of the project. In production, we
would either use a separate VPC altogether, or at least a separate
subnet. But here it's not important. Maybe in another iteration.

Not sure how I should use resources from a different Terraform
project, but I'm guessing that we just need to "declare" them with a
\`data\` object before we can use them. And then they need to have a
known name.

I've noticed something that's grabbing attention in the Terraform code
in the Flask side of the repo. All the names are hard-coded. I think
they should be later replaced with variables. I'm just not sure if it
should affect the terraform-side resources names. Not even sure if
these resources CAN have names assigned using variables.

After feeding the above journal entry to ChatGPT I've got a reply,
that the Terraform's resource names have to be static and unique in
each module. That means we can have identically named resources in
each module and it will not pose a problem with interoperability.

You cannot directly refer to a resource from another module. However,
you can refer to specific attributes of a resource from another module
under two conditions. First, the attribute must be defined in an
output block in the source module. Second, the source module must be
**sourced** in the module that needs to access these attributes.

It reminds me of bash, where we can source other scripts inside a
script to be able to use their functions or variables.


<a id="orgba331e1"></a>

# Mon Jul  1 08:28:25 PM CEST 2024

It's still a little complicated and a little overwhelming (the ECS
Fargate deployment). I had a chat with the artificially intelligent
rubber duck and decided to reduce complexity as much as possible. I
will move all the networking Terraform code from the main.tf in the
Jenkins project to a networking.tf. And maybe also create variables
for all the names.

Added some comments to the main.tf, but didn't separate it yet and
didn't move all stuff into variables.

Have to finish up describing the SSH key trick in the next coding
session.


<a id="org94c6d8f"></a>

# Tue Jul  2 12:53:42 PM CEST 2024

I've described the ssh key uploading trick a little and copied the
code into ChatGPT. It suggested even more verbose comments. I also
asked about whether it's better to have very verbose comments, or not
to use them at all (because the code is 'self documenting'). I've got
an interesting reply. In short, it depends, and the preffered amount
(and verbosity) of comments depends on 3 key factors: Audience
Expertise, Language and Technology complexity, Purpose of the Code,
Best Practices and Personal Preference.

When writing code by and for beginners, it's OK to include more
comments about how the tasks are performed and not limiting us to why
we have chosen some solution over the other. Another situation asking
for more comments would be when our team has some people on more
junior level. Then having more comments will allow the whole team to
contribute and maintain code.

Some languages are inherently more cryptic, complex and difficult to
grasp, while others are more clear. In the former we should comment
more.


<a id="org7796d0a"></a>

# Wed Jul  3 01:06:37 PM CEST 2024

Continuing refactoring of the Terraform code in the Jenkins
project. Starting by finishing the comments in main.tf.

I've finished comments on all the code blocks in main.tf. Especially
explaining cryptic solutions typical for Terraform that would be
difficult to grasp for newcomers.

I've also added a retry option for the "null<sub>resource</sub>" which runs a
script updating Ansible's inventory file by calling an external
script.

Next I should move the variables out from the main.tf into the vars.tf
file.

