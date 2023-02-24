# Module 4 - Regulatory Compliance

<p align="left"><img src="../Images/asc-labs-intermediate.gif?raw=true"></p>

#### 🎓 Level: 200 (Intermediate)
#### ⌛ Estimated time to complete this lab: 60 minutes

## Objectives
This exercise guides you through the current Microsoft Defender for Cloud policies, based on Azure Policy, and shows you where to enable or disable Microsoft Defender for Cloud polices.

### Exercise 1: Understanding Regulatory Compliance dashboard

1.	From **Microsoft Defender for Cloud main dashboard**, select **Regulatory Compliance** tile (this pilar is also available from the sidebar under Cloud Security).
2.	Regulatory Compliance dashboard opens. On this page, you can see the compliance standards currently assigned to your subscription.
3.	On the top strip, notice the number of **passed controls** for Azure Security Benchmark / Microsoft Cloud Security Benchmark.

### Exercise 2: Adding new standards

You can add additional industry standards (represented as compliance packages) such as IST SP 800-53 R4, SWIFT CSP CSCF-v2020, UK Official and more.

1.	From the top menu bar in Regulatory Compliance, select **Manage compliance policies**.
2.	Select a scope to assign the new package: **Azure subscription 1**.
3.  Select **Security policy** from the left sidebar.
3.	On the **Industry & regulatory standards** section, notice the out of the box standards. Click on **Add more standards**.
4.	On the **Add regulatory compliance standards**, locate the **Azure CIS 1.4.0** standard and select **Add**.
![Regulatory compliance assessment and standards](../Images/module4_addingnewstandards_addAzCIS_yl.png?raw=true)
5.	For scope, select azure subscription 1, and leave all other options as default.
6.	Click **Review + create** and then **Create**.
![Add CIS 1.1.0 (New) Standard](../Images/asc-azure-cis-new-standard.gif?raw=true)

> ❗ Important: <br>
> It will take a while until the change takes an effect (2-3 hours).

7.	**Azure CIS 1.4.0** should now be listed on the standards list.
   
### Exercise 3: Exploring a benchmark 
1.	From the top menu bar in Regulatory Compliance, select **Manage compliance policies** which can be found next to **Download report**, above the **Lowest compliance regulatory standards** tile.
2. Then select your subscription and choose **Security Policy** from the sidebar.
3.	On the **Industry & regulatory standards** section, notice the out of the box standards like Azure Security Benchmark, PCI DSS 3.2.1 and ISO 27001.
4.	Locate the **PCI DSS 3.2.1** standard and select **Enable**.
![Regulatory compliance assessment and standards](../Images/mdfc-pci.png?raw=true)
5. Select **yes** to the pop-up asking you to enable PCI DSS.
6.	**PCI DSS 3.2.1** should now be listed as enabled.

Once you have enabled PCI DSS 3.2.1, now we will explore a particular control included in it.

1. From the **regulatory compliance** page, select **PCI DSS 3.2.1.**. Notice the different compliance controls mapped to assessments.
![Regulatory compliance assessment and standards](https://user-images.githubusercontent.com/45104504/192821604-cdd9d2cc-1b1d-47a4-8336-ac1fd462e0a3.png)

2.	Click to open up **4. Encrypt transmission of cardholder data across open, public networks.**
3.	Click to open **control 4.1**
4.  Click to open **control 4.1.*.**
![Regulatory compliance assessment and standards](../Images/lab4rc2.gif?raw=true)
5.	Click to open **Secure transfer to storage accounts should be enabled.**
6.	In the new pane, tick the box for the unhealthy resource titled asclabXXXXXX, and select **Fix** at the bottom of the page. 
![Regulatory compliance assessment and standards](../Images/lab4rc3.jpg?raw=true)
7.	Then in the pop-up tab click Fix 1 resource. Your Storage account now has secure transfer enabled.
8.	Return to the dashboard. You can export regulatory standard compliance status as a PDF report or CSV file. From the top menu bar, select Download report.
9.	On the Report standard dropdown menu, select **PSI DSS 3.2.1** and **PDF**. Click **Download**
10. A local PDF file is now stored on your machine. Open the **PCI DSS 3.2.1 Compliance Report** and explore the compliance report – This report summarizes the status of those assessments on your environment, as they map to the associated controls.


### Exercise 4 Azure Audit Reports

Now in Microsoft Defender for Cloud, you can easily create & download Audit reports for Regulatory Compliance Standards.
1.	From Microsoft Defender for Cloud, select Regulatory Compliance from the sidebar
2.	Then click on Audit Reports found at the top of the page
![Regulatory compliance assessment and standards](../Images/lab4rc6.jpg?raw=true)
3.	Select PCI from the tabs, and download 2021 - Azure PCI 3DS 1.0 Package, and click download
![Regulatory compliance assessment and standards](../Images/lab4rc7.jpg?raw=true)
4.	Press download on the Privacy Notice pop-up that appears.
You now have the audit report downloaded.


### Exercise 5 Continuous Export & Compliance over time workbook

Compliance dashboard over time is a Workbook in Microsoft Defender for Cloud dedicated to tracking a subscription's compliance with the regulatory or industry standards applied to it.

You'll need to configure continuous export first to export data to a Log Analytics workspace:
1.	From Microsoft Defender for Cloud's sidebar, select **Environment Settings**.
2.	Select the subscription for which you want to configure the data export.
3.	From the sidebar of the settings page for that subscription, select **Continuous Export**.
4.	Click on the **Log Analytics workspace**, (which is the tab beside Event hub). Set the export enable to **On**.
5.	Check off box next to **Regulatory compliance** and choose **All standards selected**
6.	From the export frequency options, select both **Streaming updates** and **Snapshots (Preview)**.
7.	Select target workspace and the Resource Group to be those you created earlier.
9.	Select Save. You might get a message about Sentinel alerts connector already enabled. Click **Confirm**.
10.	Wait for the first snapshot to occur. 

![Regulatory compliance assessment and standards](../Images/lab4rc8.jpg?raw=true)

![Regulatory compliance assessment and standards](../Images/lab4rc9.jpg?raw=true)

![Regulatory compliance assessment and standards](../Images/lab4rc10.jpg?raw=true)

Compliance dashboard over time (read note 1 below if not working)
1.	Go to Microsoft Defender for Cloud, and from the left navigation pane, under the General section, press on the Workbooks button. 
2.	Select the Compliance Over Time Workbook
3.	For the workspace, select **asclab-la-XXXXXXXXXX** 
4.	For the subscription, select **Subscription 1**
5.	For the standard name, select **All**, and now you can see the workbook.
![Regulatory compliance assessment and standards](../Images/lab4rc11.jpg?raw=true)
>Note 1: You need to complete the previous exercise of setting up Continuous Export to the Log Analytics workspace for the Compliance Over Time Workbook to work.
>Note 2: If you see the error below, you will need to wait for a week for this workbook to populate with data through Continuous Export.
![Regulatory compliance assessment and standards](../Images/lab4rc12.gif?raw=true)







### Continue with the next lab: [Module 5 - Improving your Secure Posture](../Modules/Module-5-Improving-your-Secure-Posture.md)
