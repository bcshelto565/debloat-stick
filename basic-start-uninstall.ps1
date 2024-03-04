#grabs list of applications installed
Get-WmiObject -Class Win32_Product | Select-Object -Property Name

#map a variable to match the location of the bloat
$bloatApp = Get-WmiObject -Class Win32_Product | Where-Object{$_.Name -eq "Bloat App"}

#uninstall the app using the basic uninstall command and the variable name
$bloatApp.Uninstall()

#sometimes powershell doesn't grab the application with the WmiObject so we need to search using Get-Package
Get-Package -Provider Programs -IncludeWindowsInstaller -Name "Bloat App Launcher"

#use the uninstall-package cmdlet to get rid of packages that are found
Uninstall-package -Name "Bloat App Launcher"

#we will need to use this basic script structure to go through and iterate on a supplied list of bloatware applications and packages
#it would be good to find which bloatware are installed under an application type and which will be package type
#knowing where the apps are installed would speed up the scripts uninstall structure by miles
