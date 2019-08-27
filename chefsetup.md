# CHEF-SERVER SETUP

## Table of Contents

[Overview](#overview)

[Pre-Requisites](#pre-requisites)

[Login to OCI Console and create VCN](#login-to-oci-console-and-create-vcn)

[Create Public and Private SSH keypair to login into the VM](#create-public-and-private-ssh-keypair-to-login-into-the-vm)

[Content Create compute instances](#content-create-compute-instances)

[login to the instance Chef server](#login-to-the-instance-chef-server)

## Overview

Before you begin, review the basic concepts of Chef.

The following diagram depicts the high-level Chef architecture

_images/start_chef.svg

Chef has three main architectural components: Chef Server, Chef Client (node), and Chef Workstation (Chef DK).

The Chef Server is the management point and there are two options for the Chef Server: a hosted solution or an on-premises solution. We will be using a hosted solution.

The Chef Client (node) is the agent that sits on the servers you are managing.

The Chef Workstation is the admin workstation where we create policies and execute management commands. We run the **knife** command from the Chef Workstation to manage the infrastructure.

There is also the concept of “Cookbooks” and “Recipes”. These are effectively the policies we define and apply to the servers.

## Pre-Requisites
- Linux basics

## Login to OCI Console and create VCN

### Creating VCN:

In this section, we will log in to the OCI console and adjust your screen size (if needed).

Step 1. Get OCI Sign detailes from left to of content space as shown below.
 

Step 2. Reduce the browser display size  as needed (Below example is for Chrome). 



Step 3. From OCI Services menu, click "Virtual Cloud Network", under "Networking".



Step 4. Ensure the correct compartment is selected (Bottom Left of OCI console). 

Choose Compartment as porvided in acceess info.

**Note:** Keep the dynamically generated compartment ID, for use through out the lab and make sure you have selected the same in this step. 

Step 5. From OCI menu (click Left top corner) select Virtual Cloud Networks and then click "Create Virtual Cloud Network"

 

Step 6. Fill out the dialog box

6.1 Create in Compartment: Has the correct compartment selected.<br>
6.2 Name: Enter easy to remember name (e.g. "my_vcn").<br>
6.3 Select radio button Create Virtual Cloud Network Plus Related Resources<br>
6.4 Click Create Virtual Cloud Network.<br>
6.5 Click Close.

 

Step 7. Navigate to created virtual cloud network

 

 

Step 8. Select "security lists" on the navigation panel and click on "default security list".  



Step 9. Click "Edit All Rules".

 

Step 10. Click on "Ingress Rules" then click "+Another Ingress rule" and enter source cidr as 0.0.0.0/0 and Destination port range as 443 then click save changes.

 
## Create Public and Private SSH keypair to login into the VM

 In this section, we will create a public/private SSH key pair. 

These keys will be used to launch a Compute instance and connect to it.

Step 1. In the OCI Console Window, select the "Apps icon" and open "Git-Bash". A Git-Bash terminal will appear.

Step 2. Enter the command "ssh-keygen" in the git-bash window.

HINT: You can swap between the OCI window and any other application (git-bash etc.) by clicking the "Switch Window"  icon.

Step 3. Skip entering any values in next steps by hitting on "Enter" Key.

**NOTE:** No Passphrase is needed.       

 
 
Step 4. You should now have the Public and Private keys:

   **~/.ssh/id_rsa (Private Key)**<br>
   **~/.ssh/id_rsa.pub (Public Key)**

**NOTE:** "id_rsa.pub" will be used to create the Compute instance and "id_rsa" to connect via SSH into the Compute instance.
 
HINT: Run 'cd ~/.ssh' and then 'ls' to verify the two files exist.

Step 5. In git-bash Enter ‘cat ~/.ssh/id_rsa.pub’, highlight the key and copy.
 

 
Step 6. In the OCI Console Window, click the "Apps" icon  and click "Notepad". 
 
HINT: You can swap between the OCI window and any other application (Notepad etc.) by clicking the Switch Window  icon.
 

 
Step 7. Paste the public key in Notepad.
 

  
Step 8. Minimize Notepad and git-bash (if open) windows.

We now have a Public/Private SSH key pair. Next, we will create a compute instance using the public key we just saved
 

## Content Create compute instances

In this section, we will create Two Compute instances (Chef server and chef workstation VMs)with a Public 
IP address using the public SSH key generated in the previous section.

Creating Chef server compute Instance:

Step 1. Switch to OCI console. (if not already)

Step 2. From the OCI service menu, Click "Instances" under "Compute". 

Step 3. Click on "Create Instance". Fill out the dialog box:

3.1 Name: Enter a name (e.g. "chef-server").<br>
3.2 Availability Domain: Select the first available domain. (Ad1)<br>
3.3 Image Operating System: For the image, Ubuntu 16.04 latest image available.<br>
3.4 Shape: Select VM.Standard2.1. select another shape if instance creation fails. <br>
3.5 SSH Keys: Choose ‘Paste SSH Keys’ and paste the Public Key saved earlier.<br>
3.6 Virtual Cloud Network: Select the VCN you created in the previous section. <br>
3.7 Subnet: Select the first available subnet. <br>
3.8 Click on "Create Instance".



Similarly, create Chef automate and Workstation Instances.<br>

Note: If you come across any limitation error, select another shape for the VM.

Step 4. Once Instances are in ‘Running’ state, note down the public IP addresses.
 
Step 5. You can also see the Fault Domain of the Virtual Machine



We now have two Compute instances with  Public IP addresses.

Next, we will SSH to the compute instance.

## login to the instance Chef server

Step 1. Bring up "git-bash" terminal.

HINT: If the terminal was closed simply launch a new one using the "Apps" icon .

Step 2. SSH into the compute instance using the command,

**$ ssh ubuntu@<PUBLIC_IP_OF_COMPUTE_INSTANCE>**

**NOTE:** User name is ‘ubuntu’. <PUBLIC_IP_OF_COMPUTE_INSTANCE> should be the actual IP address e.g 129.0.1.10 

**NOTE:** Enter ‘Yes’ when prompted for security message. 



Step 3. Verify the prompt shows 

**ubuntu@<YOUR_VM_NAME> (below example show Compute instance called ‘mean-vm’)**

