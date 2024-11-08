[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

$logFile = "C:\install_log.txt"
$logMessage = "Start of installation process"
Write-Output $logMessage | Out-File -Append $logFile

function Log-Message {
    param([string]$message)
    Write-Output $message | Out-File -Append $logFile
}

Log-Message "Starting Visual C++ Redistributable installation..."
$vcUrl = "https://aka.ms/vs/17/release/vc_redist.x64.exe"
$vcInstaller = "C:\vc_redist.x64.exe"
Invoke-WebRequest -Uri $vcUrl -OutFile $vcInstaller
Log-Message "Visual C++ Redistributable installer downloaded."

Start-Process -FilePath $vcInstaller -ArgumentList "/install", "/quiet", "/norestart" -Wait
Log-Message "Visual C++ Redistributable installed."

Remove-Item -Path $vcInstaller -Force
Log-Message "Visual C++ Redistributable installer removed."

Log-Message "Starting Java installation..."
$javaUrl = "https://javadl.oracle.com/webapps/download/AutoDL?BundleId=245384_67b5dc5d9ff84e1f8e35d4e9248d91c4"
$javaInstaller = "C:\java.exe"
Invoke-WebRequest -Uri $javaUrl -OutFile $javaInstaller
Log-Message "Java installer downloaded."

Start-Process -FilePath $javaInstaller -ArgumentList "/s" -Wait
Log-Message "Java installed."

Remove-Item -Path $javaInstaller -Force
Log-Message "Java installer removed."

Log-Message "Starting SQL Anywhere installation..."
$sqlAnywhereUrl = "https://link_to_sql_anywhere_installer.exe"  # Replace with the actual URL to your SQL Anywhere installer
$sqlAnywhereInstaller = "C:\sqlany_setup.exe"
Invoke-WebRequest -Uri $sqlAnywhereUrl -OutFile $sqlAnywhereInstaller
Log-Message "SQL Anywhere installer downloaded."

Start-Process -FilePath $sqlAnywhereInstaller -ArgumentList "/silent" -Wait
Log-Message "SQL Anywhere installed."

Remove-Item -Path $sqlAnywhereInstaller -Force
Log-Message "SQL Anywhere installer removed."

Log-Message "All software installed and cleanup complete."
Write-Output "End of installation process" | Out-File -Append $logFile
