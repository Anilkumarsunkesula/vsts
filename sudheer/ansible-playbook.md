# INTRODUCTION TO ANSIBLE PLAYBOOKS

# Table of Contents

[Overview](#overview)

[Pre-Requisites](#pre-requisites)

[Login to OCI Console](#login-to-oci-console)

[Create a VCN](#create-a-VCN)

[Create Public/Private SSH Keypair to Login to the Compute Instance](#create-publicprivate-ssh-keypair-to-login-to-the-compute-instance)

[Create a Compute Instance](#create-a-compute-instance)

[Login to the Compute Instance and Install Ansible](#login-to-the-compute-instance-and-install-ansible)

[Creating SSH keys](#creating-ssh-keys)
## Overview

Welcome to the Introduction to Ansible Playbooks Learning Lab!

Ansible Playbooks are an organized unit of scripts that is used for server configuration management by the automation tool Ansible. Ansible Playbooks are used to automate the configuration of multiple servers at a time. Playbooks are written in YAML format.

Playbook contains one or more plays/tasks which executes a simple command or a script. Every playbook has an attribute hosts, where servers or group of servers are defined. These plays are executed in sequencial manner on the servers defined in the playbook.



It is possible to run several hundreds of tasks in a single playbook, but it is efficient to reuse a task multiple time in multiple playbooks so tasks or group of tasks can be organized into roles. These roles can be included into a playbook. Directory structure of a sample ansible project is:

provision.yaml<br>
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


## Pre-Requisites

1) Basic knowledge of Linux servers

2) YAML language

3) SSH private/public key knowledge

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

**Step 1.** Sign in to your account using the below credentials 
            (Please type in your credentials):

OCI Login Credentials<br>
Cloud Tenant: {{Tenant Name}}<br>
Username: {{Username}}<br>
Password: {{Password}}


**Note:** Your password should be updated automatically for you, but sometimes  you may be asked to change it after signing in the first time. If prompted, pleaseupdate the password. You can use this one to expedite things: Oracle123!!!! . It will not be saved after this lab expires.

**Step 2.** Reduce the Browser Display Window Size/Resolution to fit your needs(Below example is for Chrome). 

## Create a VCN

In this section, you will create a Virtual Cloud Network (VCN) within the OCI console.

**Step 1.** Click on the OCI Services Menu, Select Networking and choose Virtual Cloud Networking

 

**Step 2.** Please ensure you have the correct Compartment Selected. (Bottom Left of OCI console). 

Choose Compartment: {{comparment-name}}



**Step 3.** Click Create Virtual Cloud Network. 

**Step 4.** Fill out the details for Dialog Box that appears with the following information.<br>
     4.1 Ensure Create in Compartment is set to the right compartment.<br>
     4.2 For the NAME, enter an easy to remember name, like for example, "my_vcn"<br>
     4.3 Check the radio button Virtual Cloud Network Plus Related Resources option to ensure we create a VCN that can accommodate other OCI resources.
     <br>
     4.4 Leave the remainder of the fields in the Dialog Box as is.<br>
     4.5 Click Create Virtual Cloud Network to create the VCN<br>
     4.6 Click Close to close VCN Dialog Box.

**Step 5.** A Virtual Cloud Network will be created and the name that was given will appear as the name of the VCN on the OCI Console.

## Create Public/Private SSH Keypair to Login to the Compute Instance

In this section we will create a public/private SSH key pair. These keys will be used to launch a Compute instance and connect to it.

**Step 1.** In the OCI Console Window, select the Apps icon and open git-Bash. A Git-Bash terminal will appear.


**Step 2.** Enter the command ssh-keygen in git-bash window.

**TIP:**
You can swap between the OCI window and any other application (git-bash etc.) by clicking the Switch Window icon beside apps icon. 

 
**Step 3.** Press "Enter", when asked for the following:

 a) Enter file in which to save the key 

 b) Enter passphrase

 c) Enter passphrase again


**Step 4.** You should now have the Public and Private keys generated.They can be found in<br> 
             /C/Users/PhotonUser/.ssh/id_rsa (Private Key)<br>
             /C/Users/PhotonUser/.ssh/id_rsa.pub (Public Key)

**Note:**<br>
       id_rsa.pub will be used to create the Compute instance and id_rsa to connect via SSH into the Compute instance.<br>
       Run 'cd /C/Users/PhotonUser/.ssh' (No Spaces in directory path) and then 'ls' to verify the two files exist.


**Step 5.** In the git-bash terminal window, type ‘cat /C/Users/PhotonUser/.ssh/id_rsa.pub’, Highlight the SSH key and copy (using the mouse or the keyboard (ctrl-c)



**Step 6.** In the OCI Console Window, click the Apps icon  and click Notepad. 

**TIP:**
You can swap between the OCI window and any other application (Notepad etc.) by clicking the Switch Window  icon.


**Step 7.** Paste the public key in Notepad (using your mouse/touch pad or Ctrl v).


**Step 8.** Minimize Notepad and git-bash (if open) windows.

We now have a Public/Private SSH key pair. Next we will
create a compute instance using the public key we just saved.

## Create a Compute Instance

In this section we will create a Compute instance with a Public IP address using the public SSH key generated in the previous section.


**Step 1.** Switch to OCI console (if not already).

**TIP:** You can swap between the OCI window and any other application (git-bash etc.) by clicking the Switch Window icon beside apps icon. 

**Step 2.** Click on the OCI Services Menu, Select Compute and choose Instances

**Step 3.** Click Create Instance. Fill out the dialog box:

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

Step 4. Follow the step 2 and 3 again to create another instance.

Step 5. Once both the Instances are in ‘Running’ state, note down the public IP addresses.

Step 6. You can also see that instances has now been provisioned and are in Running state.

We now have two Compute instances with a Public IP addresses running in OCI.
Next we will SSH to the compute instance from the internet.

## Login to the Compute Instance and Install Ansible

In this section we will SSH into one of the Compute instances using its Public IP address and private SSH key to Install and Configure Ansible. This instance acts as a Ansible Control Machine and the other as a node.

**Note:** One server can randomly be selected to be Ansible Control Machine.

Step 1. Bring up a new git terminal or switch to the existing one (if you still have it open).

**Tip:** If the terminal was closed simply launch a new one using the Apps icon .

Step 2. In the git-bash Terminal Window Type the command:

```cd /C/Users/PhotonUser/.ssh/  ```

Type ls and verify the id_rsa file exists.

**Tip:** No Space in directory path (/C/Users/PhotonUser/.ssh).



Step 3. To login to the running instance, we will SSH into it. Type the command:

```ssh –i id_rsa opc@<PUBLIC_IP_OF_COMPUTE_INSTANCE_1>```

**Note:** User name is ‘opc’. <PUBLIC_IP_OF_COMPUTE_INSTANCE_1> should be the actual IP address which was noted in previous section for example:  129.0.1.10 



Step 4. Enter ‘yes’ when prompted for security message. 

Step 5. Verify the prompt shows 
              ```opc@<YOUR_VM_NAME>``` (below example shows the command prompt for Compute instance)



Step 6.  We now have a Compute instance in OCI with a Public IP  address which is accessible over the internet.

Step 7. The "sudo" command allows user to run programs with elevated privileges and "su" command allows you to become another user. Running the following command will default to root account (system administrator account) which allows installing and configuring ansible using yum package manager.

```sudo su -```

```yum install -y ansible```
**Note:** Along with Anisble package, multiple pre-requisite packages are being installed which takes a couple of minutes.

Step 8. Bring up a new git-bash terminal using the Apps icon.

Step 9. To login to the Second running instance, we will SSH into it. Type the command

```ssh –i id_rsa opc@<PUBLIC_IP_OF_COMPUTE_INSTANCE_2>```

            Enter ‘yes’ when prompted for security message. 

Step 10. Ansible has a default inventory file created which is located at "/etc/ansible/hosts". Inventory file contains a list of nodes which are managed/configured by ansible.

It is always a good practice to back up the default inventory file to reference it in future if required.

Run the following commands to move and create a new inventory file

```sh
sudo mv /etc/ansible/hosts /etc/ansible/hosts.orig
sudo touch /etc/ansible/hosts
vi /etc/ansible/hosts
```
In this tutorial by default "vi" text editor is used to update files.

To learn vi text editor "https://ryanstutorials.net/linuxtutorial/vi.php"

Any other user preferred text editor can be used to update files.

Step 11. Update the created hosts file in the step 8 with the following data:
```sh
[local]
127.0.0.1
[webserver]
<<ipaddress of second server>>
 ```

Step 12. In the Step 11, we have added local server's ip address (127.0.0.1) and the second server (public IP address) to the hosts inventory file, Ansible uses the host file to SSH into the servers and run the requiredAansible jobs.

Step 13. To validate Ansible is installed and configured correctly, run the following command:

               ```ansible --version```

**Note:** It is ok, if the above command returns different version of ansible. 

## Creating SSH keys

In this section, we will create a public and private SSH key pairs for ansible control machine to SSH into the nodes defined in inventory file.

Ansible control machine is a server on which Ansible is installed and executes Ansible tasks on the managed nodes.

An inventory file is a list of managed nodes which are also called "hosts". Ansible is not installed on managed nodes.

Step 1. In the terminal of Ansible Control Machine (where ansible is installed), enter the command "ssh-keygen".

Press "Enter", when asked for the following:

    a) Enter file in which to save the key 

    b) Enter passphrase

    c) Enter passphrase again

