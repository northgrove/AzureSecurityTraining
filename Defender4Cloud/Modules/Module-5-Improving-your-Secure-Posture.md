# Module 5 - Improving your Secure Posture

<p align="left"><img src="../Images/asc-labs-advanced.gif?raw=true"></p>

#### 🎓 Level: 300 (Advanced)
#### ⌛ Estimated time to complete this lab: 60 minutes

## Objectives
This exercise guides you how to use the vulnerability assessment for virtual machines and container, along with automation and data query.

### Exercise 1: Vulnerability assessment for VMs

With Microsoft Defender for Cloud for servers, you can quickly deploy the integrated vulnerability assessment solution (as part of Defender for Endpoint or powered by Qualys) with no additional configuration or extra costs. Once the vulnerability assessment scanner is enabled or deployed, it continually assesses all the installed applications on a virtual machine to find vulnerabilities and presents its findings in the Microsoft Defender for Cloud console. When a machine is found that doesn't have *vulnerability* assessment solution deployed, Microsoft Defender for Cloud generates a recommendation: *A vulnerability assessment solution should be enabled on your virtual machines*. To remediate a resource, you can click on the Quick Fix button to deploy the necessary VM extension.

**Explore vulnerability assessment recommendations:**

1.	From Microsoft Defender for Cloud sidebar, click on **Recommendations**.
2.	Expend **Remediate vulnerabilities** security control (which contains all recommendations related to security vulnerabilities).
3.	Make sure you have *Machines should have a vulnerability assessment solution* recommendation. If you don’t have this recommendation on the list, you will probably need 24 hours to have the recommendation with the assessment.
4.	Open the **AMachines should have a vulnerability assessment solution” recommendation** – this recommendation is a Quick Fix one which allows you to deploy the VM extension on the desired VMs.
5.	Expend **Remediation steps** – in addition to the Quick Fix remediation option, you can also use the **view recommendation logic** option to expose an automatic remediation script content (ARM template). **Close this window.**
6.	From the unhealthy tab, select both *asclab-win* and *aslab-linux* virtual machines. Click **Fix**.
    If there are non unhealty resources, goto the "Healthy resources" tab and verify the "Reason" to be **The machine is onboarded to Microsoft defender vulnerability management**. in that case, jump to **View and remediate vulnerability assessment findings:**
7.	On the **Choose a vulnerability assessment solution** select **Recommended: Deploy ASC integrated vulnerability scanner powered by Qualys (included in Microsoft Defender for Cloud for servers)**. Click **Proceed**.
8.	A window opens, review the list of VMs and click **Remediate 2 resource** button.
9.	Remediation is now in process. Microsoft Defender for Cloud will deploy the Qualys VM extension on the selected VMs, so you track the status using the notification area or by using Azure activity log. Wait 5-10 minutes for the process to complete.

