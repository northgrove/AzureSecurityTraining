# Module 3 - Security Policy

<p align="left"><img src="../Images/asc-labs-intermediate.gif?raw=true"></p>

#### 🎓 Level: 200 (Intermediate)
#### ⌛ Estimated time to complete this lab: 60 minutes

## Objectives
This exercise guides you through the current Microsoft Defender for Cloud policies, based on Azure Policy, and shows you where to enable or disable Microsoft Defender for Cloud polices. 

#### Prerequisites
To get started with Microsoft Defender for Cloud, you must have a subscription to Microsoft Azure. If you do not have a subscription, you can sign up for a free account. [Click Here](https://azure.microsoft.com/en-us/free).

### Exercise 1: Overview of the Microsoft Defender for Cloud policy

1.	On Microsoft Defender for Cloud blade, from the left navigation pave, click on **Environment Settings**. 
2. Then select **Subscription 1** and from the left navigation select **Security policy**.
3.	As you can see on the top part, there is 1 assignment under **Default initiative** which is **ASC default (subscription: xxx...)** or **Azure Security Benchmark**.

![Microsoft Defender for Cloud default policy](https://user-images.githubusercontent.com/45104504/192042650-ff0c1b80-efc5-4e11-9af5-28f4e444fc8d.png)

Note: This is the default policy for Microsoft Defender for Cloud recommendations which is enabled by default on your subscription. This is the default set of policies monitored by Microsoft Defender for Cloud. It was automatically assigned as part of onboarding to Microsoft Defender for Cloud. The default assignment contains only audit policies. For more information please visit https://aka.ms/ascpolicies


4.	Click on the assign assignment: **ASC Default (subscription: dd82589b-444c-45a8-863a-816243ce017d)**. Microsoft Defender for Cloud assess your environment and audit data and do not enforce without your approval.
5.	On the Edit Initiative Assignment page, click on **Parameters**
6.	On the Parameters page, untick the box "Only show parameters that require input". Search for **Network Security Groups on the subnet level should be enabled**
7.	On the **Network Security Groups on the subnet level should be enabled**, change the action to AuditIfNotExists to enable monitoring of NSGs on subnets.
![Modifying Microsoft Defender for Cloud default policy assignment](../Images/lab3pl.gif?raw=true)
8.	Click on **Review + save**
9.	On the review tab, you can see your changes under the Parameters section: **networkSecurityGroupsOnSubnetsMonitoringEffect: AuditIfNotExists**

![Modifying Microsoft Defender for Cloud default policy assignment](../Images/asc-default-policy-nsg-recommendation.gif?raw=true)

10.	Click **Save**. Wait for the policy update until complete successful.

### Exercise 2: Explore Azure Policy
1.	On Azure Portal, navigate to **Azure Policy blade**. You can use the search box on the upper part for Policy or navigate to: https://portal.azure.com/#blade/Microsoft_Azure_Policy/PolicyMenuBlade
2.	From the left navigation pane, under the **Authoring** section, click on **Definitions** to explore the built-in policy definitions and initiatives.
3.	From the top menu, use the filter button and set Category as **Security Center** and Definitions Type as **Initiative**.
4.	You can now see two built-in initiatives used by Microsoft Defender for Cloud, some in Preview.
![Modifying Microsoft Defender for Cloud default policy assignment](https://user-images.githubusercontent.com/45104504/192042976-39a39e0c-6f84-4bfb-8510-787430dd6f40.png)

5.	Notice the number of policies included in each initiative (policies column)
6.	Initiatives are assigned to your subscription automatically. To see current assignments, click on **Assignment** from the left navigation pane. Policy initiatives have a different name for the assignment, for example:
    - ASC DataProtection 
    - ASC OpenSourceRelationalDatabasesProtection
    - ASC Default 

7.	Click on **ASC Default** to edit assignment details
8.	As you can see, this is the same assignment page as presented in the previous section. Now exit.

### Exercise 3: Create resource exemption for a recommendation

Resource exemption will allow increased granularity for you to fine-tune recommendations by providing the ability to exempt certain resources from evaluation.
When working with a recommendation, you can create an exemption by clicking the ellipsis menu on the right side and then select create exemption.

Note: Exemptions is a premium Azure policy capability that's offered for Microsoft Defender for Cloud customers with no additional cost. For other users, charges may apply in the future.

1.	Open **Microsoft Defender for Cloud blade** and from the left navigation pane and select **Recommendations**.
2.	Expand **Secure management ports** security control.
3.	Select the **Management ports should be closed on your virtual machines** recommendation.
4.	On the list of **unhealthy resources**, see the current resources: *asclab-win* and *asclab-linux*.
5.	Select the **asclab-win** resource and then click on **Exempt**.

![Create exemption](../Images/asc-management-ports-resource-exemption.gif?raw=true)

6.	The create **exemption pane** opens:
   *	Keep the default name.
*	Mark the **Set an expiration date** and set datetime for two days ahead on 12:00 AM.

    - Select **Waiver** as exemption category.
    - Provide a description: **Testing exemption capability – module 3**.
    - Select **Create**.
  
  ![Modifying Microsoft Defender for Cloud default policy assignment](../Images/Inkedlab3pl6.gif?raw=true)
  
> ⭐ Good to know: <br>
> **Mitigated** - This issue isn't relevant to the resource because it's been handled by a different tool or process than the one being suggested
> **Waiver** - Accepting the risk for this resource

7.	It might take up to **30 min for exemption to take effect**. Once this happens:
    - The resource doesn't impact your secure score.
    - The resource is listed in the Not applicable tab of the recommendation details page
    - The information strip at the top of the recommendation details page lists the number of exempted resources: **1**

8.	Open the **Not applicable** tab to review your exempted resource – you can see our resource along with the reason / description value.
9.	Exemption rules is based on Azure Policy capability. Therefore, you can track all your exemptions from Azure Policy blade as well.
10.	Navigate to **Azure Policy blade** and select **Exemptions** from the left navigation pane. Notice your newly created exemption listed there.

### Exercise 4: Create a policy enforcement and deny

1.	From **Microsoft Defender for Cloud sidebar**, select **Recommendations**.
2.	in the "search recommendations" box, search for "Storage"

![Auditing on SQL server should be enabled](../Images/D4C-SearchStorageAccount.png?raw=true)

3.	From the filtered recommendations list, select **Secure transfer to storage accounts should be enabled**.

4.	From the top menu bar, click on **Deny** button. *Enforce and Deny options provide you another way to improve your score by preventing security misconfigurations*.

> ❗ Important: <br>
> Security misconfigurations are a major cause of security incidents

5.	On the **Deny - Prevent resource creation**, select **Azure subscription 1** (which is currently set to audit mode). This allow you to ensure that from now on, storage account without the security transfer feature turned on will be denied.

![Prevent resource creation](../Images/asc-storage-deny-policy.gif?raw=true)

6.	Go back to the **Recommendations view**, and remove the Deny-only filter. From the search area, type **Auditing**. Click on the recommendation **Auditing on SQL server should be enabled**.

![Auditing on SQL server should be enabled](../Images/asc-auditing-sql.gif?raw=true)

7.	On the recommendations page, from the top menu bar, click on **Enforce** button. Using this option allow you to take advantage of Azure policy’s DeployIfNotExist effect and automatically remediate non-compliant resources upon creation.
8.	Once the configuration pane opens with all of the policy configuration options, select the following configuration settings:

* On Scope, select your subscription. **Click Select**.
* Click **Next**
* Keep retention days as is and select then resource group **asclab**
Select **Review + create** to assign the policy on your subscription.
* Click **Create**

9. On the recommendation page, **select** the SQL Server resource found on the **unhealthy resources** tab (asclab-sql-xxx) and click **Fix**. Choose "asclab-la-..." as Workspace ID. Click **Fix 1 resource**. By doing both operations, you can now be ensure your existing resources and new ones will be enabled for auditing. Auditing on your SQL Server helps you track database activities across all databases on the server and save them in an audit log.
![fix sql](../Images/D4C-FixSQLserver.png?raw=true)
10.	[Click here](https://docs.microsoft.com/en-us/azure/security-center/secure-score-security-controls#security-controls-and-their-recommendations "Security controls and their recommendations") to review a list of security controls and their recommendations.

### Exercise 5: Create a custom policy

***Create a custom initiative using Azure Policy***
1.	Navigate to **Azure Policy blade**.
2.	Select **Definitions** from the sidebar.
3.	From the top menu, select **+Initiative definition**.
4.	On the New Initiative definition page, select the following:
    - Initiative scope: Azure subscription 1
    - Name: Contoso Security Benchmark
    - Description: Baseline for security policies to appear alongside with the built-in recommendations
    - Category: select Create new and type: Contoso
    - Version: 1
    - Click **Next**
  
 ![Policy initiative definition settings page](../Images/asc-new-policy-initiative-definition.gif?raw=true)

5.	On Policies tab, select **Add policy definitions**.
6.	The Add policy definition(s) pane opens: <br>
Add each policy one by one:
    - *Function apps should use managed identity*
    - *MFA should be enabled on accounts with owner permissions on your subscription*
    - *Public network access on Azure SQL Database should be disabled*
    - *Storage accounts should restrict network access*

7. Select **Review + Create**. Click **Create**.

***Add a custom initiative to your subscription***

1.	Navigate to Microsoft Defender for Cloud, and the **Environment settings** page from the left sidebar.
2.	Select **Azure subscription 1** as a scope for your custom initiative.
3.  Select **Security Policy** from the left sidebar.

> Note: You must add custom standards at the subscription level (or higher) for them to be evaluated and displayed in Microsoft Defender for Cloud.

4.	In the Security policy page, under Your custom initiatives, click **Add a custom initiative**.
5.	Your newly created initiative is listed: *Contoso Security Benchmark*. Select **Add**.

![Assign custom initiative](../Images/asc-assign-custom-initiative.gif?raw=true)

6.	On **Assign Initiative** page, select **Review + Create** and then **Create**.
7.	Your custom initiative is now assigned.

### Continue with the next lab: [Module 4 - Regulatory Compliance](../Modules/Module-4-Regulatory-Compliance.md)
