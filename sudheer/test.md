# FlexDeploy & Oracle SOA Suite

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

- Open SOA Build Workflow\
    1.Click arrow for Oracle\
    2.Click arrow for SOA\
    3.Click Build SOA Composite\
    4.Click Definition


- You are now looking at the graphical editor. The Workflow editor contains:\
    1.Workflow Operations\
    2.Plugin Operations\
    3.Drag-and-Drop canvas 
- This workflow is Cloning Project Sources (pulling info from Git), saving test files, and building the SOA Composite/sar file. 
- Spend some time looking at the different workflow operations, and the operations available for different plugins. You can search the available plugin operations using the Search Bar. 

### SOA Deploy Workflow 
- Click Deploy SOA Composite
 

- This workflow is one step to deploy the SOA Composite using plugin operations. 
- Review what is interesting to you!

## Build and Deploy

### Build and Deploy

Now that we have reviewed the pre-configured environment (set up so that FlexDeploy knows what the four types of projects are, what technologies are running in each, and how to hand builds and deploys) we can start running automated builds and deploys 

### Click Projects Tab 

   1. **Click ValidatePayment** Project (Note: Version 1.0.1 is running in Development environment) 
   2. Do the Build\
            1. **Click Build**\
            2. **Select Environment** – Development\
            3. **Select Stream** - Master\
            4. **Check Force Build** (because nothing has changed)\
            5. **Click Submit Request** – will run Build workflow



   3. In the Project Activity – see Version 1.0.2 is being built 
   4. **Click Dashboard**
 

   5. On the Dashboard see that the build has been submitted and the workflow from before (Build SOA Composite) is running. This will save and version in artifact repository 
   6. **Click ValidatePayment** in Current Activities to head back to the Project Explorer
 

   7. **Click on the Execution ID** to look at Execution Steps
 

   8. This is showing the three steps from the Build SOA Composite workflow we reviewed earlier 
   9. **Click Back** to get back to the Project Page
 

#### Deploy 

- Deploy the newly packaged build artifact into the next environment. 
1. **Click Deploy** 
2. **Sect Project Version** – 0.2 (the artifact we just built) 
3. **Select Environment** – Development 
*NOTE: You can schedule the deployment if desired 
4. **Click Submit Request** – will run deploy workflow
 

- **Click on Execution ID** to review steps of deploy being executed
 

- **Click Artifacts** to view what is being deployed
 

- **Click Back** to get back to the Projects screen
With that, Version 1.0.2 is running in Development environment

 
### Build
- On the Projects Screen – **Click WLSConfigurations** Project tab (Note: Version 1.0.1 is running in Development environment)\
  1.**Click Build**\
  2.**Select Environment – Development**\
  3.**Check Force Build (because nothing has changed)**\
  4.**Click Submit Request – will run Build workflow**\
- In the Project Activity, see that Version 1.0.2 is being built**

### Deploy 

  1. **Click Deploy**
  2. **Select Project Version – we are deploying previously created version 1.0.2**
  3. **Select Environment – Development Note: Can schedule if desired**
  4. **Click Submit Request – will run deploy workflow**
  5. **Click on Execution ID – to review the steps of the deploy being executed**
- Click Artifacts to view what is being deployed 
- Click Back to get back to the Projects Screen 
With that, Version 1.0.2 of WLSConfigurations is running in Development environment

 

#### Other Project Properties 

There are other tabs on the Project Screen that can be configured for a project. 

   1. Project Configuration – We reviewed this previously. In this tab you can configure SCM, build and deploy workflows, and other project details.
   2. Project Properties - Any project-scoped properties associated to the selected workflows or instances. 
   3. Project Triggers - FlexDeploy's built-in Continuous Integration capabilities live here, and allow developers to setup various triggers for builds & deployment workflow executions. 
   4. Issue Tracking System Configuration - Allows association of the project with any Issue Tracking System Instance which was configured 
   5. Change Management System Configuration - Allows association of the project with any Change Management Instance which was configured 
   6. Test Automation - Provides a way for you to define tests to be executed either as part of a deploy workflow, or to overtly choosing to execute tests on their own. 
   7. Security - Fine-grained access control to meet any security requirements.
 

Let’s review some of those in more detail, and how they’re configured for the HRSOAService Project. 

**Click HRSOAService** Project Tab

### Test Automation 

- Review Test Automation Strategies set for this Project o Click Test Automation Tab 
o  Note the following tests configured

