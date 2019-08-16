# Securing Secrets in Azure

## Table of Contents 

[Overview](#overview)

[Pre-requisites](#pre-requisites)

[Exercise 1\: Deploy Key Vault resources](#exercise-1-deploy-key-vault-resources)

[Exercise 2\: Deploy Azure VM using Key Vault secret](#exercise-2-deploy-azure-vm-using-key-vault-secret)
    
[Exercise 3\: Remove lab resources](#exercise-3-remove-lab-resources)    

## Overview

The aim of this Lab is to add secrets in Azure Key Vault by deploying Key Vault resource in Azure portal and deploy the Azure VM using Key Vault secret.

### Scenario & Objective

 To manage security and identity for Azure solutions
 
  After completing this lab, you will be able to:
  
- Deploy Key Vault resources

- Deploy Azure VM using Key Vault secret

- Remove lab resource

## Pre-requisites

- [Visual Studio Code](https://code.visualstudio.com/)

- [Microsoft Azure Storage Explorer](https://azure.microsoft.com/features/storage-explorer/)

- Bash on Ubuntu on Windows

## Exercise 1: Deploy Key Vault resources

**Task 1: Open the Azure Portal**

1. On the Taskbar, click the  **Microsoft Edge**  icon.
2. In the open browser window, navigate to the  **Azure Portal**  ([https://portal.azure.com](https://portal.azure.com/)).
3. When prompted, authenticate with the user account that has the owner role in the Azure subscription you will be using in this lab.

**Task 2: Deploy a key vault**

1. In the upper left corner of the Azure portal, click  **Create a resource**.
     
![alt text](https://raw.githubusercontent.com/sysgain/qloudable-tl-labs/MicrosoftLearnings/AZ-301-MicrosoftAzureArchitectDesign/images/Lab1-Securing%20Secrets%20in%20Azure/1.png?token=AE66OZVFJL5RQVI5CY5GSXK5LUXUI)

2. At the top of the  **New**  blade, in the  **Search the Marketplace**  text box, type  **Key Vault**  and press  **Enter**.

![alt text](https://raw.githubusercontent.com/sysgain/qloudable-tl-labs/MicrosoftLearnings/AZ-301-MicrosoftAzureArchitectDesign/images/Lab1-Securing%20Secrets%20in%20Azure/2.png?token=AE66OZUELC724SYN4RMC2B25LUY4I)

3. On the  **Everything**  blade, in the search results, click  **Key Vault**.
4. On the  **Key Vault**  blade, click the  **Create**  button.

![alt text](https://raw.githubusercontent.com/sysgain/qloudable-tl-labs/MicrosoftLearnings/AZ-301-MicrosoftAzureArchitectDesign/images/Lab1-Securing%20Secrets%20in%20Azure/3.png?token=AE66OZVVL2EITLMB3KIR2ZS5LUXYU)

5. On the  **Create key vault**  blade, perform the following tasks:

- In the  **Name**  text box, type a globally unique value.
- Leave the  **Subscription**  drop-down list entry set to its default value.
- In the  **Resource group**  section, ensure that the  **Create new**  option is selected and then, in the text box, type  **AADesignLab0901-RG**.
- In the  **Location**  drop-down list, select the Azure region to which you intend to deploy resources in this lab.
- Click  **Pricing tier** , on the  **Pricing tier**  blade, click  **A1 Standard** , and then click  **Select**.
- Leave all remaining settings with their default values.
- Click the  **Create**  button.

![alt text](https://raw.githubusercontent.com/sysgain/qloudable-tl-labs/MicrosoftLearnings/AZ-301-MicrosoftAzureArchitectDesign/images/Lab1-Securing%20Secrets%20in%20Azure/4.png?token=AE66OZSZ5TVO3WONXSG4DAS5LUZ42)

6. Wait for the provisioning to complete before you proceed to the next task.

**Task 3: Add a secret to a key vault by using the Azure portal**

1. In the hub menu in the Azure portal, click  **Resource groups**.
2. On the  **Resource groups**  blade, click  **AADesignLab0901-RG**.

![alt text](https://raw.githubusercontent.com/sysgain/qloudable-tl-labs/MicrosoftLearnings/AZ-301-MicrosoftAzureArchitectDesign/images/Lab1-Securing%20Secrets%20in%20Azure/5.png?token=AE66OZXYXMLS6XB5B46YGSC5LUZ56)

3. On the  **AADesignLab0901-RG**  blade, click the entry representing the newly created key vault.

![alt text](https://raw.githubusercontent.com/sysgain/qloudable-tl-labs/MicrosoftLearnings/AZ-301-MicrosoftAzureArchitectDesign/images/Lab1-Securing%20Secrets%20in%20Azure/6.png?token=AE66OZWOXSNGN6WSQCVTIK25LUZ7G)


4. On the key vault blade, click  **Secrets**.
5. On the key vault secrets blade, click the  **Generate/Import**  button at the top of the pane.

![alt text](https://raw.githubusercontent.com/sysgain/qloudable-tl-labs/MicrosoftLearnings/AZ-301-MicrosoftAzureArchitectDesign/images/Lab1-Securing%20Secrets%20in%20Azure/7.png?token=AE66OZQNA6NHPG7K5PW2U3K5LU2AO)

6. On the  **Create a secret**  blade, perform the following tasks:

- In the  **Upload options**  drop-down list, ensure that the  **Manual**  entry is selected.
- In the  **Name**  text-box, type  **thirdPartyKey**.
- In the  **Value**  text box, enter the value  **56d95961e597ed0f04b76e58**
- Leave all remaining settings with their default values.
- Click the  **Create**  button.

![alt text](https://raw.githubusercontent.com/sysgain/qloudable-tl-labs/MicrosoftLearnings/AZ-301-MicrosoftAzureArchitectDesign/images/Lab1-Securing%20Secrets%20in%20Azure/8.png?token=AE66OZXKWPFHBCX3IB53VXS5LU2BQ)


 #### **Task 4: Open Cloud Shell**

1. At the top of the portal, click the  **Cloud Shell**  icon to open a new shell instance.

**Note** : The  **Cloud Shell**  icon is a symbol that is constructed of the combination of the_  __greater than__  _and_ __underscore_ characters_._

2. If this is your first time opening the  **Cloud Shell**  using your subscription, you will see a wizard to configure  **Cloud Shell** for first-time usage. When prompted, in the  **Welcome to Azure Cloud Shell**  pane, click **Bash (Linux)**.

**Note** : If you do not see the configuration options for  **Cloud Shell** , this is most likely because you are using an existing subscription with this course&#39;s labs. If so, proceed directly to the next task.

![alt text](https://raw.githubusercontent.com/sysgain/qloudable-tl-labs/MicrosoftLearnings/AZ-301-MicrosoftAzureArchitectDesign/images/Lab1-Securing%20Secrets%20in%20Azure/9.png?token=AE66OZU44LTE5TUVWOBKPWC5LU2DC)


3. In the  **You have no storage mounted**  pane, click  **Show advanced settings** , perform the following tasks:

- Leave the  **Subscription**  drop-down list entry set to its default value.
- In the  **Cloud Shell region**  drop-down list, select the Azure region matching or near the location where you intend to deploy resources in this lab
- In the  **Resource group**  section, select the  **Use existing**  option and then, in the drop-down list, select  **AADesignLab0901-RG**.
- In the  **Storage account**  section, ensure that the  **Create new**  option is selected and then, in the text box below, type a unique name consisting of a combination of between 3 and 24 characters and digits.
- In the  **File share**  section, ensure that the  **Create new**  option is selected and then, in the text box below, type  **cloudshell**.

![alt text](https://raw.githubusercontent.com/sysgain/qloudable-tl-labs/MicrosoftLearnings/AZ-301-MicrosoftAzureArchitectDesign/images/Lab1-Securing%20Secrets%20in%20Azure/10.png?token=AE66OZSWCRAUE2YLBEDKOPK5LUXZ4)

- Click the  **Create storage**  button.

4. Wait for the  **Cloud Shell**  to finish its first-time setup procedures before you proceed to the next task.

#### **Task 5: Add a secret to a key vault using the CLI**

1. At the  **Cloud Shell**  command prompt, type in the following command and press  **Enter**  to create a variable which value designates the name of the resource group that contains the Azure key vault you deployed earlier in this exercise:
    ```
    RESOURCE_GROUP='AADesignLab0901-RG'
    ```
2. At the  **Cloud Shell**  command prompt, type in the following command and press  **Enter**  to retrieve the name of the Azure key vault you created earlier in this exercise:

    ```
    KEY_VAULT_NAME=$(az keyvault list --resource-group $RESOURCE_GROUP --query "[0].name" --output tsv)
    ```

3. At the  **Cloud Shell**  command prompt, type in the following command, and press  **Enter**  to list secrets in the key vault:

    ```
    az keyvault secret list --vault-name $KEY_VAULT_NAME
    ```

4. At the  **Cloud Shell**  command prompt, type in the following command and press  **Enter**  to display the value of the  **thirdPartyKey**  secret:

    ```
    az keyvault secret show --vault-name $KEY_VAULT_NAME --name thirdPartyKey --query value --output tsv
    ```

![alt text](https://raw.githubusercontent.com/sysgain/qloudable-tl-labs/MicrosoftLearnings/AZ-301-MicrosoftAzureArchitectDesign/images/Lab1-Securing%20Secrets%20in%20Azure/11.png?token=AE66OZTJVFXSYYDP5YSWV7C5LUX3G)


5. At the  **Cloud Shell**  command prompt, type in the following command and press  **Enter**  to add a new secret to your key vault:

    ```
    az keyvault secret set --vault-name $KEY_VAULT_NAME --name firstPartyKey --value 56f8a55119845511c81de488
    ```

![alt text](https://raw.githubusercontent.com/sysgain/qloudable-tl-labs/MicrosoftLearnings/AZ-301-MicrosoftAzureArchitectDesign/images/Lab1-Securing%20Secrets%20in%20Azure/12.png?token=AE66OZXSXTRQKYO3LJH6Q6C5LUX4Q)

6. At the  **Cloud Shell**  command prompt, type in the following command and press  **Enter**  to list secrets in the key vault:

    ```
    az keyvault secret list --vault-name $KEY_VAULT_NAME --query "[*].{Id:id,Created:attributes.created}" --out table
    ```
  ![alt text](https://raw.githubusercontent.com/sysgain/qloudable-tl-labs/MicrosoftLearnings/AZ-301-MicrosoftAzureArchitectDesign/images/Lab1-Securing%20Secrets%20in%20Azure/13.png?token=AE66OZTTOZ5BX3WHHPT46PK5LUX52)

7. Close the  **Cloud Shell**  pane.

#### **Task 6: Add secrets to a key vault by using Azure Resource Manager templates**

1. In the upper left corner of the Azure portal, click  **Create a resource**.
2. At the top of the  **New**  blade, in the  **Search the Marketplace**  text box, type  **Template Deployment**  and press  **Enter**.
3. On the  **Everything**  blade, in the search results, click  **Template Deployment**.

![alt text](https://raw.githubusercontent.com/sysgain/qloudable-tl-labs/MicrosoftLearnings/AZ-301-MicrosoftAzureArchitectDesign/images/Lab1-Securing%20Secrets%20in%20Azure/14.png?token=AE66OZWOBYI6CYGRROP3M725LUX7I)

4. On the  **Template deployment**  blade, click the  **Create**  button.
5. On the  **Custom deployment**  blade, click the  **Build your own template in the editor**  link.

![alt text](https://raw.githubusercontent.com/sysgain/qloudable-tl-labs/MicrosoftLearnings/AZ-301-MicrosoftAzureArchitectDesign/images/Lab1-Securing%20Secrets%20in%20Azure/15.png?token=AE66OZUT6UPTTVSXVKY3YWC5LUYAQ)


6. On the  **Edit template**  blade, click  **Load file**.
7. In the  **Choose File to Upload**  dialog box, navigate to the  **\allfiles\AZ-301T01\Module\_01\LabFiles\Starter\**  folder, select the  **secret-template.json**  file, and click  **Open**. This will load the following content into the template editor pane:
```json
{
        "$schema": "http://schema.management.azure.com/schemas/2015-01-01/deploymentTemplate.json#",
        "contentVersion": "1.0.0.0",
        "parameters": {
            "vaultName": {
                "type": "string"
            }
        },
        "variables": {
            "secretName": "vmPassword"
        },
        "resources": [
            {
                "apiVersion": "2016-10-01",
                "type": "Microsoft.KeyVault/vaults/secrets",
                "name": "[concat(parameters('vaultName'), '/', variables('secretName'))]",
                "properties": {
                    "contentType": "text/plain",
                    "value": "StudentPa$$w.rd"
                }
            }
        ]
    }
```
8. Click the  **Save**  button to persist the template.
9. Back on the  **Custom deployment**  blade, perform the following tasks:

  - Leave the  **Subscription**  drop-down list entry set to its default value.
  - In the  **Resource group**  section, select the  **Use existing**  option and then, in the drop-down list, select  **AADesignLab0901-RG**.
  - In the  **Vault Name**  text box, type the name of the key vault you created earlier in this exercise.
  - In the  **Terms and Conditions**  section, select the  **I agree to the terms and conditions stated above**  checkbox.

 ![alt text](https://raw.githubusercontent.com/sysgain/qloudable-tl-labs/MicrosoftLearnings/AZ-301-MicrosoftAzureArchitectDesign/images/Lab1-Securing%20Secrets%20in%20Azure/16.png?token=AE66OZVDF3JTX6OAGXCARTC5LUYTW)


10. Click the  **Purchase**  button.
11. Do not wait for the deployment to complete but proceed to the next step.
12. In the upper left corner of the Azure portal, click  **Create a resource**.
13. At the top of the  **New**  blade, in the  **Search the Marketplace**  text box, type  **Template Deployment**  and press  **Enter**.
14. On the  **Everything**  blade, in the search results, click  **Template Deployment**.

 ![alt text](https://raw.githubusercontent.com/sysgain/qloudable-tl-labs/MicrosoftLearnings/AZ-301-MicrosoftAzureArchitectDesign/images/Lab1-Securing%20Secrets%20in%20Azure/17.png?token=AE66OZRVA66QYKIYLYGOAES5LUYVI)


15. On the  **Template deployment**  blade, click the  **Create**  button.
16. On the  **Custom deployment**  blade, click the  **Build your own template in the editor**  link.
17. On the  **Edit template**  blade, click  **Load file**.
18. In the  **Choose File to Upload**  dialog box, navigate to the  **\allfiles\AZ-301T01\Module\_01\LabFiles\Starter\**  folder, select the  **storage-template.json**  file, and click  **Open**. This will load the following content into the template editor pane:
19. Click the  **Save**  button to persist the template.

 ![alt text](https://raw.githubusercontent.com/sysgain/qloudable-tl-labs/MicrosoftLearnings/AZ-301-MicrosoftAzureArchitectDesign/images/Lab1-Securing%20Secrets%20in%20Azure/18.png?token=AE66OZQWAZNRSOOMM2TDMF25LUYZW)

20.  Back on the  **Custom deployment**  blade, perform the following tasks:

  - Leave the  **Subscription**  drop-down list entry set to its default value.
  - In the  **Resource group**  section, select the  **Use existing**  option and then, in the drop-down list, select  **AADesignLab0901-RG**.
  - In the  **Vault Name**  field, type the name of the key vault you created earlier in this exercise.
  - In the  **Terms and Conditions**  section, select the  **I agree to the terms and conditions stated above**  checkbox.
  - Click the  **Purchase**  button.

![alt text](https://raw.githubusercontent.com/sysgain/qloudable-tl-labs/MicrosoftLearnings/AZ-301-MicrosoftAzureArchitectDesign/images/Lab1-Securing%20Secrets%20in%20Azure/19.png?token=AE66OZVMQWBBZ4PZL2RGUBC5LUY3A)


21. Wait for the deployment to complete before you proceed to the next task.

#### **Task 7: View key vault secrets**

1. In the hub menu of the Azure portal, click  **Resource groups**.
2. On the  **Resource groups**  blade, click  **AADesignLab0901-RG**.
3. On the  **AADesignLab0901-RG**  blade, click the entry representing the key vault you created earlier in this exercise.

![alt text](https://raw.githubusercontent.com/sysgain/qloudable-tl-labs/MicrosoftLearnings/AZ-301-MicrosoftAzureArchitectDesign/images/Lab1-Securing%20Secrets%20in%20Azure/20.png?token=AE66OZSFBDRBF2IA527BJU25LUY6A)


4. On the key vault blade, click  **Secrets**.
5. On the key vault secrets blade, review the list of secrets created during this lab.
6. Click the entry representing the  **vmPassword**  secret.

![alt text](https://raw.githubusercontent.com/sysgain/qloudable-tl-labs/MicrosoftLearnings/AZ-301-MicrosoftAzureArchitectDesign/images/Lab1-Securing%20Secrets%20in%20Azure/21.png?token=AE66OZWTTRIRQHPCM5WYE325LUY7U)


7. On the  **vmPassword**  blade, click the entry representing the current version of the secret.

![alt text](https://raw.githubusercontent.com/sysgain/qloudable-tl-labs/MicrosoftLearnings/AZ-301-MicrosoftAzureArchitectDesign/images/Lab1-Securing%20Secrets%20in%20Azure/22.png?token=AE66OZVVFUZIOW575KMPKRK5LUZCQ)


8. On the Secret Version blade, click the  **Show secret value**  button.

![alt text](https://raw.githubusercontent.com/sysgain/qloudable-tl-labs/MicrosoftLearnings/AZ-301-MicrosoftAzureArchitectDesign/images/Lab1-Securing%20Secrets%20in%20Azure/23.png?token=AE66OZUV6P7F5GRAJ5BI27C5LUZD6)


9. Verify that the value of the secret matches the one included in the template you deployed in the previous task.

**Review** : In this exercise, you created a  **Key Vault**  instance and used several different methods to add secrets to the key vault.

# Exercise 2: Deploy Azure VM using Key Vault secret

**Task 1: Retrieve the value of the key vault Resource Id parameter**

1. At the top of the portal, click the  **Cloud Shell**  icon to open a new Cloud Shell instance.
2. At the  **Cloud Shell**  command prompt, type in the following command and press  **Enter**  to create a variable which value designates the name of the resource group that will contain the hub virtual network:

    ```
    RESOURCE_GROUP='AADesignLab0901-RG'
    ```

3. At the  **Cloud Shell**  command prompt, type in the following command and press  **Enter**  to retrieve the resource id of the Azure key vault you created earlier in this exercise:

    ```
    KEY_VAULT_ID=$(az keyvault list --resource-group $RESOURCE_GROUP --query "[0].id" --output tsv)
    ```

4. At the  **Cloud Shell**  command prompt, type in the following command and press  **Enter**  to create a variable which value designates the name of the Azure key vault resource id and which takes into account any special character the resource id might include:

    ```
    KEY_VAULT_ID_REGEX="$(echo $KEY_VAULT_ID | sed -e 's/\\/\\\\/g; s/\//\\\//g; s/&/\\\&/g')"
    ```

![alt text](https://raw.githubusercontent.com/sysgain/qloudable-tl-labs/MicrosoftLearnings/AZ-301-MicrosoftAzureArchitectDesign/images/Lab1-Securing%20Secrets%20in%20Azure/24.png?token=AE66OZQPGOAYQ2DXHSGHD4S5LUZF4)

**Task 2: Prepare the Azure Resource Manager deployment template and parameters files**

1. In the  **Cloud Shell**  pane, click the  **Upload/Download files**  icon and, in the drop-down menu, click  **Upload**.

![alt text](https://raw.githubusercontent.com/sysgain/qloudable-tl-labs/MicrosoftLearnings/AZ-301-MicrosoftAzureArchitectDesign/images/Lab1-Securing%20Secrets%20in%20Azure/25.png?token=AE66OZSWMXLM7ZU3TU6D2HC5LUZH4)

2. In the  **Open**  dialog box, navigate to the  **\allfiles\AZ-301T01\Module\_01\LabFiles\Starter\**  folder, select the  **vm-template.json**  file, and click  **Open**.
3. In the  **Cloud Shell**  pane, click the  **Upload/Download files**  icon and, in the drop-down menu, click  **Upload**.
4. In the  **Open**  dialog box, navigate to the  **\allfiles\AZ-301T01\Module\_01\LabFiles\Starter\**  folder, select the  **vm-template.parameters.json**  file, and click  **Open**.
5. At the  **Cloud Shell**  command prompt, type in the following command and press  **Enter**  to replace the placeholder for the  **$KEY\_VAULT\_ID**  parameter in the  **vm-template.parameters.json**  parameters file with the value of the  **$KEY\_VAULT\_ID**  variable:

    ```
    sed -i.bak1 's/"$KEY_VAULT_ID"/"'"$KEY_VAULT_ID_REGEX"'"/' ~/vm-template.parameters.json
    ```

6. At the  **Cloud Shell**  command prompt, type in the following command and press  **Enter**  to verify that the placeholder was successfully replaced in the parameters file:

    ```
    cat ~/vm-template.parameters.json
    ```

![alt text](https://raw.githubusercontent.com/sysgain/qloudable-tl-labs/MicrosoftLearnings/AZ-301-MicrosoftAzureArchitectDesign/images/Lab1-Securing%20Secrets%20in%20Azure/26.png?token=AE66OZS6II7IEZQRFXUSNSK5LUZJC)

**Task 3: Configure a key vault for deployment of Azure Resource Manager templates**

1. In the hub menu in the Azure portal, click  **Resource groups**.
2. On the  **Resource groups**  blade, click  **AADesignLab0901-RG**.
3. On the  **AADesignLab0901-RG**  blade, click the entry representing the key vault you created in the previous exercise.

![alt text](https://raw.githubusercontent.com/sysgain/qloudable-tl-labs/MicrosoftLearnings/AZ-301-MicrosoftAzureArchitectDesign/images/Lab1-Securing%20Secrets%20in%20Azure/27.png?token=AE66OZS3NRMOYPQZ3PCULN25LUZKM)


4. On the key vault blade, click  **Access policies**.
5. On the  **Access policies**  blade, click the  **Click to show advanced access policies**  link.

![alt text](https://raw.githubusercontent.com/sysgain/qloudable-tl-labs/MicrosoftLearnings/AZ-301-MicrosoftAzureArchitectDesign/images/Lab1-Securing%20Secrets%20in%20Azure/28.png?token=AE66OZWUPWOBWK2DCSXNW4K5LUZMA)


6. Select the  **Enable access to Azure Resource Manager for template deployment**  checkbox.
7. Click the  **Save**  button at the top of the pane.

![alt text](https://raw.githubusercontent.com/sysgain/qloudable-tl-labs/MicrosoftLearnings/AZ-301-MicrosoftAzureArchitectDesign/images/Lab1-Securing%20Secrets%20in%20Azure/29.png?token=AE66OZV6V62SSDUE7IOIBOK5LUZN4)


#### **Task 4: Deploy a Linux VM with the password paramter set by using a key vault secret.**

1. At the  **Cloud Shell**  command prompt, type in the following command and press  **Enter**  to deploy the Azure Resource Manager template with the specified parameters file:

    ```
    az group deployment create --resource-group $RESOURCE_GROUP --template-file ~/vm-template.json --parameters @~/vm-template.parameters.json
    ```

![alt text](https://raw.githubusercontent.com/sysgain/qloudable-tl-labs/MicrosoftLearnings/AZ-301-MicrosoftAzureArchitectDesign/images/Lab1-Securing%20Secrets%20in%20Azure/30.png?token=AE66OZT2C3HRSPHOLGD7G225LUZQ2)


2. Wait for the deployment to complete before you proceed to the next task.

![alt text](https://raw.githubusercontent.com/sysgain/qloudable-tl-labs/MicrosoftLearnings/AZ-301-MicrosoftAzureArchitectDesign/images/Lab1-Securing%20Secrets%20in%20Azure/31.png?token=AE66OZTTXENXLFYAUXH7Z7K5LUZSM)

#### **Task 5: Verify the outcome of the deployment**

1. At the  **Cloud Shell**  command prompt, type in the following command and press  **Enter**  to create a variable which value designates the name of the resource group that contains the newly deployed Azure VM:

    ```
    RESOURCE_GROUP='AADesignLab0901-RG'
    ```

2. At the Cloud Shell command prompt, type in the following command and press Enter to retrieve the name of the Azure key vault containing the secret that stores the value of the password of the local Administrator account:

```
 KEY_VAULT_NAME=$(az keyvault list --resource-group $RESOURCE_GROUP --query "[0].name" --output tsv)
```

3. At the Cloud Shell command prompt, type in the following command and press  **Enter**  to retrieve the value of the secret:

    ```
    az keyvault secret show --vault-name $KEY_VAULT_NAME --name vmPassword --query value --output tsv
    ```

4. At the Cloud Shell command prompt, type in the following command and press Enter to retrieve the public IP address of the Azure VM you deployed in the previous task:

    ```
    PUBLIC_IP=$(az network public-ip list --resource-group $RESOURCE_GROUP --query "[0].ipAddress" --output tsv)
    ```

![alt text](https://raw.githubusercontent.com/sysgain/qloudable-tl-labs/MicrosoftLearnings/AZ-301-MicrosoftAzureArchitectDesign/images/Lab1-Securing%20Secrets%20in%20Azure/32.png?token=AE66OZRWJZ744N42LLU4HIK5LUZT2)


5. At the Cloud Shell command prompt, type in the following command and press Enter to connect to the Azure VM via SSH:

    ```
    ssh Student@$PUBLIC_IP
    ```

6. At the  **Cloud Shell**  command prompt, when prompted whether you want to continue connecting, type yes and press  **Enter**.

![alt text](https://raw.githubusercontent.com/sysgain/qloudable-tl-labs/MicrosoftLearnings/AZ-301-MicrosoftAzureArchitectDesign/images/Lab1-Securing%20Secrets%20in%20Azure/33.png?token=AE66OZXKOCFNLQWQBTKZZ5K5LUZVS)

7. At the  **cloud Shell**  command prompt, when prompted for password, type the value of the secret you retrieved earlier in this task and press  **Enter****.**
8. Verify that you successfully authenticated.
9. At the  **Cloud Shell**  command prompt, type exit to log out from the Azure VM.

![alt text](https://raw.githubusercontent.com/sysgain/qloudable-tl-labs/MicrosoftLearnings/AZ-301-MicrosoftAzureArchitectDesign/images/Lab1-Securing%20Secrets%20in%20Azure/34.png?token=AE66OZSPICDX6RLROGBZO5K5LUZYK)


**Review** : In this exercise, you deployed a Linux VM using a password stored as a key vault secret.

# Exercise 3: Remove lab resources

**Task 1: Open Cloud Shell**

1. At the top of the portal, click the  **Cloud Shell**  icon to open the Cloud Shell pane.
2. At the  **cloud shell**  command prompt, type in the following command and press  **Enter**  to list all resource groups you created in this lab:

```
az group list --query "[?starts_with(name,'AADesignLab09')]".name --output tsv
```

3. Verify that the output contains only the resource groups you created in this lab. These groups will be deleted in the next task.

![alt text](https://raw.githubusercontent.com/sysgain/qloudable-tl-labs/MicrosoftLearnings/AZ-301-MicrosoftAzureArchitectDesign/images/Lab1-Securing%20Secrets%20in%20Azure/35.png?token=AE66OZVGHDJN3LEWPR7QBZK5LUZZW)

#### **Task 2: Delete resource groups**

1. At the  **cloud shell**  command prompt, type in the following command and press  **Enter**  to delete the resource groups you created in this lab

    ```
    az group list --query "[?starts_with(name,'AADesignLab09')]".name --output tsv | xargs -L1 bash -c 'az group delete --name $0 --no-wait --yes'
    ```

![alt text](https://raw.githubusercontent.com/sysgain/qloudable-tl-labs/MicrosoftLearnings/AZ-301-MicrosoftAzureArchitectDesign/images/Lab1-Securing%20Secrets%20in%20Azure/36.png?token=AE66OZTNTNEJEIQQIR4PW7S5LUZ3A)

2. Close the  **Cloud Shell**  prompt at the bottom of the portal.

**Review** : In this exercise, you removed the resources used in this lab.
