#
# New-ADUser.ps1
#

<# 
	Created by Kristopher Roy
	Created on 20Dec2019
	Modified on 23Dec2019
	Purpose - Created to coexist with a web front end to expidite the process of creating user accounts
#>

Import-Module activedirectory

#Get the user accounts to create
$filelocation = "\\server\share\"
$filename = "newusers.csv"
$users = import-csv $filelocation$filename

#loop through and create the user accounts
FOREACH($user in $users)
{
	$DC = $user.domaincontroller
	$DN = $user.FirstName+" "+$user.LastName
	$FN = $user.FirstName
	$LN = $user.LastName
	$Description = $user.Description
	$PW = $user.password
	$OU = $user.OU
	$SAM = $user.SAMAccountName
	$UPN = $user.UPN
	$title = $user.title
	$city = $user.city
	$state = $user.state
	$country = $user.country
	$office = $user.office
	new-aduser -server $DC -Name $DN -GivenName $FN -Surname $LN -SamAccountName $SAM -UserPrincipalName $UPN -Description $Description -Path $OU -AccountPassword (ConvertTo-SecureString $PW -AsPlainText -Force) -Enabled $true -ChangePasswordAtLogon $true -PasswordNeverExpires $False -title $title -city $city -state $state -country $country -office $office
}

<#
Available switches
   [-WhatIf]
   [-Confirm]
   [-AccountExpirationDate <DateTime>]
   [-AccountNotDelegated <Boolean>]
   [-AccountPassword <SecureString>]
   [-AllowReversiblePasswordEncryption <Boolean>]
   [-AuthenticationPolicy <ADAuthenticationPolicy>]
   [-AuthenticationPolicySilo <ADAuthenticationPolicySilo>]
   [-AuthType <ADAuthType>]
   [-CannotChangePassword <Boolean>]
   [-Certificates <X509Certificate[]>]
   [-ChangePasswordAtLogon <Boolean>]
   [-City <String>]
   [-Company <String>]
   [-CompoundIdentitySupported <Boolean>]
   [-Country <String>]
   [-Credential <PSCredential>]
   [-Department <String>]
   [-Description <String>]
   [-DisplayName <String>]
   [-Division <String>]
   [-EmailAddress <String>]
   [-EmployeeID <String>]
   [-EmployeeNumber <String>]
   [-Enabled <Boolean>]
   [-Fax <String>]
   [-GivenName <String>]
   [-HomeDirectory <String>]
   [-HomeDrive <String>]
   [-HomePage <String>]
   [-HomePhone <String>]
   [-Initials <String>]
   [-Instance <ADUser>]
   [-KerberosEncryptionType <ADKerberosEncryptionType>]
   [-LogonWorkstations <String>]
   [-Manager <ADUser>]
   [-MobilePhone <String>]
   [-Name] <String>
   [-Office <String>]
   [-OfficePhone <String>]
   [-Organization <String>]
   [-OtherAttributes <Hashtable>]
   [-OtherName <String>]
   [-PassThru]
   [-PasswordNeverExpires <Boolean>]
   [-PasswordNotRequired <Boolean>]
   [-Path <String>]
   [-POBox <String>]
   [-PostalCode <String>]
   [-PrincipalsAllowedToDelegateToAccount <ADPrincipal[]>]
   [-ProfilePath <String>]
   [-SamAccountName <String>]
   [-ScriptPath <String>]
   [-Server <String>]
   [-ServicePrincipalNames <String[]>]
   [-SmartcardLogonRequired <Boolean>]
   [-State <String>]
   [-StreetAddress <String>]
   [-Surname <String>]
   [-Title <String>]
   [-TrustedForDelegation <Boolean>]
   [-Type <String>]
   [-UserPrincipalName <String>]
#>