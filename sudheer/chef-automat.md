# CHEF-AUTOMATE

# Table of Contents

[Overview](#overview)

[Pre-Requisites](#pre-requisites)

[Login to OCI Console and create VCN](#login-to-oci-console-and-create-vcn)

[Create Public and Private SSH keypair to login into the VM](#create-public-and-private-ssh-keypair-to-login-into-the-vm)

[Create compute instances for chef server, chef automate and chef workstation](#create-compute-instances-for-chef-server-chef-automate-and-chef-workstation)

[login to the instance Chef server](#login-to-the-instance-chef-server)

[Installing and configuring chef server](#installing-and-configuring-chef-server)

[Install and cofigure Chef Automate](#install-and-cofigure-chef-automate)
## Overview

### Chef Automate
Chef Automate provides a full suite of enterprise capabilities for workflow, node visibility and compliance. Chef Automate integrates with the open-source products Chef, InSpec and Habitat. Chef Automate comes with comprehensive 24×7 support services for the entire platform, including open source components.



### Compliance:
Chef Automate 1.5.46 or later provides an easy way to view how successful the nodes in your infrastructure are at meeting the compliance requirements specified by your organization. Several built-in profiles are included in Chef Automate to scan for security risks, outdated software, and more. These profiles cover a variety of security frameworks, such as Center for Internet Security (CIS) benchmarks. If you have additional compliance requirements, you can also write your own compliance profiles in InSpec and upload them to Chef Automate. For more information how to view the compliance status across your cluster, see Compliance Overview.

If you are using an older version of Chef Automate, or your workflow requires you to use our standalone Chef Compliance server, you can find general information on Chef Compliance here

In this training lab, you'll learn how to configure Chef server, Chef automate server and workstation on ubuntu 16.04 and finding, fixing the compliances in ubuntu.

## Pre-Requisites
- Linux basics

## Login to OCI Console and create VCN

### Creating VCN:

In this section, we will log in to the OCI console and adjust your screen size (if needed).

**Step 1.** Get OCI Sign detailes from left top of content window as shown below.<br>
     **NOTE:** To copy the access details click on requred value and past it in you work space window.

![](https://github.com/sudheermareddy/vsts/raw/master/sudheer/chef-imgs/30.PNG)
 
![](https://github.com/sudheermareddy/vsts/raw/master/sudheer/chef-imgs/2.png)

**Step 2.** Reduce the browser display size  as needed (Below example is for Chrome). 

![](https://github.com/sudheermareddy/vsts/raw/master/sudheer/chef-imgs/3.png)

**Step 3.** From OCI Services menu, click "Virtual Cloud Network", under "Networking".

![](https://github.com/sudheermareddy/vsts/raw/master/sudheer/chef-imgs/4.png)

**Step 4.** Ensure the correct compartment is selected (Bottom Left of OCI console). 

Choose Compartment as porvided in acceess info.

**Note:** Keep the dynamically generated compartment ID, for use through out the lab and make sure you have selected the same in this step. 

**Step 5.** From OCI menu (click Left top corner) select **Virtual Cloud Networks** and then click "Create Virtual Cloud Network"

![](https://github.com/sudheermareddy/vsts/raw/master/sudheer/chef-imgs/5.png)

**Step 6.** Fill out the dialog box

**6.1** Create in Compartment: Has the correct compartment selected.<br>
**6.2** Name: Enter easy to remember name (e.g. "my_vcn").<br>
**6.3** Select radio button Create Virtual Cloud Network Plus Related Resources<br>
**6.4** Click Create Virtual Cloud Network.<br>
**6.5** Click Close.

![](https://github.com/sudheermareddy/vsts/raw/master/sudheer/chef-imgs/7.png)

**Step 7.** Navigate to created virtual cloud network

![](https://github.com/sudheermareddy/vsts/raw/master/sudheer/chef-imgs/8.png)

**Step 8.** Select **"security lists"** on the navigation panel and click on "default security list".  

![](https://github.com/sudheermareddy/vsts/raw/master/sudheer/chef-imgs/9.png)

**Step 9.** Click "Edit All Rules".

 ![](https://github.com/sudheermareddy/vsts/raw/master/sudheer/chef-imgs/10.png)

**Step 10.** Click on "Ingress Rules" then click **"+Another Ingress rule"** and enter source cidr as 0.0.0.0/0 and Destination port range as 443 then click save changes.

![](https://github.com/sudheermareddy/vsts/raw/master/sudheer/chef-imgs/11.png)

## Create Public and Private SSH keypair to login into the VM

 In this section, we will create a public/private SSH key pair. 

These keys will be used to launch a Compute instance and connect to it.

**Step 1.** In the OCI Console Window, select the "Apps icon" and open "Git-Bash". A Git-Bash terminal will appear.

**Step 2.** Enter the command **```ssh-keygen ```** in the git-bash window.

**HINT:** You can swap between the OCI window and any other application (git-bash etc.) by clicking the "Switch Window"  icon.

**Step 3.** Skip entering any values in next steps by hitting on "Enter" Key.

**NOTE:** No Passphrase is needed.       

![](https://github.com/sudheermareddy/vsts/raw/master/sudheer/chef-imgs/12.png)
 
**Step 4.** You should now have the Public and Private keys:

   **```~/.ssh/id_rsa``` (Private Key)**<br>
   **```~/.ssh/id_rsa.pub``` (Public Key)**

**NOTE:** "id_rsa.pub" will be used to create the Compute instance and "id_rsa" to connect via SSH into the Compute instance.
 
**HINT:** Run **```cd ~/.ssh```** and then **```ls```** to verify the two files exist.

**Step 5.** In git-bash Enter **```cat ~/.ssh/id_rsa.pub```**, highlight the key and copy.
 
![](https://github.com/sudheermareddy/vsts/raw/master/sudheer/chef-imgs/13.png)
 
**Step 6.** In the OCI Console Window, click the "Apps" icon  and click "Notepad". 
 
**HINT:** You can swap between the OCI window and any other application (Notepad etc.) by clicking the Switch Window  icon.
 
![](https://github.com/sudheermareddy/vsts/raw/master/sudheer/chef-imgs/14.png)
 
**Step 7.** Paste the public key in Notepad.
 
![](https://github.com/sudheermareddy/vsts/raw/master/sudheer/chef-imgs/15.png)
  
**Step 8.** Minimize Notepad and git-bash (if open) windows.

We now have a Public/Private SSH key pair. Next, we will create a compute instance using the public key we just saved
 

## Create compute instances for chef server, chef automate and chef workstation

In this section, you'll be creating three Compute instances (Chef server, chef automate and chef workstation VMs)with a Public 
IP address, using the public SSH key generated in the previous section.

Creating Chef server compute Instance:

Step 1. Switch to OCI console. (if not already)

Step 2. From OCI services menu, Click Instances under Compute 

Step 3. Click Create Instance. Fill out the dialog box:<br>

3.1 Name: Enter a name (e.g. "chef-server").<br>
3.2 Availability Domain: Select the first available domain. (Ad1)<br>
3.3 Image Operating System: For the image, Ubuntu 16.04 latest image available.<br>
3.4 Shape: Select VM.Standard2.1. select another shape if instance creation fails. <br>
3.5 SSH Keys: Choose ‘Paste SSH Keys’ and paste the Public Key saved earlier.<br>
3.6 Virtual Cloud Network: Select the VCN you created in the previous section. <br>
3.7 Subnet: Select the first available subnet. <br>
3.8 Click on "Create Instance".


 
Similarly, create Chef automate and Workstation Instances.

Note: If you come across any limitation error, select another shape for the VM.

Step 4. Once Instances are in ‘Running’ state, note down the public IP addresses.

Step 5. You can also see the Fault Domain of the Virtual Machine.


We now have three Compute instances with  Public IP addresses.

Next, we will SSH to the compute instances.

## login to the instance Chef server

Step 1. Bring up "git-bash" terminal.

HINT: If the terminal was closed simply launch a new one using the "Apps" icon .

Step 2. SSH into the compute instance using the command,

**``` ssh ubuntu@<PUBLIC_IP_OF_COMPUTE_INSTANCE>```**

NOTE: User name is ‘ubuntu’. <PUBLIC_IP_OF_COMPUTE_INSTANCE> should be the actual IP address e.g 129.0.1.10 

NOTE: Enter ‘Yes’ when prompted for security message. 


Step 3. Verify the prompt shows 

**ubuntu@<YOUR_VM_NAME>** (below example show Compute instance called ‘mean-vm’)

## Installing and configuring chef server

In this section, you'll be installing and configuring the Chef server.

Go to git-bash, where you're already logged in to the Chef server. 

Installation Script:

The below script will download and install the chef server and it creates chef user(chefadmin) and organization (orguser). 

In chef-server **Run:**

**``` wget https://raw.githubusercontent.com/sysgain/tl-scripts/master/chef-server.sh```**
 
**``` bash chef-server.sh```**
 
The process would take 10 to 15 minutes. Meanwhile, go to the next section and Install Chef automate.

## Install and cofigure Chef Automate

In this section, we are going to install Chef Automate server and create a user for Chef Automate web console.

1. Copying keys to Chef Automate server:
1.1 Open a new "Git-bash" from the "Apps" icon. 

1.2 To get the key from Chef-server with SCP command, you'll need SSH keys into Automate server. 

1.3 In this lab, we are using the same private and public keys (id_rsa and id_rsa.pub)for all the three servers. Push these keys from git bash to Automate server with scp command.

1.4 Run the below command to copy the "~/.ssh" folder to Chef Automate Home directory.

**``` scp -r ~/.ssh ubuntu@<ChefAutomate_public_IP>:~```**


1.5 Now login to Chef Automate server 

**```ssh ubuntu@<Public_IP>```**



1.6 Check for the copied keys:  ls ~/.ssh

1.7 we will copy the Chef user-key after Chef-server setup script is succeeded.

2. Download and Install Chef Automate:

Download Chef Automate deb package,

**``` sudo wget https://packages.chef.io/files/stable/automate/1.8.38/ubuntu/16.04/automate_1.8.38-1_amd64.deb```**
 
 
 
3. Installing deb package:
 
**``` sudo dpkg -i automate_1.8.38-1_amd64.deb```**
 
 
 
To set up the Chef Automate server we require Chef server user key and Chef Automate license. Run below command to get temporary Automate license.
 
**``` sudo wget https://aztdrepo.blob.core.windows.net/chefautomate-testdrive/automate.license -O /tmp/automate.license```**
 
For now, use the above license.
You can get your own temporary license key from below link:
https://learn.Chef.io/modules/manage-a-node-Chef-Automate/ubuntu/Automate/set-up-your-Chef-server#/
Next, wait until Chef server script succeeded.
 
4. Copying user key from Chef-server:
 
4.1 The SSH keys, which we copied earlier may have excess permissions which may be Vulnerable. Change the permission levels by,
 
**``` sudo chmod 0400 ~/.ssh/id_rsa```**
 
4.2 Run below command it copies the Chef-server user key to /tmp directory. Enter "yes" to continue connecting with Chef server.
 
**``` scp ubuntu@<chef-server IP>:/etc/opscode/chefadmin.pem /tmp ```**
 
5. Chef Automate Setup:
 
Run below command to set up the Automate server, in this command, we are passing the Automate license, Chef-server user key file paths and chef server Private key(take it from OCI instance details page). 
 
**``` sudo automate-ctl setup --license /tmp/automate.license --key /tmp/chefadmin.pem --server-url https://<Chef-server-PrivateIP>/organizations/orguser --fqdn $(hostname) --enterprise default --configure --no-build-node```**
 
 
 
**``` sudo automate-ctl reconfigure```**
 
6. Creating Chef Automate user:
 
$ sudo automate-ctl create-user default chefuser --password Password@1234 --roles "admin"
 
Allow 443 on Firewall:
 
To access the Chef Automate web view from browsers we need to open firewalld https port.
 ```sh
 sudo apt-get update
 sudo apt-get install -y firewalld
 sudo firewall-cmd --zone=public --add-port=443/tcp --permanent
 sudo firewall-cmd --reload
 ```
NOTE: Run below commands on Chef server
 
Go to chef server:
 
**``` sudo chmod 777 /etc/opscode/chef-server.rb```**
 
Pass Chef Automate IP in below command and run it enables the compliance data collection.
 
**``` sudo echo "data_collector['root_url'] = 'https://<Automate public IP>/data-collector/v0/'" >> /etc/opscode/chef-server.rb```**

 **```sudo chef-server-ctl reconfigure```**
 
Browse Chef Automate on your favorite browser 
 
**Username:** chefuser
**Password:** Password@1234
 
