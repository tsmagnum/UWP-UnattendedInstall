#Script Install-SatispayAppX.ps1
#The script was created to install Satispay. Please modify it accordingly.

$packagePath = "\\server\folder\Satispay\D2E55FCB.SatispaySpot-Business_5.4.1.0_neutral_~_dng634rsnwf7y.AppxBundle"

#Installation
Add-AppxPackage -Path $packagePath

#Desktop shortcut creation
$TargetPath =  "shell:AppsFolder\D2E55FCB.SatispaySpot-Business_dng634rsnwf7y!App"
$ShortcutFile = "$Home\Desktop\Satispay.lnk"
$WScriptShell = New-Object -ComObject WScript.Shell
$Shortcut = $WScriptShell.CreateShortcut($ShortcutFile)
$Shortcut.TargetPath = $TargetPath
$Shortcut.Save()
