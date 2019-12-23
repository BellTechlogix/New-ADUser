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
$filelocation = \\server\share\newusers.csv
