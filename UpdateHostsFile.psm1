# Script Modules
# In the $Env:PSModulePath, create a folder named AscriptName, and put AscriptName.psm1 in it.
# run sudo apt-get install linux-azure to get get-vm more details about vm. then reboot
# get-vm | select -ExpandProperty networkadapters | select vmname, macaddress, switchname, ipaddresses
Function Update-Hosts-File {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $false,
            HelpMessage = "new IP to upldate.")] 
        [string]$ipv4)

    BEGIN {
        $HostsFile = "C:\Windows\System32\Drivers\etc\hosts"
        if (!$ipv4) {
            $ipv4 = get-vm | Select-Object -ExpandProperty networkadapters | 
            Select-Object -ExpandProperty ipaddresses | 
            Where-Object { $_ -match "^\d+\.\d+\.\d+\.\d+$" }
        }
        "detected ip address is: $ipv4" | Write-Host
    }
    PROCESS {
        $Content = Get-Content -Path $HostsFile | ForEach-Object -Process {
            if ($_ -match "local-hyper-v") { $ipv4 + " " + "local-hyper-v" } else { $_ }
        }
        # $Content | Write-Host
        # $ipv4 | Write-Host
        Set-Content -Path $HostsFile -Value $Content
    }
    END {}
}
