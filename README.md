# Powershell Script - GET-CIDR-Objects-From-URL

Get all CIDR objects from URL, e.g. all [Citrix Files Public Endpoints, formerly ShareFile.](https://support.citrix.com/article/CTX234446)

CIDR are Classless Internet Domain Routing (CIDR) blocks and are explained in more detail here in the [link].(https://devblogs.microsoft.com/premier-developer/understanding-cidr-notation-when-designing-azure-virtual-networks-and-subnets/)

The output file will be created in the source folder. 

## Running the scripts

You can run the script locally, but an Internet connection is required. 

### GET-CIDR-Objects-From-URL.ps1

```
.\GET-CIDR-Objects-From-URL -URL "https://website.com" -outoutfile "output.txt"
```