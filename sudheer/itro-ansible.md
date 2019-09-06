# INTRODUCTION TO ANSIBLE

# Table of Contents

[Overview](#overview)

[Pre-Requisites](#pre-requisites)

[Login to OCI Console](#login-to-oci-console)

[Create a VCN](#create-a-VCN)

[Create Public/Private SSH Keypair to Login to the Compute Instance](#create-publicprivate-ssh-keypair-to-login-to-the-compute-instance)

[Create a Compute Instance](#create-a-compute-instance)

[Login to the Compute Instance & Install Ansible](#login-to-the-compute-instance-&-install-ansible)

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


**Note:**Your password should be updated automatically for you, but sometimes  you may be asked to change it after signing in the first time. If prompted, pleaseupdate the password. You can use this one to expedite things: Oracle123!!!! . It will not be saved after this lab expires.

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

## Create Public/Private SSH Keypair to Login to the Compute Instance

In this section we will create a public/private SSH key pair. These keys will be used to launch a Compute instance and connect to it.

Step 1. In the OCI Console Window, select the Apps icon and open git-Bash. A Git-Bash terminal will appear.


Step 2. Enter the command ssh-keygen in git-bash window.

**TIP:**
You can swap between the OCI window and any other application (git-bash etc.) by clicking the Switch Window icon beside apps icon. 

 
Step 3. Press "Enter", when asked for the following:

 a) Enter file in which to save the key 

 b) Enter passphrase

 c) Enter passphrase again


Step 4. You should now have the Public and Private keys generated.They can be found in<br> 
             /C/Users/PhotonUser/.ssh/id_rsa (Private Key)<br>
             /C/Users/PhotonUser/.ssh/id_rsa.pub (Public Key)

**Note:**<br>
       id_rsa.pub will be used to create the Compute instance and id_rsa to connect via SSH into the Compute instance.<br>
       Run 'cd /C/Users/PhotonUser/.ssh' (No Spaces in directory path) and then 'ls' to verify the two files exist.


Step 5. In the git-bash terminal window, type ‘cat /C/Users/PhotonUser/.ssh/id_rsa.pub’, Highlight the SSH key and copy (using the mouse or the keyboard (ctrl-c)



Step 6. In the OCI Console Window, click the Apps icon  and click Notepad. 

**TIP:**
You can swap between the OCI window and any other application (Notepad etc.) by clicking the Switch Window  icon.


Step 7. Paste the public key in Notepad (using your mouse/touch pad or Ctrl v).


Step 8. Minimize Notepad and git-bash (if open) windows.

We now have a Public/Private SSH key pair. Next we will
create a compute instance using the public key we just saved.

## Create a Compute Instance

In this section we will create a Compute instance with a Public IP address using the public SSH key generated in the previous section.


Step 1. Switch to OCI console (if not already).

**TIP:** You can swap between the OCI window and any other application (git-bash etc.) by clicking the Switch Window icon beside apps icon. 

Step 2. Click on the OCI Services Menu, Select Compute and choose Instances

Step 3. Click Create Instance. Fill out the dialog box:

         3.1 Name: Enter a name (e.g. "Ansible_VM").

         3.2 Availability Domain: Select the first available domain.

         3.3 Image Operating System: For the image, we recommend using the Latest Oracle Linux available.

         3.4 Shape: Select VM.Standard1.1 (1 OCPU, 7GB RAM).

         3.5 SSH Keys: Select the PASTE SSH KEYS radio button and Paste the Public Key you saved in Notepad in the previous section.

You can swap between the OCI window and any other application (notepad etc.) by clicking the Switch Window icon beside apps icon. 
<br>
         3.6 Virtual Cloud Network: Select the VCN you created in the previous section.

         3.7 Subnet: Select the first available subnet.

         3.8 Click Create Instance.

**Note:** Leave other options in the dialog box as is other than the options mentioned above. 


Step 4. Once Instance is in ‘Running’ state, note down the public IP address.
 
**Tip:** We recommend writing down the IP address in a notepad for future use.

 
Step 5. You can also that instance has now been provisioned and is in Running state.


We now have a Compute instance with a Public IP address running in OCI.

Next we will SSH to the compute instance from the internet.

## Login to the Compute Instance & Install Ansible

In this section we will SSH into the Compute instance using its Public IP address and private SSH key to Install and Configure Ansible. 

Step 1. Bring up a new git terminal or switch to the existing one (if you still have it open).

**Tip:** 
If the terminal was closed simply launch a new one using the Apps icon .


 
 Step 2. In the git-bash Terminal Window Type the command

```cd /C/Users/PhotonUser/.ssh/  ```

Type ls and verify the id_rsa file exists.
       

**Tip:** No Space in directory path (/C/Users/PhotonUser/.ssh).



Step 3. To login to the running instance, we will SSH into it. Type the command            

```ssh –i id_rsa opc@<PUBLIC_IP_OF_COMPUTE_INSTANCE>```

**Note:** User name is ‘opc’. <PUBLIC_IP_OF_COMPUTE_INSTANCE> should be the actual IP address which was noted in previous section. (Example: 129.0.1.10)



Step 4. Enter ‘yes’ when prompted for security message. 
Step 5. Verify the prompt shows 

              opc@<YOUR_VM_NAME> (below example shows the command prompt for Compute instance)



Step 6.  We now have a Compute instance in OCI with a Public IP  address which is accessible over the internet. 

Step 7. The "sudo" command allows user to run programs with elevated privileges and "su" command allows you to become another user. Running the following command will default to root account(system administrator account) which allows installing and configuring ansible using yum package manager.

```sudo su -```
```yum install -y ansible```
 
**Note:** Along with Anisble package, multiple pre-requisite packages are being installed which takes a couple of minutes.

Step 8. Ansible has a default inventory file created which is located at "/etc/ansible/hosts". Inventory file contains a list of nodes which are managed/configured by ansible.

It is always a good practice to back up the default inventory file to reference it in future if required.

Run the following commands to move and create a new inventory file

```sudo mv /etc/ansible/hosts /etc/ansible/hosts.orig```
```sudo touch /etc/ansible/hosts```
```vi /etc/ansible/hosts```
 
**Note:** In this tutorial by default "vi" text editor is used to update files.

To learn vi text editor "https://ryanstutorials.net/linuxtutorial/vi.php"

Any other user preferred text editor can be used to update files.

Step 9. Update the created hosts file in the step 8 with the following data
```
[local]
127.0.0.1
```
Step 10. In the Step 9, we have added local server's ip address(127.0.0.1) to the hosts inventory file, ansible uses the host file to SSH into the servers and run the required ansible jobs.

Step 11. To validate Ansible is installed and configured correctly, run the following command

 ansible --version
**Note:** It is ok, if the above command returns different version of ansible. 

 
