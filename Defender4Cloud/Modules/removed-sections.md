Exercise 4: Creating your own benchmark


Module 5: vulnerabilities
10.	Ensure the VM extension is deployed on the relevant machines:
    - From Azure Portal, open **Virtual Machines**.
    - Select **asclab-win**.
    - From the sidebar, click on **Extensions**.
    - Make sure to have `WindowsAgent.AzureSecurityCenter` extension installed and successfully provisioned.
    - Repeat the process for **asclab-linux** – you should expect to see a different name for the extension on Linux platform: LinuxAgent.AzureSecurityCenter.