**Tip:** No Passphrase is required.



Step 2. Public and Private keys should have been generated and are stored in the directory /root/.ssh/. Public key need to be copied to authorized keys file, which gives Ansible access to login into the managed node.

**Note:** In this example Ansible control machine and the managed node is the same server. If authorized_keys file is already available, overwrite it with the public key or a new file is generated.


Execute the following commands to copy the public key:

```cd /root/.ssh```

```cp id_rsa.pub authorized_keys```

Enter "yes" when promted to overwrite authorized_keys file.



Step 3. Open authorized_keys and copy the data using the following command:

``` cat /root/.ssh/authorized_keys```
            
            Highlight the SSH key and copy (using the mouse)



Step 4. Open the terminal of the second server. We need to paste the copied public key to the authorized keys file in the second server. Follow the steps to copy the public key:

**Tip:** You can swap between the OCI window and any other application (Notepad etc.) by clicking the Switch Window icon.

```sh
sudo su -
cd /root/.ssh/
vi authorized_keys​
```
Copy the key into authorized_keys file 
 

**Note:** The public key needs to be copied into authorized_keys file in all servers(nodes) so that ansible control machine can SSH into the machines.

Step 5. In the Ansible Control Machine, Check to see if Ansible is able to connect to the servers, defined in the inventory file that was created in the previous section. Execute the following command which pings the servers in the inventory file.

              ```ansible all -m ping```

Enter "yes" when prompted to add server ip to the known_hosts file. You might need to type twice as 2 hosts are added to the known_hosts file.



Above command pings the servers defined in the inventory file that is created in the previous steps. Since only local machine is added in the inventory file ansible does a ping on the local machine using the SSH key created. 

 