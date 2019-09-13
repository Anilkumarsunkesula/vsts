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

## Login to Jenkins UI

1. Login to the jenkins UI using the below details.

* jenkins url: {{jenkins url}}
* jenkins username: {{jenkins username}}
* jenkins password: {{jenkins password}}

### Declarative Pipeline with Classic UI

steps to create sample pipeline in classic UI

1. Click **New Item** in the top left corner on the dashboard. 

![new_item](/Intermediate/img/new_item.png?token=AJU3VUWRXBECK5O6APPDX6246UFXA)  

2. Enter the name of your project in the **Enter an item name** field, and select **Pipeline** project , and click **OK** button .

e.g: pipeline_project_1

![pipeline_name](/Intermediate/img/entername.png?token=AJU3VUXI5YTZ4TFNFMFDCXC43ZNA6)

3. Next Enter the **description** if you want.

4. Go to pipeline section, **Definition** field indicates Pipeline script option.

![definition](/Intermediate/img/definition.png?token=AJU3VUX6XPHGPUF5XEA66DK43ZNKW)

5. write your pipeline code into script area.

6. In this lab we are going to explain declarative pipeline. select **pipeline script** in **definition** field.

- For example:-

copy and paste the following declarative pipeline example into script area.

``` groovy
pipeline {
	agent any
		stages {
			stage('stage1') {
				steps {
					sh '''echo stage1 steps'''
				}
			}
			stage('stage2') {
				steps {
					sh '''echo stage2 steps'''
				}
			}
			stage('stage3') {
				steps {
					sh '''echo stage3 steps'''
				}
			}	
		}
	}

```
![script_area](/Intermediate/img/pipeline_script.png?token=AJU3VUUR3ECCZLQV3ND5MW243ZNMY)

7. Finally click on **Apply** and **Save**. it will redirect to pipeline view page.

8. Click **Build Now** button to execute your pipeline.

![build_now](/Intermediate/img/build_now.png?token=AJU3VUQNQQYXJX5CYWJIQOK43ZNPW)

9. After pipeline execution is completed the pipeline view will be **below** screenshot.

![pipeline_view](/Intermediate/img/pipeline_view.png?token=AJU3VUWSEHRP2M4FBCJHDFC43ZNSM)

10. We can verify the history of executed build by clicking the build number e.g: **#1**

11. Click on build number and select **console output**

![console_output](/Intermediate/img/console_output.png?token=AJU3VUSW4OQVG7TAGE5XCQC43ZNUM)

### Scripted Pipeline with SCM

- Steps to create scripted pipeline with SCM

1. Click **New Item** in the top left corner on the dashboard.  

![new_item](/Intermediate/img/new_item.png?token=AJU3VUWRXBECK5O6APPDX6246UFXA)  

2. Enter the name of your project in the **Enter an item name** field, and select **Pipeline** project , and click **OK** button.

e.g: Jenkinsfile_pipeline

![pipeline_name](/Intermediate/img/jenkinsfile_name.png?token=AJU3VUQSPSKONFWZ7UR5YMK43ZROU)

3. Next Enter the **description** if you want.

4. Go to pipeline section, in **Definition** field choose **Pipeline script from SCM**.

![definition](/Intermediate/img/choose_selectscm.png?token=AJU3VUVKETO5CO47MMR5PYS43ZRZI)

5. select **SCM** either git or subversion. in this lab we choose **git**.

![scm](/Intermediate/img/choose_git.png?token=AJU3VUVC4F2GGDKPBQWLSN243ZSKC)