- Integration test in QA Environment for SOA Instance 
- Unit Test in Development Environment 

### Continuous Integration 

Leverage built-in CI Server 

### Click Continuous Integration Tab 

Create Poll SCM Trigger 

  1. **Click Create**
  2. **Select Poll SCM Trigger**
  3. **Define Environment: Development**
  4. **Select Steam Name: Master**
  5. **Set Interval Minutes: 5**
  6. **Click Save**
Outcome: Configured SCM will be polled every 5 minutes and build automatically if changes are found


### Create Post Build Trigger 
  1. **Click Create**
  2. **Select Post Build Trigger**
  3. **Define Environment: Development**
  4. **Select Stream Name: Master**
  5. **Click Save**
Outcome: A Deployment will automatically be triggered after any successful Build of this project. This will be fired immediately after any kind of successful build (Manual or Scheduled or Poll SCM Trigger).

 ## Release and Pipeline
 
 #### Releases 
Release – a software delivery milestone, containing a collection of related or unrelated projects enabling new or updated features/capabilities. 

Release Snapshot – build versions (project versions) of the release's projects which are sent sent through the pipeline. 

   1. **Click Release tab**
   2. **Click Weekly SOA and WebLogic Release**


Lists four projects involved in this release

 

### Pipeline 

A pipeline defines a set of stages (also known as environments), which contain a series of gates and steps. Each gate blocks entry into the steps until some condition is satisfied (e.g. an approval, schedule, or test results meeting some quality metric). The steps define the implementation of delivering the snapshot into the stage. After a stage successfully completes execution, it is sent to the next stage and begins executing its defined gates. 

When a snapshot (versioned project builds) is created it is sent to the pipeline for execution. 

   - Click Pipeline Tab 
Click Simple Pipeline

 

### Review Simple Pipeline 
- Stages 
   1. Development
        - Gates – No gates 
        - Steps – 2 steps 
            1. Deploy All Projects
            2. Execute Unit Tests 
   2. QA
        - Gates
            1. Check Unit Test Results
            2. QA Manager Approval
        - Steps
            1. Deploy All Projects
            2. Execute Integration Tests
            3. Verify Quality (Manual)
            4. Notify QA Manager (Notification) 
   3. Production
        - Gates
            1. Check Integration Test Results (Integration with ServiceNow)
            2. CAB Approval
            3. Release Manager Approval
            4. Schedule Saturday at 9 PM (Schedule)
        - Steps
            1. Deploy All Projects
            2. Notify IT Checkout Group
            3. Production Verification – Manual Tests

 
### Build your Own Pipeline 

- **Click Make a Copy** of Simple Pipeline 
- **Click Expand** to see graphical editor
 

- Drag and drop gates and steps to define reusable pipeline that makes sense to you
 

- **Click Minimize** when you’re done


## Execute a Snapshot

### Create a Snapshot

- **Click Releases** Tab
- **Click Create SnapshFot**
 

- Add Snapshot Description, e.g. “enhancements”
 

- Build Options
   -  Force Build to build all (because nothing changed)


- Use existing Project Version
 
- Derived from Snapshot
 
- Hybrid
 

- Click Submit Request


#### Review Execution and Dashboard 
- **Click Dashboard**
- Here you can see the snapshot be created, i.e. the build of those projects being kicked off. o Click Statistics tab
- The Statistics tab displays the duration and success rates of builds and deployments by environment. 
- **Click Test Automation Tab**
     - The Test Automation tab displays historical information about test automation executions. 

### Release Snapshot
**Click Releases** Tab

**Click Release Dashboard**

 

You see the Snapshot was created and is now deploying in Development Environment because no gates. Review specifics: 

**Click “Deploy all Projects” step**

 

**Click Deploy All Projects** to see what is deploying 

- See four projects that were part of the release. If you deployed an existing project when creating the snapshot, you will see that those projects are skipped because there was nothing new to deploy.
 

**Click Back** twice to go back to the Release Dashboard

- Deployment is Waiting in QA for QA Manager Approval
   1. Click Approve (thumbs up) button to approve this Deployment (NOTE: you are configured to have full permissions in this Demo Lab, including QA Manager permissions)
   2. Enter Approval Notes, e.g. “Review looks good, we need these changes”
 

- The snapshot will continue to move through steps, and ultimately move through to Production and wait for CAB Approval
 

### Review Snapshot Content 

**Click Snapshot Content** - See what Version of each project is running

 

**Click State** Tab to see at birds-eye-view what’s running in which environments

 
