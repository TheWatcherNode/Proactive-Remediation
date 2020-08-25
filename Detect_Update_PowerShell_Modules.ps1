#=============================================================================================================================
#
# Script Name:     Detect_Update_PowerShell_Modules.ps1
# Description:     Detect outdated PowerShell Module and update from PowerShell Gallery
# Notes:           The purpose of this script is to keep installed PowerShell Modules on IT Administrator Devices up to 
#                  date with the latest PowerShell Modules from the PowerShell Gallery
#
#=============================================================================================================================

# Define Variables
$Array = @(Get-InstalledModule)
$Green = 'Green'
$DarkRed = 'DarkRed'
$DarkCyan = 'DarkCyan'
$White = 'White'

   Foreach ($Module in $Array)
   
   {
     $ModuleCheck = Get-InstalledModule -name $Module.Name -ErrorAction SilentlyContinue
     $online = Find-Module -Name $module.name -Repository PSGallery -ErrorAction Stop   

     if ($ModuleCheck.version -EQ $online.Version) {
           Write-Host "Detected: "$Module.Name, "doesnt require an update as installed version" $Module.Version,"matches the latest online version" $online.Version -ForegroundColor $Green
          
          }
     else {
           Write-Host "Detected:"$Module.Name "Module", "is running an outdate version" $Module.Version, "Version"$online.Version, "is now available" -ForegroundColor $DarkRed
           exit 0
          }
          }