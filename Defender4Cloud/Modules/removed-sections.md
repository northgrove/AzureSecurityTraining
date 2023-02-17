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




[**Module 14 – Configuring Azure ADO Connector in Defender for DevOps (L200)**](./Modules/Module%2014-Config%20Azure%20ADO%20in%20DfD.md)
- [Preparing the environment](./Modules/Module%2014-Config%20Azure%20ADO%20in%20DfD.md#exercise-1-preparing-the-environment)
- [Creating an Azure ADO Trial Subscription](./Modules/Module%2014-Config%20Azure%20ADO%20in%20DfD.md#exercise-2-creating-an-azure-ado-trial-subscription)
- [Configuring Azure ADO Connector](./Modules/Module%2014-Config%20Azure%20ADO%20in%20DfD.md#exercise-3-configuring-azure-ado-connector)
- [Configure the Microsoft Security DevOps Azure DevOps Extension](./Modules/Module%2014-Config%20Azure%20ADO%20in%20DfD.md#exercise-4-configure-the-microsoft-security-devops-azure-devops-extension)
- [Install Free extension SARIF SAST Scans Tab](./Modules/Module%2014-Config%20Azure%20ADO%20in%20DfD.md#exercise-5-install-free-extension-sarif-sast-scans-tab)
- [Configure your pipeline using YAML](./Modules/Module%2014-Config%20Azure%20ADO%20in%20DfD.md#exercise-6-configure-your-pipeline-using-yaml)