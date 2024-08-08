#Script Create-TaskInstallAppX.ps1
#The script was created to install Satispay. Please modify it accordingly.

#Preparazione della cartella per lo script e copia del file
If (!(Test-Path -Path C:\Scripts))
{
    New-Item -ItemType directory -Path C:\Scripts
}

New-PSDrive -Name S -PSProvider FileSystem -Root "\\server\folder\Satispay" -Credential $using:creds

Copy-Item -Path "S:\Install-SatispayAppX.ps1" -Destination C:\Scripts -Force

#Selezione dell'utente loggato in console per l'esecuzione del task
$user = (Get-CimInstance -ClassName Win32_ComputerSystem | Select-Object username).username

$computer = $env:COMPUTERNAME

#Impostazione dell'ora di esecuzione del task a +1 minuto dall'esecuzione dello script
$time = (Get-Date).AddMinutes(1).ToString('HH:mm')

#Creazione del task schedulato
schtasks /create /s $computer /tn "Install-Satispay" /sc once /tr "powershell.exe -ExecutionPolicy bypass -WindowStyle hidden -file C:\Scripts\Install-SatispayAppX.ps1" /st $time /ru $user
