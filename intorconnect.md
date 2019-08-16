# Interconnect Setup between Oracle Cloud Infrastructure and Microsoft Azure

## Table of Contents

[Overview](#overview)

[Pre-Requisites](#pre-requisites)

[Network Setup in Azure](#network-setup-in-azure)

[Network Setup in OCI](#network-setup-in-OCI)

[Setup Azure ExpressRoute](#setup-azure-expressroute)

[Setup Oracle Cloud Infrastructure FastConnect](#setup-oracle-cloud-infrastructure-fastconnect)

## Overview

This document will walk through the details of setting up this interconnect between Oracle and Azure.
Following is a high level diagram shows am Azure VNet (Virtual Network) that is connected to a Oracle VCN (Virtual Cloud Network). Resources in the VNet use the logical circuit that runs on the cross-cloud connection between Azure and Oracle Cloud Infrastructure to connect with resources in the VCN.

OCI-Azure Interconnect
Lets continue and setup one by one each component to exactly enable such a connection.

Assumptions:
•	Users have access to OCI and Azure Tenancy
•	Have necessary required policies to create resources in OCI and Azure. Can find more details [here](https://docs.cloud.oracle.com/iaas/Content/Network/Concepts/azure.htm?source=post_page---------------------------).

## Pre-Requisites

Microsoft Azure:<br>
 In order to setup this interconnect, there are some pre-requisites that we need to complete for this setup: Azure Virtual Network (VNet) with subnets that can host a test virtual machine, and an Azure virtual network gateway.

Oracle Cloud:<br>
 Similarly on the Oracle Cloud Infrastructure side (OCI), we need to create a virtual cloud network with subnets and attach a dynamic routing gateway.

## Network Setup in Azure

Sign in to the Azure portal.  Please take Azure credentials from workspace access info.

### VNET and Subnet Creation
- On the upper-left side of the screen, select Create a resource > Networking > Virtual network.
- Add in the required details as shown below, leave the rest to default and select Create.

This creates a virtual network (VNet) and a subnet, which are scoped to a single region with in Azure. Resources within the virtual network can communicate outbound with the internet, by default. 
An inbound connection can be achieved by attaching a public IP with the resource. You can also connect virtual network with your on-premises network or other public clouds (Oracle Cloud Infrastructure) by using **Azure ExpressRoute**. This connection is private. Traffic does not go over the internet.

### virtual network gateway Creation

In order to create the interconnect between Azure virtual network and oracle cloud infrastructure virtual cloud network (VCN), we must create a virtual network gateway first. A virtual network gateway serves two purposes: exchange IP routes between the networks and route network traffic.

- On the upper-left side of the screen, search for ‘virtual network gateway’ resource and click on Create. It opens up the virtual network gateway options. 
- Add in the details as shown below. Remember to select ‘**ExpressRoute**’ in gateway type.


**Virtual Network Gateway Details**

**Virtual Network and Gateway Network**

**Public IP for Virtual Network Gateway**

It make take up to 45 minutes for creating the virtual network gateway.

In the meantime, lets setup a virtual machine in your virtual network to test the connectivity once the interconnect is successfully setup.

### Virtual Machine Creation

- On the upper-left side of the screen, select Create a resource > Compute > Ubuntu Server. 
- Add in the required details and leave the rest as default.


This completes our pre-requisites for Microsoft Azure.

## Network Setup in OCI

Sign into the OCI console. Please take login credentials from workspace access info

### Virtual cloud network Creation 

- One the top left of the screen, select Menu > Networking > Virtual Cloud Networking > Create a Virtual Cloud Network.
- Add in the required details and Select **Create Virtual Cloud Network plus related resources**. The dialog box expands to list the items that will be created with your cloud network.

**Create Virtual Cloud Network plus related resources**

**Resources to be created**

**Subnets automatically created**

A virtual cloud network is a software defined version of a network, and allows you to create a virtualized datacenter in any oracle cloud infrastructure region. The subnets are scoped within a particular virtual cloud network and can be availability domain specific or regional.

Now that we have created basic virtual cloud network components,

### Dynamic routing gateway (DRG) Creation

- lets go ahead and create a dynamic routing gateway (DRG). A DRG can be considered as a virtual router that allows private traffic connectivity between your virtual cloud network and the networks outside of your VCN, that can be VCN in another region, a virtual network in another cloud or on-premise network.

- One the top left of the screen, select Menu > Networking > Dynamic Routing Gateway > Create Dynamic Routing Gateway.


**Create Dynamic Routing Gateway**

It takes usually 3/4 minutes to create a DRG. Once the DRG is created, go ahead and attach that DRG with your VCN.


- Once the DRG is attached to VCN, your pre-requisites are completed for Oracle Cloud Infrastructure. 

Before we move ahead, lets create a virtual machine here in OCI VCN as well for testing.

#### Virtual Machine Creation 

One the top left of the screen, select Menu > Compute > Instances > Create Instance. 


Now that the pre-requisites are completed, lets continue with the process of creating the interconnect between Microsoft Azure and Oracle Cloud Infrastructure.

## Setup Azure ExpressRoute

### Create ExpressRoute

- On the upper-left side of the screen, select Create a resource > ExpressRoute and select Create.
- Add in the required details as shown below. Choose Oracle Cloud FastConnect as the provider, and currently my region is EastUS for Azure.


This creates an ExpressRoute circuit, however its not currently provisioned and doesn’t provide any connectivity details. Note down the service key as we will use this afterwards in Oracle Cloud Infrastructure.

## Setup Oracle Cloud Infrastructure FastConnect

### FastConnect creation

- In OCI Console, navigate to the Menu > Networking > FastConnect > Create Connection. 
- Choose the connect through provider and select Microsoft Azure ExpressRoute.

Choose a private virtual circuit creation, provide details of your dynamic routing gateway and add in the service key copied from Azure here.

The connection between Azure VNet and OCI VCN uses BGP dynamic routing. Provide the BGP IP addresses that will be used for the two redundant BGP sessions between Oracle and Azure:
•	A primary pair of BGP addresses
•	A separate, secondary pair of BGP addresses
I have provided here /30 addresses here for the BGP connection. The second and third in each /30 are used as BGP IP address pair. The second address in the block is for the Oracle side of the BGP session and the third address in the block is for the Azure side of the BGP session.
