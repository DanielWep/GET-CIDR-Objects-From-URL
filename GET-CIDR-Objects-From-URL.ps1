param([Parameter(Mandatory=$true)] [string]$url="", [Parameter(Mandatory=$true)][string]$outputfile="")
# Powershell Script to find CIDR objects on web ressource
# (c) Daniel Weppeler 09.01.2021 v1.00 
# Twitter: https://twitter.com/_DanielWep 
# freeware license

$scriptdir = Split-Path $script:MyInvocation.MyCommand.Path
$regex = "^(\d{1,3}\.){3}\d{1,3}\/\d{1,2}$"
$output = New-Object System.Collections.ArrayList

try {
    $webrequest = Invoke-WebRequest $url
    $output = $webrequest.Content.toString() -split "[<br>]" | Select-String -Pattern $regex
    if ($null -ne $output) {
    $newfile = New-Object System.IO.StreamWriter ("$scriptdir\$outputfile", $false)
    ForEach ($o in $output){
        $newfile.WriteLine($o)
    }
    $newfile.Close()
    } else {
        Write-Host "Error: No CIDR objects were found, please check your URL parameter!" -ForegroundColor Red 
    }
} catch {
Write-Host "StatusCode:" $_.Exception.Response.StatusCode.value__ -ForegroundColor Red
Write-Host "StatusDescription:" $_.Exception.Response.StatusDescription -ForegroundColor Red
}