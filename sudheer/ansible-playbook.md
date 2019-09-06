# INTRODUCTION TO ANSIBLE PLAYBOOKS

# Table of Contents

[Overview](#overview)

[Pre-Requisites](#pre-requisites)

[test](#test)
## Overview

Welcome to the Introduction to Ansible Playbooks Learning Lab!

Ansible Playbooks are an organized unit of scripts that is used for server configuration management by the automation tool Ansible. Ansible Playbooks are used to automate the configuration of multiple servers at a time. Playbooks are written in YAML format.

Playbook contains one or more plays/tasks which executes a simple command or a script. Every playbook has an attribute hosts, where servers or group of servers are defined. These plays are executed in sequencial manner on the servers defined in the playbook.



It is possible to run several hundreds of tasks in a single playbook, but it is efficient to reuse a task multiple time in multiple playbooks so tasks or group of tasks can be organized into roles. These roles can be included into a playbook. Directory structure of a sample ansible project is:

provision.yaml
webserver.yaml
roles/
  provision_server/
  tasks/
    main.yaml
  handlers/
  files/
  templates/
  vars/
  defaults/
  webserver/
  tasks/
  files/
  templates/

In the above hierarchy provision.yaml and webserver.yaml are the playbooks defined in the project and roles directory contains 2 roles, provision and webserver.

Each role has multiple folders:

- tasks - contains single or multiple yaml files with each file containing multiple tasks
- handlers - contains handlers that can be used in this role like restart service 
- files - contains files that are copied into the target machine
- templates - contains a template file which can be used for deploying into the target machine. Template files are used with the variables defined in the playbook.
- vars - common variables that are used in this role. 
- defaults - variables that are default for the role can be defined in this folder. 

In the above folder structure the tasks folder is the mandatory folder and all the other folders are optional. In this tutorial we will learn about ansible playbooks and how different roles are executed in multiple servers from a single playbook. We will learn some Ansible features and how they are helpful in playbooks.

Click Start above to begin the lab!


## test

![](https://qloudableassets.blob.core.windows.net/devops/1.png?st=2019-09-06T10%3A31%3A31Z&se=2022-09-07T10%3A31%3A00Z&sp=rl&sv=2018-03-28&sr=c&sig=fwljWymO6LKz5xubtKh3mAsK3r858hNP%2Bl6%2FtadP4MM%3D)
