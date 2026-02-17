# Cria uma Unidade Organizacional (OU) para o Laboratório
New-ADOrganizationalUnit -Name "Labs_Users" -Path "DC=lab,DC=local"

# Cria um usuário de teste
$UserPass = ConvertTo-SecureString "SenhaPadrao123!" -AsPlainText -Force
New-ADUser -Name "Guilherme SRE" `
           -SamAccountName "guilherme.sre" `
           -UserPrincipalName "guilherme.sre@lab.local" `
           -AccountPassword $UserPass `
           -Enabled $true `
           -Path "OU=Labs_Users,DC=lab,DC=local"
