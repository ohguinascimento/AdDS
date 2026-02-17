<#
.SYNOPSIS
    Instala a Role de Active Directory Domain Services (AD DS).
.DESCRIPTION
    Script para o blog do Guilherme: Preparando o servidor para se tornar um DC.
#>

Write-Host "--- Instalando a Role de AD DS e Ferramentas de Gerenciamento ---" -ForegroundColor Cyan

$Feature = Install-WindowsFeature -Name AD-Domain-Services -IncludeManagementTools

if ($Feature.Success) {
    Write-Host "[OK] Role instalada com sucesso. Pronto para promover o domínio." -ForegroundColor Green
} else {
    Write-Error "[ERRO] Falha na instalação da Role."
}
