$siteurl = "https://tenant.sharepoint.com/sites/TestSite1"
Connect-PnPOnline –Url $siteurl –Credentials (Get-Credential)
Import-Module 

$listName = "Folder Automation";
$outputTemplateFileName = "template.xml";
$template = Get-PnPProvisioningTemplate -OutputInstance -Handlers Lists -Schema V202002
$listTemplate = $template.Lists | Where-Object { $_.Title -eq $listName }
$template.Lists.Clear()
$template.Lists.Add($listTemplate)
Save-PnPProvisioningTemplate -InputInstance $template -Out D:\filepath\$outputTemplateFileName