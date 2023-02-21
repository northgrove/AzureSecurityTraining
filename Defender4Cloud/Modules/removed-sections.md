Exercise 4: Creating your own benchmark


Module 5: vulnerabilities
10.	Ensure the VM extension is deployed on the relevant machines:
    - From Azure Portal, open **Virtual Machines**.
    - Select **asclab-win**.
    - From the sidebar, click on **Extensions**.
    - Make sure to have `WindowsAgent.AzureSecurityCenter` extension installed and successfully provisioned.
    - Repeat the process for **asclab-linux** – you should expect to see a different name for the extension on Linux platform: LinuxAgent.AzureSecurityCenter.


Module 1:
1.  On the **Information Protection** tile, you can see a list of your resources which have data which has been classified through [Azure Purview](https://azure.microsoft.com/en-us/services/purview/). 


14.	From the filter pane, select **Workload Protection** and value **On**. On the **Resource Group** select **asclab**. From the top menu bar, click on **Download CSV report**. You will get a snapshot to work on it offline already filtered. You can also right click on any of the resource and upgrade to Workload Protections plan (when applicable).
15.	From the top menu, click on **open query**. This will open up the resource graph explorer blade, click on **Run Query**. You should now have the same list of resources and columns like in the previous step. This query can be editable for your needs and here it gets very powerful.
16.	Save the query for later use by clicking on **Save as** from the top menu. You can use it to create periodic reports. Name the report as *asc-filtered-query* and select **save**.



Module 4:
### Exercise 4: Creating your own benchmark!


Once you create your custom initiative, Microsoft Defender for Cloud allows you to add it as security policy and which provides two main benefits:
* Having security requirements represent as custom recommendations under the recommendation list.
* Having a way to track compliance status using regulatory compliance dashboard.

Navigate to Azure Policy blade. You can also select this [link](https://portal.azure.com/#blade/Microsoft_Azure_Policy/PolicyMenuBlade/Overview).

1.	From the left pane, select **Definitions**.
2.	From the top menu, select **+ initiative definition** to create a new policy set definition.
3.	On the Basics tab, select a **scope as a location for the new definition**. The recommended approach is to select management groups if they have been assigned but in our scenario select your subscription "Azure subscription 1" as the scope.
4.	Select a name, for example: **Custom Benchmark**.
5.	Provide an informative description so others can be clear on what is the purpose of this new security policy.
6.	Select **Category**. You can decide to use existing one (for example: Microsoft Defender for Cloud) or to create your own one. *The recommended approach is to use a custom one so you can quickly filter policy definitions and initiatives when needed (for example: Contoso)*.
7.	Select **Version** number. Each policy definition and initiative contain a version in its metadata section. You can decide to have major versions (1.0), minor version (1.1) and so.  Click **Next**.
8.	Click **Groups**, to define your groups and subgroups to be used in your initiative. To add a new group, click **Create Group**.
9.	Create a new group, for this example we will call **Group 1**, select a subgroup, **Sub-group1** and provide a description. Please aware to the additional metadata which can be used as well. The location of the policyMetadata object that has additional details about the control and compliance domain. Click **Save** to create the new group.
10.	Repeat the previous step to create additional group, for example: Group 2
11.	Now you should have two groups to help you organize your policies within the initiative.
12.	Click on the **Policies** tab. Here you can add policy definitions, both built-in and custom. Click Add policy definition(s). Select your desired polices, if you create a benchmark, you can also leverage existing policy definitions from **Microsoft managed** tab. For example, you can choose the following policies and select Add:
    -	Audit virtual machines without disaster recovery configured
    -	Audit VMs that do not use managed disks
13.	Each policy on the list, has its definition name, reference ID and the associated group. However, you do need to define a group for each policy. To do so, click on the **…** to open the context menu and select **Edit groups**.
14.	Make sure all policies are associated to a group. Please notice that policies can be associated to multiple groups.
15.	You can assign policy and initiative parameters to be used during the assignment process. Skip this section and click on Review + Create to validate your settings. Then, click on Create.
16.	You should now see your new initiative listed – **Custom Benchmark** along with the additional metadata (scope, category, etc.)
![Regulatory compliance assessment and standards](../Images/lab4rc5.gif?raw=true)
17.	To assign your new security policy, open **Microsoft Defender for Cloud blade**.
18.	From the left navigation pane, click on **Environment Settings**, choose your subscription.
19.	Under **Policy settings**, click on **Security policy**.
20.	On **Security policy** page, scroll down to Your custom initiatives and select **Add a custom initiative**. 
21.	On **Add custom initiative**, your new standard should be listed there, so you can click on **Add** to assign to it. Once assigned, it will be listed as a recommendation in the Recommendations blade and be added in the Regulatory Compliance dashboard.
22.	Follow the **on-screen instructions to assign it on the desired scope**. If you decided to include parameters in your initiative, now you should be able to fulfill them. Click **Review + create** to start the validation process and then **Create**.
23.	Now your new security benchmark is displayed in regulatory compliance along with the built-in regulatory standards.




[**Module 14 – Configuring Azure ADO Connector in Defender for DevOps (L200)**](./Modules/Module%2014-Config%20Azure%20ADO%20in%20DfD.md)
- [Preparing the environment](./Modules/Module%2014-Config%20Azure%20ADO%20in%20DfD.md#exercise-1-preparing-the-environment)
- [Creating an Azure ADO Trial Subscription](./Modules/Module%2014-Config%20Azure%20ADO%20in%20DfD.md#exercise-2-creating-an-azure-ado-trial-subscription)
- [Configuring Azure ADO Connector](./Modules/Module%2014-Config%20Azure%20ADO%20in%20DfD.md#exercise-3-configuring-azure-ado-connector)
- [Configure the Microsoft Security DevOps Azure DevOps Extension](./Modules/Module%2014-Config%20Azure%20ADO%20in%20DfD.md#exercise-4-configure-the-microsoft-security-devops-azure-devops-extension)
- [Install Free extension SARIF SAST Scans Tab](./Modules/Module%2014-Config%20Azure%20ADO%20in%20DfD.md#exercise-5-install-free-extension-sarif-sast-scans-tab)
- [Configure your pipeline using YAML](./Modules/Module%2014-Config%20Azure%20ADO%20in%20DfD.md#exercise-6-configure-your-pipeline-using-yaml)