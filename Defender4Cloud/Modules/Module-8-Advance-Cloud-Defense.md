# Module 8 – Enhanced Security

<p align="left"><img src="../Images/asc-labs-advanced.gif?raw=true"></p>

#### 🎓 Level: 300 (Advanced)
#### ⌛ Estimated time to complete this lab: 60 minutes

## Objectives
In this exercise, you will understand how to use just-in-time (JIT) for virtual machines to reduce your attack surface. Moreover, you will understand the benefits of file integrity monitoring (FIM).

### Exercise 1: Using JIT to reduce attack surface

1.	From Microsoft Defender for Cloud sidebar, click on **Workload Protections**.
2.	On the Advanced protection part at the bottom, click on **Just-in-time VM access** (You should see 2 unprotected status).

![Advanced protection options](../Images/asc-defender-advanced-protection-jit.gif?raw=true)

3.	On the Just-in-time VM access page, select the **Not configure** tab. You should see at least two virtual machines listed: `asclab-linux` and `asclab-win`.
4.	Select **asclab-win** and then click on the **Enable JIT on 1 VM** button.

![Enable JIT on Windows VM](../Images/asc-enable-jit-win-vm.jpg?raw=true)

5.	On the JIT VM access configuration, keep just the **3389 (RDP) port** and delete others.  
![JIT VM access configuration](../Images/asc-jit-vm-access-config.gif?raw=true)
6.	Click **Save** to apply the VM access configuration.
7.	Review the **Configured** tab, now you should see your VM configured: `asclab-win`.
8.	On the Azure portal sidebar, click on **Virtual Machines**.
9.	Click on **asclab-win**.
10.	From the top menu, click on **Connect** button and then select **RDP**.

![Windows VM - Connect RDP](../Images/asc-win-vm-connect-rdp.gif?raw=true)

11.	On the Connect page, request JIT access. On the **Source IP**, select **My IP** and then click on **Request access**. You should now see the following message: *Download file*.

![](../Images/lab8download.gif?raw=true)
12.	Try to connect again to validate your JIT access to the VM. Use the same file you downloaded previously.
13.	Now you should get the prompt for the local admin credentials. **Type your username and password** and click **OK**.
14.	You **are now connected to asclab-win** server. Close the remote control session/log off.


### Exercise 2: Connect using Azure Bastion
> ! NB ! Azure Bastion will add additional cost on your lab subscription
Azure Bastion allows you to connect to the VM, with RDP or SSH, from the Azure portal, embedded in a browser window. This will allow you to have Azure AD authenticate the session, with all the integrated security potecting it and you can control who are allowed to connect with Azure RBAC.

1. On VM Blade, choose the connect page and the Bastion tab.
2. Click on **Use Bastion*
3. Click on **Deploy Bastion** / **Deploy Bastion using standards**
4. Wait for the Bastion service to be depoyed (this will take some minutes).
5. When ready, type in the username and password for the VM an click **connect**
6. (the previouse excersice JIT NSG rule my interfere with this connection, in case: delete the JIT rdp rule from the network tab on the sidebar)


### Exercise 3: Adaptive Application Control

Application control helps you deal with malicious and/or unauthorized software, by allowing only specific applications to run on your machines.

1.	From Microsoft Defender for Cloud sidebar, click on **Workload Protections**.
2.	On the Advanced protection part at the bottom, click on **Adaptive application control**.

![](../Images/lab8aac.gif?raw=true)
3.	The Adaptive application controls page opens with your VMs grouped into the following tabs: Configured, Recommended and No recommendations.
4.	Click on the **Recommended** tab.
5.  Click on one of the "Reviewgroup", notify the recommended applications who is detected on the machine. Click **Audit**
5.	If this tab does not contain any group yet, it means that Microsoft Defender for Cloud needs at least two weeks of data to define the unique recommendations per group of machines.

### Exercise 4: File Integrity Monitoring

File integrity monitoring (FIM), also known as change monitoring, examines operating system files, Windows registries, application software, Linux system files, and more, for changes that might indicate an attack.
It maps the current state of these items with the state during the previous scan and alerts you if suspicious modifications have been made. To enable FIM, follow the instructions below:

1.	From Microsoft Defender for Cloud sidebar, click on **Workload Protections**.
2.	On the Advanced protection part at the bottom, click on **File Integrity Monitoring** tile.
3.	On the FIM configuration page, select the Log Analytics workspace **asclab-la-xxx**.
![](../Images/mdfc-fim.png?raw=true)
4.	On the Enable FIM, **review the default recommended settings** for Windows files, Registry and Linux files.
5.	Click on **Enable File Integrity Monitoring** button.

![](../Images/mdfc-enablefim.png?raw=true)

You'll now be able to track changes to files in resource associated with the log analytics workspace.

![](../Images/mdfc-fimtrack.png?raw=true)



### Continue with the next lab: [Module 13 – Governance](../Modules/Module-13-Governance.md)