# 🔐 Matrix Audit - Sistema de Auditoria Linux

<div align="center">

![Matrix](https://img.shields.io/badge/Matrix-Themed-00ff00?style=for-the-badge)
![Linux](https://img.shields.io/badge/Linux-Audit-blue?style=for-the-badge)
![Bash](https://img.shields.io/badge/Bash-Script-red?style=for-the-badge)
![Security](https://img.shields.io/badge/Security-Monitoring-orange?style=for-the-badge)

*"Bem-vindo ao mundo real da auditoria de sistemas"*

</div>

## 📋 Índice

- [Sobre](#sobre)
- [Características](#características)
- [Pré-requisitos](#pré-requisitos)
- [Instalação](#instalação)
- [Uso](#uso)
- [Funcionalidades](#funcionalidades)
- [Configuração](#configuração)
- [Exemplos](#exemplos)
- [Troubleshooting](#troubleshooting)
- [Contribuição](#contribuição)
- [Licença](#licença)

## 🎯 Sobre

O **Matrix Audit** é um sistema avançado de auditoria para Linux que combina a estética icônica do filme Matrix com funcionalidades profissionais de monitoramento de segurança. O script oferece uma interface interativa completa para gerenciar o daemon de auditoria do Linux (auditd) com recursos avançados de análise e detecção de ameaças.

### 🎬 Experiência Visual

- **Digital Rain Effect**: Autêntico efeito de "chuva digital" com caracteres japoneses
- **Introdução Cinematográfica**: Sequência completa inspirada no filme Matrix
- **Interface Profissional**: Menu organizado com bordas e categorização clara

## ✨ Características

### 🔧 Controles Básicos
- Iniciar/parar/status do auditd
- Habilitação automática no boot
- Gerenciamento completo do serviço

### 📊 Gerenciamento de Regras
- Adicionar/remover regras de auditoria
- Regras de execução personalizadas
- Configuração de regras avançadas de segurança
- Recarregamento dinâmico de regras

### 🔍 Análise e Busca
- Busca por chaves e UIDs específicos
- Relatórios detalhados (geral, arquivos, logins)
- Análise avançada de logs com estatísticas
- Monitor em tempo real

### 🛡️ Segurança Avançada
- **Detecção de Ameaças**: Identificação de atividades suspeitas
- **Verificação de Integridade**: Checagem de arquivos críticos do sistema
- **Backup Automático**: Sistema de backup timestampado
- **Otimização de Performance**: Configurações otimizadas para auditd

## 📋 Pré-requisitos

### Sistema Operacional
- Linux (testado em Ubuntu, CentOS, RHEL, Debian)
- Kernel com suporte a auditoria habilitado

### Dependências
\`\`\`bash
# Pacotes necessários
sudo apt-get install auditd audispd-plugins  # Debian/Ubuntu
sudo yum install audit audit-libs           # CentOS/RHEL
\`\`\`

### Permissões
- **Root**: O script deve ser executado como root
- **SELinux**: Configuração adequada se habilitado

## 🚀 Instalação

### Método 1: Download Direto
\`\`\`bash
# Download do script
wget https://raw.githubusercontent.com/Thiago251/matrix-audit/main/matrix_audit_enhanced.sh

# Tornar executável
chmod +x matrix_audit_enhanced.sh

# Executar
sudo ./matrix_audit_enhanced.sh
\`\`\`

### Método 2: Clone do Repositório
\`\`\`bash
# Clonar repositório
git clone https://github.com/Thiago251/matrix-audit.git
cd matrix-audit

# Executar
sudo ./matrix_audit_enhanced.sh
\`\`\`

## 🎮 Uso

### Execução Básica
\`\`\`bash
sudo ./matrix_audit_enhanced.sh
\`\`\`

### Primeira Execução
1. **Efeito Matrix**: Aprecie a sequência de abertura com digital rain
2. **Menu Principal**: Navegue pelas 22 opções disponíveis
3. **Configuração Inicial**: Recomenda-se executar a opção 9 (Regras avançadas)

## 🔧 Funcionalidades

### 1. Controles Básicos (1-4)
| Opção | Função | Descrição |
|-------|--------|-----------|
| 1 | Iniciar auditd | Inicia o serviço de auditoria |
| 2 | Parar auditd | Para o serviço de auditoria |
| 3 | Status auditd | Mostra status atual do serviço |
| 4 | Habilitar no boot | Configura inicialização automática |

### 2. Gerenciar Regras (5-10)
| Opção | Função | Descrição |
|-------|--------|-----------|
| 5 | Listar regras | Exibe todas as regras ativas |
| 6 | Adicionar regra | Adiciona regra personalizada |
| 7 | Remover regra | Remove regra específica |
| 8 | Regras de execução | Adiciona regras para execução de comandos |
| 9 | Regras avançadas | Configura conjunto completo de regras de segurança |
| 10 | Recarregar regras | Recarrega regras do arquivo de configuração |

### 3. Análise e Busca (11-16)
| Opção | Função | Descrição |
|-------|--------|-----------|
| 11 | Buscar por chave | Busca eventos por chave específica |
| 12 | Buscar por UID | Busca eventos por usuário |
| 13 | Relatório geral | Relatório completo de auditoria |
| 14 | Relatório arquivos | Relatório de acesso a arquivos |
| 15 | Relatório logins | Relatório de tentativas de login |
| 16 | Análise avançada | Estatísticas detalhadas dos últimos 7 dias |

### 4. Segurança Avançada (17-22)
| Opção | Função | Descrição |
|-------|--------|-----------|
| 17 | Detecção de ameaças | Identifica atividades suspeitas |
| 18 | Verificar integridade | Verifica arquivos críticos do sistema |
| 19 | Monitor tempo real | Monitoramento em tempo real dos logs |
| 20 | Backup configurações | Cria backup timestampado das configurações |
| 21 | Otimizar performance | Aplica configurações otimizadas |
| 22 | Mostrar regras | Exibe regras persistentes |

## ⚙️ Configuração

### Arquivos de Configuração
\`\`\`bash
/etc/audit/auditd.conf          # Configuração principal
/etc/audit/rules.d/             # Regras persistentes
/var/log/audit/audit.log        # Log principal
/var/backups/audit/             # Diretório de backups
\`\`\`

### Regras Avançadas Incluídas
\`\`\`bash
# Arquivos críticos
-w /etc/passwd -p wa -k critical_files
-w /etc/shadow -p wa -k critical_files
-w /etc/sudoers -p wa -k critical_files

# Comandos perigosos
-a always,exit -F arch=b64 -S unlink,unlinkat -k dangerous_commands

# Escalação de privilégios
-w /bin/su -p x -k privilege_escalation
-w /usr/bin/sudo -p x -k privilege_escalation

# Conexões de rede
-a always,exit -F arch=b64 -S socket,connect -k network_connections
\`\`\`

## 📊 Exemplos

### Exemplo 1: Monitorar Arquivo Específico
\`\`\`bash
# Executar script
sudo ./matrix_audit_enhanced.sh

# Selecionar opção 6 (Adicionar regra)
# Arquivo: /etc/hosts
# Permissões: wa
# Chave: hosts_changes
\`\`\`

### Exemplo 2: Análise de Segurança Completa
\`\`\`bash
# 1. Configurar regras avançadas (opção 9)
# 2. Executar análise avançada (opção 16)
# 3. Verificar detecção de ameaças (opção 17)
# 4. Criar backup (opção 20)
\`\`\`

### Exemplo 3: Busca por Atividade Suspeita
\`\`\`bash
# Buscar por tentativas de escalação de privilégios
# Opção 11 -> Chave: privilege_escalation

# Buscar atividade de usuário específico
# Opção 12 -> UID: 1000
\`\`\`

## 🔍 Troubleshooting

### Problemas Comuns

#### 1. "auditd não está instalado"
\`\`\`bash
# Ubuntu/Debian
sudo apt-get update
sudo apt-get install auditd audispd-plugins

# CentOS/RHEL
sudo yum install audit audit-libs
\`\`\`

#### 2. "Permissão negada"
\`\`\`bash
# Executar como root
sudo ./matrix_audit_enhanced.sh

# Verificar permissões do arquivo
chmod +x matrix_audit_enhanced.sh
\`\`\`

#### 3. "Log de auditoria não encontrado"
\`\`\`bash
# Verificar se auditd está rodando
sudo systemctl status auditd

# Iniciar auditd se necessário
sudo systemctl start auditd
\`\`\`

#### 4. "Regras não persistem após reboot"
\`\`\`bash
# Salvar regras permanentemente
sudo augenrules --load

# Verificar arquivo de regras
sudo cat /etc/audit/rules.d/audit.rules
\`\`\`

### Logs de Debug
\`\`\`bash
# Verificar logs do sistema
sudo journalctl -u auditd

# Verificar configuração
sudo auditctl -s

# Testar regras
sudo auditctl -l
\`\`\`

## 🤝 Contribuição

### Como Contribuir
1. Fork o projeto
2. Crie uma branch para sua feature (`git checkout -b feature/AmazingFeature`)
3. Commit suas mudanças (`git commit -m 'Add some AmazingFeature'`)
4. Push para a branch (`git push origin feature/AmazingFeature`)
5. Abra um Pull Request

### Diretrizes
- Mantenha a estética Matrix
- Documente novas funcionalidades
- Teste em múltiplas distribuições Linux
- Siga as boas práticas de segurança

### Reportar Bugs
Use as [Issues do GitHub](https://github.com/Thiago251/matrix-audit/issues) para reportar bugs ou sugerir melhorias.

## 📄 Licença

Este projeto está licenciado sob a Licença MIT - veja o arquivo [LICENSE](LICENSE) para detalhes.

## 🙏 Agradecimentos

- Inspirado no filme "The Matrix" (1999)
- Comunidade Linux de segurança
- Desenvolvedores do auditd
- Contribuidores do projeto

## 📞 Suporte

- **Issues**: [GitHub Issues](https://github.com/Thiago251/matrix-audit/issues)
- **Documentação**: [Wiki do Projeto](https://github.com/Thiago251/matrix-audit/wiki)


---

<div align="center">

**"Não há colher"** - Neo

*Matrix Audit v2.0 - Sistema de Auditoria Linux*

</div>
