# CHEF-SERVER SETUP

## Table of Contents

[Overview](#overview)

[Pre-Requisites](#pre-requisites)

[Login to OCI Console and create VCN](#login-to-oci-console-and-create-vcn)

[Create Public and Private SSH keypair to login into the VM](#create-public-and-private-ssh-keypair-to-login-into-the-vm)

[Create a compute instance](#create-a-compute-instance)


## Overview

About Docker CE:
Docker Community Edition (CE) is ideal for developers and small teams looking to get started with Docker and experimenting with container-based apps. Docker CE has three types of update channels, **stable, test, and nightly**

- **Stable** gives you latest releases for general availability.
- **Test** gives pre-releases that are ready for testing before general availability.
- **Nightly** gives you latest builds of work in progress for the next major release.

For more information about Docker CE, see Docker Community Edition.


## Pre-Requisites

- Linxu basics
- Docer basics

## Login to OCI Console and create VCN

In this section we will login to the OCI console and adjust your screen size (if needed).


Step 1. Sign in to your account using the below credentials 

(Please type in your credentials):

Access Details

Tenancy Name: {{tenancy-name}}<br>
OCI login_ID: {{oci-login-id}}<br>
OCI login_Password: {{oci-login-password}}<br>
Compartment Name: {{compartment-name}}

Step 2. Reduce the browser display size  as needed
           (Below example is for Chrome). 



### Create VCN

Step 1. From OCI Services menu, click Virtual Cloud Network
            under Networking



Step 2. Ensure correct compartment is selected (Bottom Left  
           of OCI console). 
Choose Compartment: {{a8404704-d007-c1cb-e353-8f8c007619f1.variable.compartment_name}}



Step 3: Click Create Virtual Cloud Network. 

Step 4. Fill out the dialog box:<br>
         4.1 Create in Compartment: Has the correct compartment selected.<br>
         4.2 Name: Enter easy to remember name (e.g. "my_vcn").<br>
         4.3 select radio button Create Virtual Cloud Network Plus Related Resources<br>
         4.4 Click Create Virtual Cloud Network.<br>
         4.5 Click Close.



navigate  to created virtual cloud networks.


select security lists on left panel and click default security list  


Click Edit All Rules.



To add ingress rouls click Another Ingress Rules button and enter source cidr as 0.0.0.0/0 and Destination port range as 5000 then click save changes.


## Create Public and Private SSH keypair to login into the VM

In this section we will create a public/private SSH key pair. These keys will be used to launch a Compute instance and later on connect to it.

Step 1. In the OCI Console Window, select the Apps icon and open Git-Bash. A Git-Bash terminal will appear.

Step 2. Enter the command ssh-keygen in git-bash window.
             HINT: You can swap between the OCI window and any other application (git-bash etc.) by clicking the Switch Window  icon.

Step 3. Press Enter When asked for ‘Enter File in which  to save the key’, ‘Created Directory', Press Enter  when prompted for ‘Enter passphrase’, and Enter again when prompted for ‘Enter Passphrase again'. **NOTE:** No Pass phrase is needed

 
Step 4. You should now have the Public and Private keys:<br>
             ~/.ssh/id_rsa (Private Key)<br>
             ~/.ssh/id_rsa.pub (Public Key)<br>
           **NOTE:** id_rsa.pub will be used to create the Compute instance and id_rsa to connect via SSH into the Compute instance.<br>
           **HINT:** Run 'cd ~/.ssh' (No Spaces in directory path) and then 'ls' to verify the two files exist.

Step 5. In git-bash Enter ‘cat ~/.ssh/id_rsa.pub’, highlight the key and copy (using your mouse/touch pad or Ctrl c).

Step 6. In the OCI Console Window, click the Apps icon  and click Notepad. <br>
    **HINT:** You can swap between the OCI window and any other application (Notepad etc.) by clicking the Switch Window  icon.

Step 7. Paste the public key in Notepad (using your mouse/touch pad or Ctrl v).

 
Step 8. Minimize Notepad and git-bash (if open) windows.

We now have a Public/Private SSH key pair. Next we will create a compute instance using the public key we just saved
 

## Create a compute instance

In this section we will create a Compute instance with a Public IP address using the public SSH key generated in the previous section.

Step 1. Switch to OCI console.(if not already)

Step 2. From OCI servies menu, Click Instances under Compute 

Step 3. Click Create Instance. Fill out the dialog box:

         3.1 Name: Enter a name (e.g. "docker_VM").

         3.2 Availability Domain: Select the first available domain. 

         3.3 Image Operating System: For the image, select ubuntu 16.04 Latest available 
         
         3.4 Shape, Select **VM.Standard2.1**

         3.5 SSH Keys: Choose ‘Paste SSH Keys’ and paste the Public Key saved earlier.

         3.6 Virtual Cloud Network: Select the VCN you created in the previous section. 

         3.7 Subnet: Select the first available subnet. 

         3.8 Click Create Instance.



Step 4. Once Instance is in ‘Running’ state, note down the public IP address.

Step 5. You can also see the Fault Domain of the Virtual Machine


We now have a Compute instance with a Public IP address. Next we will SSH to the compute instance from the internet.