6. For this lab we already created [scripted Pipeline jenkinsfile](https://raw.githubusercontent.com/sysgain/qloudable_Jenkinsfile/master/Jenkinsfile)

7. Next enter github Jenkinsfile repository URL. `https://github.com/sysgain/qloudable_Jenkinsfile.git`

8. The script path is the name of the Jenkinsfile that is going to be accessed from your SCM to run.

9. Finally click on **Apply** and **Save**. it will redirect to pipeline view page.

10. Click **Build Now** button to execute your pipeline.

![jenkinsfile_pipeline](/Intermediate/img/build_now_jenkinsfile.png?token=AJU3VUSMQYQRGQ4QLHLVXBK43ZURI)

11. After pipeline execution is completed the pipeline view will be **below** screenshot

![buildview](/Intermediate/img/pipeline_view_jenkinsfile.png?token=AJU3VUWO3WOMURQKFLOAVKC43ZUV6)

12. We can verify the history of executed build by clicking the build number e.g: **#1**

13. Click on the build number and select **console output**

![console_output_jenkinsfile](/Intermediate/img/console_output_jenkinsfile.png?token=AJU3VURTH72EGRROJCUCPZS43ZU5E)
 
### Deletion of Pipeline 

- Steps to delete a pipeline

1. select the pipeline you want to delete. it will redirect to pipeline view page.

![select_pipeline](/Intermediate/img/select_pipeline_delete.png?token=AJU3VUVZXQYPRUQ5YVJ5TMS432GEG)

2. Click **Delete Pipeline** on left corner.

![deletepipeline](/Intermediate/img/delete_pipeline.png?token=AJU3VUTBJ2F42RMYOVJD3B2432GGG)

3. It will open pop-up window click **OK**

![popup_delete](/Intermediate/img/pop-up_delete.png?token=AJU3VUTJT5TNI4WXRUQRVNK432GJW)

4. It will redirect to jenkins dashboard.

![last_dashboard](/Intermediate/img/last_dashboard.png?token=AJU3VUU3I3D4WWSJABPC3UC432GMK)

## Pipeline with git hub project

- Steps to create pipeline with git hub project

1.  Click  **New Item**  in the top left corner on the dashboard. 

![new_item](/Intermediate/img/new_item.png?token=AJU3VUWRXBECK5O6APPDX6246UFXA)  

2.  Enter the name of your project in the  **Enter an item name**  field, and select  **Pipeline**  project , and click  **OK**  button.

e.g: pipeline_git_project

![enter-name](/Intermediate/img/p-gh-enter-name.png?token=AJU3VUQD3R3MZYDGEL3YYN246UF4E)

3.  Next Enter the  **description**  if you want.

4.  Scroll down to pipeline section,  **Definition**  field.

5.  In this lab we used already created git hub repository URL ```https://github.com/sysgain/qloudable_Jenkinsfile.git```

6. Write your pipeline code into script area.

copy and paste the following pipeline script into script area.

``` groovy
node('master'){
	stage('git_clone') {
	git (url: 'https://github.com/sysgain/qloudable_Jenkinsfile.git', branch: 'master')
	sh "git status"
	}
	stage('list_of_files') {
		sh "ls -ltr"
	}
	stage('list_of_branches') {
	sh "git branch"
	}
}
```
 -  git_clone stage : Clone the repository into your local. 

 - list_of_files stage : List the files and folders in that repository.

 - list_of_branches stage : List of branches given repository. 

![script-area](/Intermediate/img/p-gh-scriptarea.png?token=AJU3VUS6V7OJRBULNH4222S46UJLK)

7. Finally click on  **Apply**  and  **Save**. it will redirect to pipeline view page. 

8. Click  **Build Now**  button to execute your pipeline.  

9. After pipeline execution is completed the pipeline view will be **below** screenshot  

![pipeline-view](/Intermediate/img/p-gh-pipeline-view.png?token=AJU3VUVWNJAWOXXFHWZ3E7K46UGEA) 

10. We can verify the history of executed build by clicking the build number e.g:  **#1** 

11. Click on build number and select  **console output**  

![console-output](/Intermediate/img/p-gh-console-output.png?token=AJU3VURHFBO5FT2HFS6WC6246UGGY) 

## Conclusion

Congratulations! You have successfully completed the jenkins pipeline lab. In this lab, you created Declarative Pipeline and Scripted Pipeline and create pipeline with git hub project. Feel free to continue exploring or start a new lab.Thank you for taking this training lab!
