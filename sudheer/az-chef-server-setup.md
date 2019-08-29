# CHEF AUTOMATE

# Table of Contents

[Overview](#overview)

[Pre-Requisites](#pre-requisites)

[Login to the Azure portal](#login-to-the-azure-portal)

[Launch VMs for Chef Server and Workstation](#launch-vms-for-chef-server-and-workstation)

## Overview

Chef has three main architectural components: Chef Server, Chef Client (node), and Chef Workstation.

The Chef Server is the management point and there are two options for the Chef Server: a hosted solution or an on-premises solution. We will be using a hosted solution.

The Chef Client (node) is the agent that sits on the servers you are managing.

The Chef Workstation is the admin workstation where we create policies and execute management commands. We run the knife command from the Chef Workstation to manage the infrastructure.

There is also the concept of “Cookbooks” and “Recipes”. These are effectively the policies we define and apply to the servers.

## Pre-Requisites

Linux basics
Know about VM creation in Azure 

## Login to the Azure portal

In the lab console window, use the web browser and go to https://portal.azure.com

For login credentials click on access info left top of context window. Click on required value To copy to clip board and past it on worksapace window.

Enter the username provided in the lab credentials.



Enter the password Provided in the lab credentials.



The dashboard of the Azure portal will Appear after a successful login.


## Launch VMs for Chef Server and Workstation

In this section, we are going to create ubuntu 16.04 instances for chef-server and workstation.

Note : Virtual Machine name must be unique for both chef and workstation servers.

Launching vm for Chef server:

Step 1: On Azure portal (https://portal.azure.com), click on "Create a resource" from the navigation pane.

Step 2: Search for "Ubuntu Server", select "Ubuntu 16.04 LTS" from the search dropdown and click on create.

Step 3: Leaving the default values untouched, Fill the form as below.
Resource group: Select the name of RG shared with your login credentials.
Virtual Machine Name: <Any name> 
Authentication type: Password
Username: chefuser           use same credentials for both vms 
Password: Password@1234

Public inbound ports: Check the radio button "Allow selected ports" and allow ports 22 & 443 from the dropdown.
   
Step 4: On the next steps "Disks and Networking", Leave all fields to defaults and proceed to the Management tab.

Step 5: Set the "Boot Diagnostics" to 'Off' and proceed over to the final step "Review and Create" and click on create after you see that the validation succeeds.

Note: Do copy chef server ip for future use.

Similarly, create the second Instance

Steps to Launch Worksation : 

Repeat the steps-1 to 5 from "Create Chef server".

Note: Do copy workstation server ip for future use.
