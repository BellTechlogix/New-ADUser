#
# New-ADUser.ps1
#

<# 
	Created by Kristopher Roy
	Created on 20Dec2019
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
	$DN = $user.FirstName+" "+$user.LastName
	$FN = $user.FirstName
	$LN = $user.LastName
	$Description = $user.Description
	$PW = $user.password
	$OU = $user.OU
	$SAM = $users.SAMAccountName
	$UPN = 
	new-aduser -server $dc -Name $DN -GivenName $FN -Surname $LN -Description $Description -Path $OU -AccountPassword (ConvertTo-SecureString $PW -AsPlainText -Force) -Enabled $true -ChangePasswordAtLogon $true -PasswordNeverExpires $False
}
