# Script below is from https://adamtheautomator.com/how-to-sign-powershell-script/
# Create a self-signed code signing certificate valid for 36 months.

$cert = New-SelfSignedCertificate -Subject MyCodeSigningCert -NotAfter (Get-Date).AddMonths(36) -Type CodeSigningCert

# Add the self-signed fake certificate to the computer's root certificate store.
## Create an object to represent the LocalMachine\Root certificate store.

 $rootStore = [System.Security.Cryptography.X509Certificates.X509Store]::new("Root","LocalMachine")
 
## Open the root certificate store for reading and writing.

 $rootStore.Open("ReadWrite")
 
## Add the certificate stored in the $cert variable.

 $rootStore.Add($cert)
 
## Close the root certificate store.

 $rootStore.Close()

# Add the self-signed fake certificate to the computer's trusted publishers certificate store.
## Create an object to represent the LocalMachine\TrustedPublisher certificate store.

 $publisherStore = [System.Security.Cryptography.X509Certificates.X509Store]::new("TrustedPublisher","LocalMachine")
 
## Open the TrustedPublisher certificate store for reading and writing.

 $publisherStore.Open("ReadWrite")
 
## Add the certificate stored in the $cert variable.

 $publisherStore.Add($cert)
 
## Close the TrustedPublisher certificate store.

 $publisherStore.Close()

# Confirm if the self-signed fake certificate exists in the computer's Personal certificate store

 Get-ChildItem Cert:\LocalMachine\My | Where-Object {$_.Subject -eq "CN=MyCodeSigningCert"}
 
# Confirm if the self-signed fake certificate exists in the computer's Root certificate store

 Get-ChildItem Cert:\LocalMachine\Root | Where-Object {$_.Subject -eq "CN=MyCodeSigningCert"}
 
# Confirm if the self-signed fake certificate exists in the computer's Trusted Publishers certificate store

 Get-ChildItem Cert:\LocalMachine\TrustedPublisher | Where-Object {$_.Subject -eq "CN=MyCodeSigningCert"}

# Get the code-signing certificate from the local computer's certificate store with the name *MyCert* and store it to the $codeCertificate variable.

$codeCertificate = Get-ChildItem Cert:\LocalMachine\My | Where-Object {$_.Subject -eq "CN=MyCodeSigningCert"}
echo ""
echo ""
echo "$codeCertificate"
echo ""
echo ""

# Sign the PowerShell script
# PARAMETERS:
# FilePath - Specifies the file path of the PowerShell script to sign, eg. C:\ATA\myscript.ps1.
# Certificate - Specifies the certificate to use when signing the script.
# TimeStampServer - Specifies the trusted timestamp server that adds a timestamp to your script's digital signature. Adding a timestamp ensures that your code will not expire when the signing certificate expires.

Set-AuthenticodeSignature -FilePath C:\path\MyEXE.exe -Certificate $codeCertificate -TimeStampServer http://timestamp.digicert.com
