# install_software.ps1

# Download and install Microsoft Visual C++ Redistributable
Invoke-WebRequest -Uri "https://aka.ms/vs/17/release/vc_redist.x64.exe" -OutFile "C:\\vc_redist.x64.exe"
Start-Process "C:\\vc_redist.x64.exe" -ArgumentList "/install", "/quiet", "/norestart" -Wait

# Download Java
Invoke-WebRequest -Uri "https://javadl.oracle.com/webapps/download/AutoDL?BundleId=245384_67b5dc5d9ff84e1f8e35d4e9248d91c4" -OutFile "C:\\java.exe"
Start-Process "C:\\java.exe" -ArgumentList "/s" -Wait

# Download SQL Anywhere
Invoke-WebRequest -Uri "https://help.sap.com/docs/SUPPORT_CONTENT/sqlany/3362971128.html" -OutFile "C:\\sqlany_setup.exe"
Start-Process "C:\\sqlany_setup.exe" -ArgumentList "/silent" -Wait

# Cleanup
Remove-Item "C:\\vc_redist.x64.exe"
Remove-Item "C:\\java.exe"
Remove-Item "C:\\sqlany_setup.exe"
