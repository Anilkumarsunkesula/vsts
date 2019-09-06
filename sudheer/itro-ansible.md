# INTRODUCTION TO ANSIBLE

# Table of Contents

[Overview](#overview)

[Pre-Requisites](#pre-requisites)

[Login to OCI Console](#login-to-oci-console)

[Create a VCN](#create-a-VCN)

## Overview

## Login to OCI Console

Before you Begin:

1- All screen shots are examples ONLY. Screen shots can be enlarged by Clicking on them

2- Every User MUST keep below credentials handy.
User Name
Password
Compartment Name (Provided Later)
Cloud Tenant Name

3- Do NOT use compartment name and other data from screen shots.Only use  data(including compartment name) provided in the content section of the lab

In this section we will login to the OCI console and adjust your screen size (if needed).

Step 1. Sign in to your account using the below credentials 
            (Please type in your credentials):

OCI Login Credentials<br>
Cloud Tenant: {{Tenant Name}}<br>
Username: {{Username}}<br>
Password: {{Password}}

error_outlineNote
Your password should be updated automatically for you, but sometimes  you may be asked to change it after signing in the first time. If prompted, pleaseupdate the password. You can use this one to expedite things: Oracle123!!!! . It will not be saved after this lab expires.

Step 2. Reduce the Browser Display Window Size/Resolution to fit your needs(Below example is for Chrome). 

## Create a VCN

In this section, you will create a Virtual Cloud Network (VCN) within the OCI console.

Step 1. Click on the OCI Services Menu, Select Networking and choose Virtual Cloud Networking

 

Step 2. Please ensure you have the correct Compartment Selected. (Bottom Left of OCI console). 
Choose Compartment: {{comparment-name}}



Step 3: Click Create Virtual Cloud Network. 

Step 4: Fill out the details for Dialog Box that appears with the following information.<br>
     4.1 Ensure Create in Compartment is set to the right compartment.<br>
     4.2 For the NAME, enter an easy to remember name, like for example, "my_vcn"<br>
     4.3 Check the radio button Virtual Cloud Network Plus Related Resources option to ensure we create a VCN that can accommodate other OCI resources.
     <br>
     4.4 Leave the remainder of the fields in the Dialog Box as is.<br>
     4.5 Click Create Virtual Cloud Network to create the VCN<br>
     4.6 Click Close to close VCN Dialog Box.

Step 5. A Virtual Cloud Network will be created and the name that was given will appear as the name of the VCN on the OCI Console.

wb_sunnyTip
If there are multiple Networks, scroll down to locate the one you just created.