> Note: You can find a list of supported operating systems [here](https://docs.microsoft.com/en-us/azure/security-center/deploy-vulnerability-assessment-vm#deploy-the-integrated-scanner-to-your-azure-and-hybrid-machines).



> Note: There are multiple ways you can automate the process where you need to achieve at scale deployment. More details are available on our [documentation](https://docs.microsoft.com/en-us/azure/security-center/deploy-vulnerability-assessment-vm#automate-at-scale-deployments) and on [blog](https://techcommunity.microsoft.com/t5/azure-security-center/built-in-vulnerability-assessment-for-vms-in-azure-security/ba-p/1577947).



**View and remediate vulnerability assessment findings:**

1.	From Microsoft Defender for Cloud sidebar, click on **Recommendations**.
2.	Expend **Remediate vulnerabilities** security control (which contains all recommendations related to security vulnerabilities).
3.	Search for **Machines should have vulnerability findings resolved**.
4.	On the Security Checks, you should see a list of vulnerabilities found on the affected resources.
5.	On the recommendation, expend **Affected resources**. You should see two unhealthy resources (asclab-win and asclab-linux) and not applicable resources.
6.	From the **Unhealthy resources**, select **asclab-win** resource. Here you can view all relevant recommendations for that resource.
7.	From the findings list, click on the highest vulnerability located at the top (ID 91649).
8.	Notice the vulnerability details on the information pane including the description, impact, severity, remediation steps, etc.

### Exercise 2: Vulnerability assessment for Containers

Microsoft Defender for Cloud scans images in your ACR (Azure Container Registry) that are pushed to the registry, imported into the registry, or any images pulled within the last 30 days.
Then, it exposes detailed findings per image. All vulnerabilities can be found in the following recommendation: Container registry images should have vulnerability findings resolved.

To simulate a container registry image with vulnerabilities, we will use ACR tasks commands and sample image:

1. In the Azure portal, navigate to the **Container registries** blade or click [here](https://portal.azure.com/#blade/HubsExtension/BrowseResource/resourceType/Microsoft.ContainerRegistry%2Fregistries).
2. Copy the name or your container registry, for example: *asclabcrktfvrxcne4kki*
3.	Open [Azure Cloud Shell](https://shell.azure.com/) using the bash environment.
4.	Build a Linux container image from the hello-world image hosted at Microsoft Container Registry and push it to the existing Azure Container Registry instance on your subscription:

Run the the following two script blocks:

```
echo FROM mcr.microsoft.com/azuredocs/aci-helloworld > Dockerfile
```

Modify the following script to include your container registry name:

```
az acr build --image sample/hello-world:v1 --registry <your container registry name> --file Dockerfile .
```

![Build Linux container in Cloud Shell](../Images/asc-build-linux-container-cloud-shell.gif?raw=true)

5. Wait for a successful execution message to appear. For example: Run ID: cb1 was successful after 23s
6.	The scan completes typically within few minutes, but it might take up to 15 minutes for the vulnerabilities/security findings to appear on the recommendation.
7.	From Microsoft Defender for Cloud sidebar, click on **Recommendations**.
8.	Expand **Remediate vulnerabilities** security control and select **Container registry images should have vulnerability findings resolved**.
9.	On the recommendation page, notice the following details at the upper section:
    - Unhealthy registries: *1/1*
    - Severity of recommendation: *High*
    - Total vulnerabilities: *expect to see 2 or more vulnerabilities*
10.	Expend the **Affected resources** section and notice the **Unhealthy registries** count which shows **1 container registry** (asclab-xxx).
11.	On the **Security Checks** section, notice the number of vulnerabilities.
12.	Click on the first security check to open the right pane. Notice the vulnerability description, general information, remediation, and the affected resources. **Close this window.**

![](../Images/Lab5vul2.gif?raw=true)

13.  To filter the findings pr container image, if you have multiple images in your registry, click on the image registry name under Affected resources. You will now see a list over the repositories in the registry. Click on the repository name to see realted images and click on the image name to see related findings.

### Exercise 3: Automate recommendations with workflow automation

Every security program includes multiple workflows for incident response. These processes might include notifying relevant stakeholders, launching a change management process, and applying specific remediation steps.
Using workflow automation, you can trigger logic apps to automate processes in real-time with Microsoft Defender for Cloud events (security alerts or recommendations).
In this lab, you will create a new Logic App and then trigger it automatically using workflow automation feature when there is a change with a specific recommendation.

**Create a new Logic App:**
1.	On the Azure Portal, type *Logic Apps* on the search field at the top or [click here](https://ms.portal.azure.com/#blade/HubsExtension/BrowseResource/resourceType/Microsoft.Logic%2Fworkflows).
2.	Click **Add** to create a new Logic App.
3.	On the Basics tab, select **Azure subscription 1** and resource group **asclab**.
4.	On the Logic app name field enter a unique name such as *SendRecommendationsChanges12* (Note: There will be an error if the Logic app name is not unique).
5.	Select location, for example: **West Europe** (it’s recommended to use the same region as used in the previous exercises).
6.	Under the Plan section, **select consumption**. 
7.	Leave all other options as per the default.
8.	Select **Review + Creation** and then **Create**.
9.	The Logic Apps Designer opens, select **Blank Logic App**.
10.	At the search control, type *Microsoft Defender for Cloud* and select **When an Microsoft Defender for Cloud Recommendation is created or triggered**.
11. Click on new step and type *Outlook.com*.
12. Scroll down the list, and click **Send an email (V2)** action to add it to the Designer.

> Note: you will need to sign into your Outlook.com (Microsoft Account) and grant permissions for the Logic App to send email using your account.
> 
13.	In the Send an email (V2), add your email address to the **To** field.

> Later, you will use that email address to check if you received an email using workflow automation feature.

14.	Click in the **Subject box**, then type: *Recommendation changed:*
15.	Click just after Recommendation changed: to get your cursor in the right place. In the dynamic content box, click on **Dynamic content** and then select `Properties Display Name` (click Add dynamic content if it doesn’t pop out automatically).
15.	Click into the Body text box and type the following:

**The following recommendation has been changed**</br>
**Recommendation:**</br>
**Description:**</br>
**Status:**</br>
**Link to recommendation:**</br>

16.	Click just after each section, to get your cursor in the right place. In the **dynamic content box**, click on **See more** and match each line to the following content:

Recommendation: `Properties Display Name`</br>
Description: `Properties Metadata Description`</br>
Status: `Properties Status Code`</br>
Link to recommendation: `Properties Links Azure Portal Uri`</br>

17.	Your Logic App should now look like the below screenshot. If so, click on **Save** in the Logic App Designer.

![Logic App worklfow](../Images/asc-logic-app-workflow.gif?raw=true)

**Create a new workflow automation instance**
1.	From Microsoft Defender for Cloud's sidebar, select **Workflow automation** which is found under the **Management** section.
2.	Click **Add workflow automation**.
3.	A pane appears on the right side. Enter the following for each field:
    - General:
        - Name: *Send-RecommendationsChanges*
        - Description: *Send email message when a recommendation is created or triggered*
        - Subscription: *Azure subscription 1*
        - Resource group: *asclab*
    - Trigger conditions:
        - Select Microsoft Defender for Cloud data types: *Microsoft Defender for Cloud recommendations*
        - Recommendations name: *All recommendations selected*
        - Recommendation severity: *All severities selected*
        - Recommendation state: *All states selected*
    - Actions:
        - Show Logic App instances from the following subscriptions: *Azure subscription 1*
        - Logic App name: *Send-RecommendationsChanges*
    Click **Create** to complete the task.
4.	Wait for the banner *Workflow automation created successfully. Changes may take up to 5 minutes to be reflected*. From now on, you will get email notifications for recommendations.
Once you start to get email notifications, you can disable the automation by selecting the workflow and clicking on **Disable**.

> Please be aware that if your trigger is a recommendation that has "sub-recommendations” / “nested recommendations”, the logic app will not trigger for every new security finding; only when the status of the parent

5. Once the automation is automatically triggered, you should expect the email message to look like the screenshot below:

![Workflow automation generated email message](../Images/asc-workflow-automation-automated-email.gif?raw=true)

6.	Test/trigger your automation manually:
    - On Microsoft Defender for Cloud sidebar, click on **Recommendations**.
    - Look for any recommendations that has a Quick Fix banner (which is the lightning symbol to the right of the recommendation).
    - Select a resource and then click on **Trigger Logic App** button.
    - In the Logic App Trigger blade, select the Logic App you created in the previous step (SendRecommendationsChanges) and click **Trigger**.
    - You should receive an email containing ...
7.	From Microsoft Defender for Cloud, click on Workflow automation under Management on the left side, and then click on **Guides & Feedback** from the top menu.
8.	Here you can learn more about workflow automation, get useful links and explore our community tools from the GitHub repository.
9.	Click on **Community tools** and then **View all community tools**.

### Exercise 4: Accessing your secure score via ARG
Azure Resource Graph (ARG) provide an efficient and performant resource exploration with the ability to query at scale across a given set of subscriptions.
Azure Secure Score data is available in ARG so you can query and calculate your score for the security controls and accurately calculate the aggregated score across multiple subscription.

1.	From the Azure Portal, search for *Resource Graph Explorer* (or arg).

![Resource Graph Explorer](../Images/asc-resource-graph-explorer.gif?raw=true)

2.	Paste the following KQL query and then select **Run query**.

```
SecurityResources
| where type == 'microsoft.security/securescores'
| extend current = properties.score.current, max = todouble(properties.score.max)
| project subscriptionId, current, max, percentage = ((current / max)*100)
```

3.	You should now see your subscription ID listed along with the current score (in points), the max score and the score as percentage.
4.	To return the status of all the security controls, select **New query**, paste the following KQL query and click on **Run query**:

```
SecurityResources
| where type == 'microsoft.security/securescores/securescorecontrols'
| extend SecureControl = properties.displayName, unhealthy = properties.unhealthyResourceCount, currentscore = properties.score.current, maxscore = properties.score.max
| project SecureControl , unhealthy, currentscore, maxscore
```


### Continue with the next lab: [Module 6 - Workload Protections](../Modules/Module-6-Azure-Defender.md)
