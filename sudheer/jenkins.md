# Jenkins Pipeline

# Table of contents

[Overview](#overview)

[Pre-Requisites](#pre-requisites)

[Login to AWS console](#login-to-aws-console)

[Basic Jenkins Pipeline](#basic-jenkins-pipeline)

[Pipeline with git hub project](#pipeline-with-git-hub-project)

[conclusion](#conclusion)

## Overview

Jenkins Pipeline is a workflow with group of tasks that brings code from version control system or scripted pipeline into provide the good software to customers or end users in a automated way.

- Pipeline offers a extensible set of tools for modeling simple to complex delivery **pipeline as a code** via *Domain Specific Language* (DSL).

#### what is Jenkinsfile

Jenkins Pipeline is written into text file called **Jenkinsfile**. which you can commit to your project source code repository.

#### Jenkins Pipeline is supported in two types of syntax:

-  [Declarative Pipeline](#what-is-declarative-pipeline)
-  [Scripted Pipeline](#what-is-scripted-pipeline)

### Pipeline Concepts

- The following concepts are fundamental of jenkins pipeline
-  **Pipeline**: A pipeline is a user-defined model of a Continuous Delivery. A Pipeline’s code defines your entire build process, which includes stages for build, test and deliver the application. It is a part of Declarative pipeline.
-  **Node**: A node is a machine on which jenkins runs. node block is mainly used in scripted pipeline.
-  **Stage**: A stage contains a series of tasks performed through entire pipeline, that is, build, test, and deploy processes all come together in a stage. A stage block can visualize your jenkins pipeline status.
-  **Step**: A step is nothing but a single task that executes a specific process at a particular point of time. This block is used in Declarative pipeline.

#### what is Declarative Pipeline

Declarative Pipeline bring a simple and user friendly syntax with some specific statements. without learn groovy. Declarative pipeline should be start with *pipeline* sentence and follow the required sections:
- agent
- stages
- stage
- steps  

sample Declarative Pipeline example:-
``` groovy
pipeline {
	agent any
		stages {
			stage('stage1') {
				steps {
					// stage1 steps
				}
			}
			stage('stage2') {
				steps {
					// stage2 steps
				}
			}
			stage('stage3') {
				steps {
					// stage3 steps
				}
			}
		}
	}
```

#### what is Scripted Pipeline

Scripted Pipeline provides a flexibility and extensibility to jenkins users. it starts with a *node*
sample Scripted Pipeline example:-
``` groovy
node{
     stage('stage1') {
		// stage1 steps
     }
     stage('stage2') {
		// stage2 steps
     }
     stage('stage3') {
	  	// stage3 steps
     }
     
}
```
- Both Declarative and Scripted Pipeline are DSLs to describe a piece of your software delivery pipeline. Scripted Pipeline is written in a limited form of Groovy syntax.
- A Pipeline can be created in two ways:

-  __Classic UI__ you can enter pipeline directly in Jenkins UI.

-  __SCM__ Source Code Management you can write a Jenkinsfile manually and commit into you project source code repository.

## Pre-Requisites
Before using Jenkins Pipeline we need following requirements.
- jenkins 2.x or later version.
- pipeline and github plugin, which is a part of **suggested plugins**

## Login to AWS console

* Before going to explore on the jenkins, go through the jenkins infrastruture that is created for this lab, first you need to authenticate with the AWS console, Navigate to the chrome-browser, sign-in to the Aws management console from the following url.

`https://console.aws.amazon.com`

* Credentials will be provided here, copy these information and paste corresponding values in the AWS Management console.

* Account ID: {{Account ID}}
* user name: {{user name}}
* password: {{password}}
* region: {{region}}

* Mention account-id from the above information, then click on `Next`

<img src="https://qloudableassets.blob.core.windows.net/aks/images%20for%20EKS/VPC-AWS/acc-log-in.png?st=2019-09-09T09%3A36%3A43Z&se=2022-09-10T09%3A36%3A00Z&sp=rl&sv=2018-03-28&sr=b&sig=rkLZ0wwcYQdKbOea5VgPSlzS46FaE8u3plAwptI5nf4%3D" alt="image-alt-text" >

* Mention Username and password from the above information

<img src="https://qloudableassets.blob.core.windows.net/aks/images%20for%20EKS/VPC-AWS/acc-log-in-usrpass.png?st=2019-09-09T10%3A20%3A15Z&se=2022-09-10T10%3A20%3A00Z&sp=rl&sv=2018-03-28&sr=b&sig=KrcF1fH7XzP9H5LPSqrcPgZV3TDNzB6%2FCv6wSxbXN0o%3D" alt="image-alt-text" >

* Once you were provided all those information correctly you will be able to see the AWS-managemnt console dashboard.

<img src="https://qloudableassets.blob.core.windows.net/aks/images%20for%20EKS/VPC-AWS/homepage-aws-console.png?st=2019-09-09T09%3A48%3A34Z&se=2022-09-10T09%3A48%3A00Z&sp=rl&sv=2018-03-28&sr=b&sig=PnSb99bn8RcnrD8mh6w7CkE1oFJscEriBXKpLvKDc4A%3D" alt="image-alt-text" >

* In the navigation bar, on the top-right, change region accordingly to provided in above.

<img src="https://qloudableassets.blob.core.windows.net/aks/images%20for%20EKS/VPC-AWS/region.png?st=2019-09-09T09%3A50%3A51Z&se=2022-09-10T09%3A50%3A00Z&sp=rl&sv=2018-03-28&sr=b&sig=qhSGKx7a%2BhYJxoZoPwe8Vu1ya%2BrzqGDXoTIlV4VHCEM%3D" alt="image-alt-text" >


* To see the jenkins instance that is already provisioned for this lab, Navigate to services and search `EC2` you will get the bunch of services provided by aws.

* click on `running instances`, there you can see the jenkins istance running. And also you can see the jenkins network by navigation to the `VPC` services in the services tab.

## Basic Jenkins Pipeline

test
