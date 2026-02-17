# 🏛️ Active Directory Lab Automation (Infra-as-Code)

Este repositório contém um conjunto de scripts **PowerShell** desenvolvidos para automatizar a criação e configuração de um ambiente de domínio (Active Directory) do zero. Ideal para profissionais de TI que precisam de agilidade na montagem de laboratórios de teste ou ambientes de desenvolvimento.

## 🎯 Objetivo do Projeto
Demonstrar como a mentalidade de **SRE** e a automação de infraestrutura podem ser aplicadas desde a base. Em vez de realizar dezenas de cliques no Server Manager, utilizamos scripts para garantir um **Domain Controller (DC)** configurado de forma idêntica e rápida.

---

## 📂 Conteúdo do Toolkit

O processo é dividido em três etapas lógicas para facilitar o aprendizado e a execução:

1. **[01-Install-ADDS-Role.ps1](./01-Install-ADDS-Role.ps1)**: Prepara o Windows Server instalando os binários necessários para o serviço de domínio e as ferramentas de RSAT.
2. **[02-Deploy-NewForest.ps1](./02-Deploy-NewForest.ps1)**: Promove o servidor a Domain Controller, criando uma nova floresta com parâmetros de segurança e caminhos de banco de dados (NTDS) padronizados.
3. **[03-Initial-Setup-Lab.ps1](./03-Initial-Setup-Lab.ps1)**: (Opcional) Cria a estrutura inicial de Unidades Organizacionais (OUs), Grupos e Usuários de teste para começar os trabalhos imediatamente.

---

## 🚀 Como Utilizar

### 1. Pré-requisitos
* Um Windows Server (2016, 2019 ou 2022) recém-instalado.
* Endereço IP estático configurado no servidor.
* Executar o PowerShell como Administrador.

### 2. Passo a Passo
Clone o repositório e execute os scripts na ordem numérica:

```powershell
# Etapa 1: Instalação dos binários
.\01-Install-ADDS-Role.ps1

# Etapa 2: Promoção do Domínio (O servidor irá reiniciar automaticamente)
.\02-Deploy-NewForest.ps1 -DomainName "lab.local" -NetbiosName "LAB"

# Etapa 3: (Após o reboot) Criação de OUs e Usuários
.\03-Initial-Setup-Lab.ps1
