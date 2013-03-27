Description
===========
Installs/Configures pgp and ssl cerfiticates from databags

Usage
=====

include_recipe "datafiles" in order to use definitions

Example:

	copy_ssl "mycertificate" do
		targetdir "#{node['apache']['dir']}/ssl/"
	end

This will look for databag item with id "mycertificate" in databag "ssl" and puts its contents to file in apache dir /ssl/mycertificate.cer and /ssl/mycertificate.keys

Example of databag item:

NB! Each line of certificat should end with \\\\n

{
      "id": "mycertificate"
      "key": "-----BEGIN RSA PRIVATE KEY-----\\nMIIEpQIBAAKCAQEA+GKNHCWxUHYCjkUwUR3hXMFitPGz6V5Ui0DxfdJcQ8dIUZ8h\\nxtp9sESLArP0QFk70nAsBoy+5HvPhwQyu2zAbfQhVa4z6dvKGmJjiG3bIoXCXNdN\\BHbwySci2NSLXkEkNg9Q9XMyL4=\\n-----END RSA PRIVATE KEY-----",

      "cer": "-----BEGIN CERTIFICATE-----\\nMIIE5zCCA8+gAwIBAgIDBHolMA0GCSqGSIb3DQEBBQUAMGExCzAJBgNVBAYTAlVT\\nMRYwFAYDVQQKEw1HZW9UcnVzdCBJbmMuMR0wGwYDVQQLExREb21haW4gVmFsaWRh\\ndGVkIFNTTDEbMBkGA1UEAxMSR2VvVHJ1c3QgRFYgU1NMIENBMB4XDTEyMDYxODIy\\nMjUzOVoXDQGCCsGAQUFBzAB\\nhhhodHRwOi8vb2NzcC5nZW90cnVzdC5jb20wDQYJKoZIhvcNAQEFBQADggEBADOR\\nNxHbQPnejLICiHevYyHBWeUz12OYjf+xLQ=\\n-----END CERTIFICATE-----"
}