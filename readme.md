# 🏛️ Active Directory Lab Automation: High Availability & Replication

Este repositório contém uma solução completa em **PowerShell** para o provisionamento automatizado de uma infraestrutura de Active Directory resiliente. O projeto foca na criação de uma floresta robusta com **replicação de Domain Controllers (DCs)**, eliminando pontos únicos de falha.

## 🎯 Visão do Projeto (Mentalidade SRE)
Em ambientes de missão crítica, a disponibilidade do Active Directory é vital. Este toolkit aplica conceitos de **Redundância e Site Reliability Engineering (SRE)** para garantir que a autenticação e a resolução de nomes (DNS) permaneçam activas, mesmo em caso de falha de um dos nós.

---

## 📂 Conteúdo do Toolkit

O fluxo de automação está dividido em etapas lógicas para suportar uma topologia de dois ou mais servidores:

1. **[01-Install-ADDS-Role.ps1](./01-Install-ADDS-Role.ps1)**: Instalação dos binários do AD DS e ferramentas de gestão em todos os servidores.
2. **[02-Deploy-NewForest.ps1](./02-Deploy-NewForest.ps1)**: Promoção do primeiro servidor (DC01) e criação da nova floresta.
3. **[03-Add-ReplicaDC.ps1](./03-Add-ReplicaDC.ps1)**: Promoção do segundo servidor (DC02) como réplica, estabelecendo a redundância do domínio.
4. **[04-Initial-Setup-Lab.ps1](./04-Initial-Setup-Lab.ps1)**: Configuração de OUs, Grupos e Utilizadores para o laboratório.

---

## 🚀 Guia de Implementação (Passo a Passo)

### Cenário Sugerido:
* **Servidor 01 (DC01):** IP Estático configurado.
* **Servidor 02 (DC02):** IP Estático configurado, apontando o DNS primário para o IP do Servidor 01.

### Execução:

#### No Servidor 01 (Criação da Floresta):
```powershell
# Instalar binarização
.\01-Install-ADDS-Role.ps1

# Criar a nova floresta
.\02-Deploy-NewForest.ps1 -DomainName "lab.local" -NetbiosName "LAB"
