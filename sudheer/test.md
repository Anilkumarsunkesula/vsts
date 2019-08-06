# Deploying Oracle Kubernetes Engine.

## Table of Contents

[Welcome to FlexDeploy Training Lab](#welcome-to-flexdeploy-training-lab)

[Pre-Requisites](#pre-requisites)

[Homepage, Security, and Topology](#homepage-security-and-topology)

[Projects and Workflow](#projects-and-workflow)

[Build and Deploy](#build-and-deploy)

[Release and Pipeline](#release-and-pipeline)

[Execute a Snapshot](#execute-a-Snapshot)

[Reports](#reports)

## Welcome to FlexDeploy Training Lab
In this Training Lab, you’ll have access to a pre-configured, running environment of FlexDeploy. Over the course, you’ll be walked through how to move code, configuration, and other changes from build to production using FlexDeploy. You’ll also see how easy it is to configure FlexDeploy to work in your environment. At the end of the lab you will understand: 

1. A day in the life (at an execution level) of a developer, administrator, release manager, etc. 
2. How FlexDeploy will allow you to delivery better quality software faster, and with less cost and risk via streamlined, automated, and repeatable processes and an unparalleled visibility to data. 
3. How easy it is to configure FlexDeploy.
4. Next steps to requesting a POC.
 
## Pre-Requisites
Basic understand about Continues Integration and Delivery

## Homepage, Security, and Topology

go to the URL 
### Registration
   1. **Use the prepopulated username or make one up** 
   2. **Create a password and confirm (NOTE: Remember your name and password so you can log in to FlexDeploy)**
   3. **Enter your details** 
   4. **Agree**
   5. **Submit**
 

Login to FlexDeploy using username and password from Registration Screen



### Home page, Security, and Topology
 When you log in you see the **FlexDeploy Homepage**

 

### Security
 In the Security Tile **click Groups**

 

### Review:
  *Pre-Configured Roles – FD Administrators
**Click Home** tab to go back to the Homepage

### Topology
**Click** anywhere in the Topology tile or on the Topology Tab

 

The topology is how we administer and configure FlexDeploy so it can understand what it’s talking to. You will see we have SOA and WebLogic configured across WebLogic/QA/Production

 

  - **Click on Development Environment** – Review preconfigured Properties
 

 - Review other preconfigured properties in this lab \
    1.**Click Environments**\
    2.**Click Instances**\
    3.**Click Endpoints**\
    4.**Click Integrations**

- In Integrations - **Click Testing Tab**
 

Reminder: This environment is totally preconfigured for ease of use. One FlexDeploy is set up, we’re ready to run.

 

 ## Projects and Workflow

 ### Projects 

Click Home to go back to the dashboard 

Click Projects to get to the Project Explorer 

Review pre-configured Projects 

- Open Folders, Applications, and Projects

1. **Click drop down arrow next to FlexDeploy** and **Click drop down arrow next to HumanResources** - Folder: A Folder is a container for organizing FlexDeploy applications and projects. A Folder also provides a construct for identifying characteristics that apply to all applications and sub-folders contained within it (e.g. security, approvals, and notifications). 
2. **Click drop down arrow next to HRApp**- Applications: An application is a collection of one or more FlexDeploy projects. An application also provides a construct for identifying characteristics that apply to all projects contained within it (e.g. security, approvals, and notifications). An application is also available for builds and deployments, which will result in a build or deployment of all active projects contained within it. 
3. **Lists out Projects**: A project represents artifacts that can be built and deployed as a unit, deploy can be executed on many instances and many environments. Each project is mapped to exactly one build workflow and one deploy workflow. Each project is also mapped to one build instance, and one or more deploy instances. At workflow execution time (build or deploy), the user selects one or more of the available instances configured on the project, and an environment.
 

- Open four different projects that relate to SOA\
    1.Double Click HRMDS Object\
    2.Double Click HRSOAService\
    3.Double Click ValidatePayment\ 
    4.Double Click WLSConfigurations 
 
- On WLS Configurations – Click Configuration Tab 
- Notice configuration information such as\
    1.SCM\
    2.Stream\
    3.Build Workflow Association – which workflow and where running\
    4.Deploy Workflow Association – which workflow and where running
 

Using the same steps, review the configurations for the other Projects.

 

### Workflows 

Click Workflows Tab

A workflow is an orchestration of steps which define a build or deployment process. These steps can be a combination of plugin operations or basic workflow operations such as variable assignment, conditionals, or looping constructs. Workflows are configured on each project which allows project to perform Build and Deploy operations and in case of Utility projects allows for execution of desired commands.

### SOA Build Workflow 

- Open SOA Build Workflow 
    1.Click arrow for Oracle\
    2.Click arrow for SOA\
    3.Click Build SOA Composite\
    4.Click Definition\
      

- You are now looking at the graphical editor. The Workflow editor contains: 
    1. Workflow Operations 
    2. Plugin Operations 
    3. Drag-and-Drop canvas 
- This workflow is Cloning Project Sources (pulling info from Git), saving test files, and building the SOA Composite/sar file. 
- Spend some time looking at the different workflow operations, and the operations available for different plugins. You can search the available plugin operations using the Search Bar. 

### SOA Deploy Workflow 
- Click Deploy SOA Composite
 

- This workflow is one step to deploy the SOA Composite using plugin operations. 
- Review what is interesting to you!
