Import-Module ActiveDirectory

$Domain="@betokam.local"

$NewUsersList=Import-CSV -Delimiter ';' "\\SERVER2\Scripts\AddADUsers.csv"

ForEach ($User in $NewUsersList) {

$FullName=$User.FullName
$SamAccountName=$User.SamAccountName
$Department=$User.department
$Description=$User.description
$givenName=$User.givenName
$title=$User.title
$telephoneNumber=$User.telephoneNumber
$SamAccountName=$User.SamAccountName
$sn=$User.sn
$userPrincipalName=$User.sAMAccountName+$Domain
$ChangePasswordAtLogon = $User.ChangePasswordAtLogon
$UserOu=$User.PathOU
$userPassword=$User.Password
$expire=$null

New-ADUser -PassThru -Path $UserOu -Enabled $True -ChangePasswordAtLogon $True -AccountPassword (ConvertTo-SecureString $userPassword -AsPlainText -Force) -Description $Description -CannotChangePassword $False -Department $Department -title $title -OfficePhone $telephoneNumber -DisplayName $FullName -GivenName $givenName -Name $FullName -SamAccountName $SamAccountName -Surname $sn -UserPrincipalName $userPrincipalName

}