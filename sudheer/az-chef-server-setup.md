# CHEF AUTOMATE

# Table of Contents

[Overview](#overview)

[Pre-Requisites](#pre-requisites)

[Login to the Azure portal](#login-to-the-azure-portal)

[Launch VMs for Chef Server and Workstation](#launch-vms-for-chef-server-and-workstation)

[Chef Server Configuration](#chef-server-configuration)

[Workstation Configuration](#workstation-configuration)
## Overview

Chef has three main architectural components: Chef Server, Chef Client (node), and Chef Workstation.

The Chef Server is the management point and there are two options for the Chef Server: a hosted solution or an on-premises solution. We will be using a hosted solution.

The Chef Client (node) is the agent that sits on the servers you are managing.

The Chef Workstation is the admin workstation where we create policies and execute management commands. We run the knife command from the Chef Workstation to manage the infrastructure.

There is also the concept of “Cookbooks” and “Recipes”. These are effectively the policies we define and apply to the servers.

## Pre-Requisites

Linux basics<br>
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

## Chef Server Configuration

**Chef Server Configuration:**

Open putty from applications drop-down at top-left corner of the workspace.

Connect using the IP of "Chef Server VM" and use the credentials you provided when creating the VM.
 
Server setup:
**Login as: chefuser**
**Password: Password@1234**
 
Step 1. Switch to the root user

**``` sudo -i```**
Step 2. Run the below command to download the chef server.

**``` wget https://packages.chef.io/files/stable/chef-server/12.17.5/ubuntu/16.04/chef-server-core_12.17.5-1_amd64.deb```**
  
Step 3. Install the Chef server package, using the name of the package downloaded.

**``` sudo dpkg -i chef-server-core_*.deb```**
  
Step 4. Run the following to start the chef services

**``` sudo chef-server-ctl reconfigure```**

As the Chef server is composed by many different services that work together to create a functioning system, this step may take a few minutes to execute.
  
Step 5. Run the following command to create an administrative user.

**Syntax :** chef-server-ctl user-create USER_NAME FIRST_NAME [MIDDLE_NAME] LAST_NAME EMAIL 'PASSWORD' (options)

**``` sudo chef-server-ctl user-create chefadmin Chef Admin admin@test.com Password@1234 --filename /etc/opscode/chefadmin.pem```**

Note: Remember the user name and password.

An RSA private key is generated automatically. This is the user’s private key and should be saved to a safe location. The --filename option will save the RSA private key to the specified absolute path.
 
Step 6. Run the following command to create an organization:

An RSA private key is generated automatically. This is the chef-validator key and should be saved to a safe location. The --filename option will save the RSA private key to the specified absolute path.

Syntax: chef-server-ctl org-create ORG_NAME "ORG_FULL_NAME" (options)

**``` sudo chef-server-ctl org-create orguser  “chef-orguser, Inc.” --association_user <Chef-username_created aboue command> --filename /etc/opscode/orguser-validator.pem```**
  
Step 7. To enable Chef server web view run below commands.

**``` chef-server-ctl install chef-manage```**
  
**Run:**

**``` sudo chef-manage-ctl reconfigure --accept-license  ```**

It takes 2 to 3 mins

After that chef server configuration is ready

Step 8. You can browse chef-server from chrome with Ip. use Username and passwords as created above.

## Workstation Configuration

The Workstation is where you create cookbooks, recipes, attributes and manage configurations. A workstation can be hosted on any machine, on any flavor of OS but it is recommended that you host it on a remotely accessible machine.

Setting Up a Workstation:

Open putty from applications drop-down at top-left corner of the workspace.
 
Step 1. Connect using the IP of "Workstation Server VM" and use the credentials you provided when creating the VM.
Public ip address : <chef-workstation-IP>
 
Login with workstation credentials
 
Step 2. Run the below command to download the Chef Development Kit.

**``` wget https://packages.chef.io/files/stable/chefdk/2.5.3/ubuntu/16.04/chefdk_2.5.3-1_amd64.deb```**

Step 3. Run the below command to install ChefDK.

**``` sudo dpkg -i chefdk_*.deb```**

Step 4. Run the below command to verify the components of the development kit.

**``` chef verify```**

 
Downloading the Starter kit:

Step 5. Open new tab on chrome browser and enter https://< chef server public ip>

Login: chefadmin
Password: Password@1234
 
Step 6. Click on orguser organization under the Administration tab, then select Starter kit from the navigation panel.
 
Step 7. Click on Download starter kit, Ignore any warnings and click on proceed.
 
Step 8. Open git bash from application dropdown.
  
Step 9. Copy the downloaded starter kit from step 7, to the chef workstation.

**``` scp ~/Downloads/chef-starter.zip workstation_username@Workstation_ip:$HOME```**
 
Switch to the workstation window using   

Step 10. Make sure you have starter kit in home directory.

**``` cd ~```**

Extract the starter kit. 

```sh
$ sudo apt-get install unzip
$ sudo unzip chef-starter.zip
```
The starter kit contains "chef-repo" repository containing .chef, cookbooks and roles sub-directories.

".chef" directory contains configuration file (knife.rb) and chef-server user key.

"Cookbook" directory is the default to store and upload the cookbooks to chef server.

Note: All the knife commands are to be executed from chef-repo directory.

**``` cd ~/chef-repo```**

Initialize the git on chef-repo

**``` sudo git init```**
 
Step 11. Download and check the certs from the Chef Server to the CheckDK host

**``` sudo knife ssl fetch```**

WARNING: Certificates from chef-server will be fetched and placed in your trusted_cert directory (/home/ubuntu/chef-repo/.chef/trusted_certs).
You should verify the authenticity of these certificates after downloading.
 
**``` sudo knife ssl check```**



 
