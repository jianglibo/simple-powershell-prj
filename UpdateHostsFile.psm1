# Script Modules
# In the $Env:PSModulePath, create a folder named AscriptName, and put AscriptName.psm1 in it.
Function Update-Hosts-File {
    [CmdletBinding()]
    param (
    [Parameter(Mandatory=$true,
                HelpMessage="new IP to upldate.")] 
    [string]$ipv4)

    BEGIN {
        $HostsFile = "C:\Windows\System32\Drivers\etc\hosts"
    }
    PROCESS {
        $Content = Get-Content -Path $HostsFile | ForEach-Object -Process {
            if ($_ -match "local-hyper-v") {$ipv4 + " " + "local-hyper-v"} else {$_}
        }
        # $Content | Write-Host
        Set-Content -Path $HostsFile -Value $Content
    }
    END {}
}
