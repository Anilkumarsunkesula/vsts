# Interconnect Setup between Oracle Cloud Infrastructure and Microsoft Azure

## Table of Contents

[Overview](#overview)

[Pre-Requisites](#pre-requisites)

[Homepage, Security, and Topology](#homepage-security-and-topology)



## Overview

This document will walk through the details of setting up this interconnect between Oracle and Azure.
Following is a high level diagram shows am Azure VNet (Virtual Network) that is connected to a Oracle VCN (Virtual Cloud Network). Resources in the VNet use the logical circuit that runs on the cross-cloud connection between Azure and Oracle Cloud Infrastructure to connect with resources in the VCN.

OCI-Azure Interconnect
Lets continue and setup one by one each component to exactly enable such a connection.

Assumptions:
•	Users have access to OCI and Azure Tenancy
•	Have necessary required policies to create resources in OCI and Azure. Can find more details [here](https://docs.cloud.oracle.com/iaas/Content/Network/Concepts/azure.htm?source=post_page---------------------------).

## Pre-Requisites

Microsoft Azure\:
In order to setup this interconnect, there are some pre-requisites that we need to complete for this setup: Azure Virtual Network (VNet) with subnets that can host a test virtual machine, and an Azure virtual network gateway.

Oracle Cloud\\:
Similarly on the Oracle Cloud Infrastructure side (OCI), we need to create a virtual cloud network with subnets and attach a dynamic routing gateway.

