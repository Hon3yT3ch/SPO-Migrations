#1
$siteurl = "https://yourtenant.sharepoint.com/sites/CAT"                
#2
$listname = "3rd Library"          
#3
$access = "Contribute" 
#4
$Folders = Import-Csv "D:\Scripts\SPO\UserFolders.csv"    


 #----------START OF SCRIPT DO NOT MODIFY----------#
 connect-PnPOnline –Url $siteurl –Credentials (Get-Credential)
 foreach ( $entry in $Folders )
 {

$foldername = $entry.name
$emailaddress = $entry.EmailAddress


#Create Folder
Add-PnPFolder -Name $foldername -Folder $listname 

#get folder properites from list
$listItem = Get-PnPListItem -List $listname -Query "<View><Query><Where><Eq><FieldRef Name='Title'/><Value Type='Text'>$foldername</Value></Eq></Where></Query></View>"

Write-Host "setting folder up for $foldername"

#set permissions on the folder
Set-PnPListItemPermission -List $listname -Identity $listItem -User $emailaddress -AddRole $access -ClearExisting -addmember  

}

 #----------END OF SCRIPT DO NOT MODIFY----------#