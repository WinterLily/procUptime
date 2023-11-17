# ██████╗ ██████╗  ██████╗  ██████╗██╗   ██╗██████╗ ████████╗██╗███╗   ███╗███████╗
# ██╔══██╗██╔══██╗██╔═══██╗██╔════╝██║   ██║██╔══██╗╚══██╔══╝██║████╗ ████║██╔════╝
# ██████╔╝██████╔╝██║   ██║██║     ██║   ██║██████╔╝   ██║   ██║██╔████╔██║█████╗  
# ██╔═══╝ ██╔══██╗██║   ██║██║     ██║   ██║██╔═══╝    ██║   ██║██║╚██╔╝██║██╔══╝  
# ██║     ██║  ██║╚██████╔╝╚██████╗╚██████╔╝██║        ██║   ██║██║ ╚═╝ ██║███████╗
# ╚═╝     ╚═╝  ╚═╝ ╚═════╝  ╚═════╝ ╚═════╝ ╚═╝        ╚═╝   ╚═╝╚═╝     ╚═╝╚══════╝
#                                                                                  
# By WinterLily 
#
# https://github.com/WinterLily/procUptimes
#
# This script prompts the user to enter a string to identify a process name.
# It then continuously checks the uptime of the process and logs the uptime information to a file.

$procName = Read-Host -Prompt "Enter a string to identify the process name"

while ($true) {
    $procUptimes = Get-Process | Select name, starttime | Select-String $procName -ErrorAction SilentlyContinue

    if ($procUptimes) {
        $date = Get-Date
        Add-Content -Path "serviceUptimes.log" -Value $date
        Add-Content -Path "serviceUptimes.log" -Value $procUptimes
    }

    Start-Sleep -Seconds 10
}
