<#
.SYNOPSIS
    Adiciona um novo Domain Controller a um domínio existente.
#>
$Domain = "lab.local"
$Credentials = Get-Credential

Write-Host "--- Instalando Role AD DS ---" -ForegroundColor Cyan
Install-WindowsFeature -Name AD-Domain-Services -IncludeManagementTools

Write-Host "--- Iniciando Replicação do Domínio: $Domain ---" -ForegroundColor Yellow
Install-ADDSDomainController `
    -DomainName $Domain `
    -Credential $Credentials `
    -InstallDns:$true `
    -CreateDnsDelegation:$false `
    -DatabasePath "C:\Windows\NTDS" `
    -LogPath "C:\Windows\NTDS" `
    -SysvolPath "C:\Windows\SYSVOL" `
    -NoRebootOnCompletion:$false `
    -Force:$true
