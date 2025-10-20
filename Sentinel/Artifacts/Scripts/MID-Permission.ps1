param (
    [Parameter(Mandatory=$true)][string]$TenantID="provide the tenant ID",
    [Parameter(Mandatory=$true)][string]$DisplayNameOfMSI="Provide the Logic App name"
)

$GraphAppId = "00000003-0000-0000-c000-000000000000"
$PermissionNames = @('Directory.Read.All', 'Directory.ReadWrite.All', 'User.ReadWrite.All', 'User.Read.All')

 

 

# Install the module
if ((Get-Module -ListAvailable -Name AzureAD) -or (Get-Module -ListAvailable -Name AzureADpreview)) {
    Write-Host "Azure AD module exists"
} 
else {
    Write-Host "Need to install Azure AD module.."
    try {
        Install-Module AzureAD
    }
    catch {
        Write-host "installation of Azure AD powershell module failed."
        write-host "PS #> Install-Module AzureAD"
    }
}


write-host "Connecting to Azure AD tenant"
Connect-AzureAD -TenantId $TenantID

write-host "Finding the Logic App.."
$MSI = (Get-AzureADServicePrincipal -Filter "displayName eq '$DisplayNameOfMSI'")
write-host "Found $($msi.displayname) with appid: $($msi.appid)"
Start-Sleep -Seconds 10
$GraphServicePrincipal = Get-AzureADServicePrincipal -Filter "appId eq '$GraphAppId'"
write-host "Adding new permission: $PermissionNames"

foreach ($PermissionName in $PermissionNames) {

    $AppRole = $GraphServicePrincipal.AppRoles | Where-Object {$_.Value -eq $PermissionName -and $_.AllowedMemberTypes -contains "Application"}
    try {
        New-AzureAdServiceAppRoleAssignment -ObjectId $MSI.ObjectId -PrincipalId $MSI.ObjectId -ResourceId $GraphServicePrincipal.ObjectId -Id $AppRole.Id
    }
    catch {
        write-host "something went wrong..."
        write-host $_
        $erroroccured = $true
    }
    if (!$erroroccured) {write-host "Permission $PermissionName added"}
}

write-host "Done"
