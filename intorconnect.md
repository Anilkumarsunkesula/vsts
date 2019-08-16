# Interconnect Setup between Oracle Cloud Infrastructure and Microsoft Azure

## Table of Contents

[Overview](#overview)

[Pre-Requisites](#pre-requisites)

[Network Setup in Azure](#network-setup-in-azure)



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

