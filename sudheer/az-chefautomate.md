
# CHEF AUTOMATE

# Table of Contents

[Overview](#overview)

[Pre-Requisites](#pre-requisites)

[Login to the Azure portal](#login-to-the-azure-portal)

[Creating Chef Automate from Azure portal](#creating-chef-automate-from-azure-portal)

## Overview

Chef Automate
Chef Automate provides a full suite of enterprise capabilities for workflow, node visibility and compliance. Chef Automate integrates with the open-source products Chef, InSpec and Habitat. Chef Automate comes with comprehensive 24×7 support services for the entire platform, including open source components.



Compliance:
Chef Automate 1.5.46 or later provides an easy way to view how successful the nodes in your infrastructure are at meeting the compliance requirements specified by your organization. Several built-in profiles are included in Chef Automate to scan for security risks, outdated software, and more. These profiles cover a variety of security frameworks, such as Center for Internet Security (CIS) benchmarks. If you have additional compliance requirements, you can also write your own compliance profiles in InSpec and upload them to Chef Automate. For more information how to view the compliance status across your cluster, see Compliance Overview.

If you are using an older version of Chef Automate, or your workflow requires you to use our standalone Chef Compliance server, you can find general information on Chef Compliance here

Nodes:
Chef Automate gives you a data warehouse that accepts input from Chef, Habitat, and Chef Automate workflow and compliance. It provides views into operational, compliance, and workflow events. There is a query language available through the UI and customizable dashboards. For more information, see Nodes Overview

Workflow:
Chef Automate includes a pipeline for continuous delivery of infrastructure and applications. This full-stack approach, where infrastructure changes are delivered in tandem with any application changes, allows for safe deployment at high velocity. For information Chef Automate safely moves changes move through a gated pipeline, see Workflow Overview.

## Pre-Requisites

Linux basics

## Login to the Azure portal

In the lab console window, use the web browser and go to https://portal.azure.com

For login credentials click on access info left top of context window. Click on required value To copy to clip board and past it on worksapace window.

Enter the username provided in the lab credentials.



Enter the password Provided in the lab credentials.



The dashboard of the Azure portal will Appear after a successful login.

## Creating Chef Automate from Azure portal

In this section, we will be deploying "Chef automate server" from Azure marketplace.

Steps to deploy :

Step 1: On Azure portal (https://portal.azure.com), click on "Create a resource" from the navigation pane.



Step 2: Search for "chef automate", select "Chef Automate" from the search dropdown and click on "Create".


Step 3: Leaving the default values untouched, Fill the form as below.
            Resource group: Select the name of RG shared with your login credentials.<br>
            Virtual Machine Name: Give any name <br>
            Authentication type: Password<br>
            Username: chefuser<br>
            Password: Password@1234



Step 4: On the Settings page, in Network select subnet and click OK.



Note : Skip the "Chef Automate Setup" Step and click on "OK".

Step 5: Procced to the validation on the 5th step.



Step 6: Click on "create", once the validation is passed.



Step 7: You can see the list of resources that are deployed by clicking on the "Deployment Successful" Notification.



Chefautomate setup:

Open putty from applications drop-down at top-left corner of the workspace window.



Connect using the IP of "Chef automate VM" and use the credentials you provided while creating the VM.

(chefautomate -Public-ip)


Login as: chefuser 

Password : Password@1234



The deployed server contains both Chef server and Chef Automate servers.

Step 1: Switch to the root user.

""``` sudo -i```**

Step 2: Create users for 'chef automate server web view and 'chef server user'. 

Execute the following command to download a script which creates the users, ORG, and keys

""``` wget https://raw.githubusercontent.com/sysgain/tl-scripts/master/chefautomate.sh```**

Pass the parameters required for the script in an order Chef server's username & Automate server, Chef user first name, last name, E-mail , Password, and Organization name for chef server.

**```` bash chefautomate.sh chefuser chef user test@noreply.com Password@1234 orguser```**



