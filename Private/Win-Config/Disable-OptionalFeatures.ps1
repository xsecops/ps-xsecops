# Remove Unwanted/unnecessary Windows Optional Features
DISM /online /disable-feature /featurename:Microsoft-Windows-Printing-PrintToPDFServices-Package /norestart
DISM /online /disable-feature /featurename:Microsoft-Windows-Printing-XPSServices-Package /norestart
DISM /online /disable-feature /featurename:Xps-Foundation-Xps-Viewer /norestart