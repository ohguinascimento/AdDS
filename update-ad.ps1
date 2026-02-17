<#
.SYNOPSIS
    Promove o servidor a Domain Controller de uma nova floresta.
.PARAMETER DomainName
    O FQDN do domínio (ex: lab.local ou guilherme.lab).
.PARAMETER NetbiosName
    O nome NetBIOS (ex: LAB).
#>

Param(
    [Parameter(Mandatory=$true)] [string]$DomainName,
    [Parameter(Mandatory=$true)] [string]$NetbiosName
)

# Definindo a senha de Modo de Restauração (DSRM) - Use uma senha segura!
$SafeModePassword = ConvertTo-SecureString "Laboratorio@2026" -AsPlainText -Force

Write-Host "--- Iniciando a criação da Floresta: $DomainName ---" -ForegroundColor Yellow

Install-ADDSForest `
    -CreateDnsDelegation:$false `
    -DatabasePath "C:\Windows\NTDS" `
    -DomainMode "WinThreshold" `
    -DomainName $DomainName `
    -DomainNetbiosName $NetbiosName `
    -ForestMode "WinThreshold" `
    -InstallDns:$true `
    -LogPath "C:\Windows\NTDS" `
    -NoRebootOnCompletion:$false `
    -SafeModeAdministratorPassword $SafeModePassword `
    -SysvolPath "C:\Windows\SYSVOL" `
    -Force:$true
