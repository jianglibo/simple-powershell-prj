# simple-powershell-prj

1. print out $Env:PSModulePath
2. in the folder displayed in the step 1, create a new folder named "UpdateHostsFile" and copy UpdateHostsFile.psm1 into it.
3. open powershell console as administrator.
4. run if need: Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process -Force
5. execute Update-Hosts-File cmdlet.
