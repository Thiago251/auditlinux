#!/bin/bash
# ==========================================
# Script Matrix Aprimorado + Auditd
# Versão Melhorada com Digital Rain Effect
# ==========================================

AUDIT_LOG="/var/log/audit/audit.log"
BACKUP_DIR="/var/backups/audit"

# ===== EFEITO MATRIX DIGITAL RAIN =====
matrix_digital_rain() {
    local duration=8
    local cols rows
    cols=$(tput cols 2>/dev/null || echo 80)
    rows=$(tput lines 2>/dev/null || echo 24)
    
    # Caracteres Matrix (katakana japonês + números + símbolos)
    local chars='0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijlmnopkrstuvxzykwǮϟᓍᓍٹї⍥ӁᓨᑆᒖϟϞهههههՋѼ'
    
    clear
    tput civis 2>/dev/null
    printf '\e[32m'
    
    # Arrays para controlar as colunas
    declare -a drops
    declare -a speeds
    declare -a chars_per_col
    
    # Inicializar arrays
    for ((i=0; i<cols; i++)); do
        drops[i]=$((RANDOM % rows))
        speeds[i]=$((RANDOM % 3 + 1))
        chars_per_col[i]=""
    done
    
    local start_time=$(date +%s)
    
    while true; do
        current_time=$(date +%s)
        if ((current_time - start_time >= duration)); then
            break
        fi
        
        # Limpar tela com fade effect
        for ((row=0; row<rows; row++)); do
            tput cup $row 0 2>/dev/null
            printf "%*s" $cols ""
        done
        
        # Desenhar colunas
        for ((col=0; col<cols; col++)); do
            # Mover gota para baixo
            drops[col]=$((drops[col] + speeds[col]))
            
            # Reset se passou da tela
            if ((drops[col] > rows + 10)); then
                drops[col]=$((RANDOM % -20))
                speeds[col]=$((RANDOM % 3 + 1))
            fi
            
            # Desenhar trilha da gota
            for ((trail=0; trail<15; trail++)); do
                local y=$((drops[col] - trail))
                if ((y >= 0 && y < rows)); then
                    tput cup $y $col 2>/dev/null
                    
                    # Caractere aleatório
                    local char_idx=$((RANDOM % ${#chars}))
                    local char="${chars:char_idx:1}"
                    
                    # Intensidade baseada na posição na trilha
                    if ((trail == 0)); then
                        printf '\e[1;37m%s\e[0m\e[32m' "$char"  # Branco brilhante na ponta
                    elif ((trail < 3)); then
                        printf '\e[1;32m%s\e[0m\e[32m' "$char"  # Verde brilhante
                    elif ((trail < 8)); then
                        printf '\e[32m%s' "$char"               # Verde normal
                    else
                        printf '\e[2;32m%s\e[0m\e[32m' "$char"  # Verde escuro
                    fi
                fi
            done
        done
        
        sleep 0.04
    done
    
    printf '\e[0m'
    tput cnorm 2>/dev/null
}

# ===== EFEITO DE TEXTO DIGITANDO =====
type_text() {
    local text="$1"
    local delay="${2:-0.03}"
    local i
    
    for ((i=0; i<${#text}; i++)); do
        printf "%s" "${text:i:1}"
        sleep "$delay"
    done
    echo
}

# ===== INTRO MATRIX COMPLETA =====
matrix_intro_complete() {
    clear
    
    # Digital Rain Effect
    matrix_digital_rain
    
    clear
    printf '\e[1;32m'
    
    # Mensagens icônicas do Matrix
    echo
    echo
    type_text "Wake up, Neo..." 0.08
    echo
    sleep 2
    
    clear
    echo
    echo
    type_text "A Matrix pegou você..." 0.08
    echo
    sleep 2
    
    clear
    echo
    echo
    type_text "Siga o coelho branco." 0.06
    echo
    sleep 2
    
    clear
    echo
    echo
    type_text "Toc Toc Neo." 0.06
    echo
    sleep 2
    
    printf '\e[0m'
}

# ===== NOVAS FUNCIONALIDADES AVANÇADAS =====

# Análise avançada de logs
advanced_log_analysis() {
    echo -e "\e[1;33m🔍 ANÁLISE AVANÇADA DE LOGS\e[0m"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    
    if [[ ! -f "$AUDIT_LOG" ]]; then
        echo "❌ Log de auditoria não encontrado!"
        return 1
    fi
    
    echo "📊 Estatísticas dos últimos 7 dias:"
    echo
    
    # Top 10 usuários mais ativos
    echo "👥 Top 10 usuários mais ativos:"
    ausearch -ts recent | grep -o 'uid=[0-9]*' | sort | uniq -c | sort -nr | head -10
    echo
    
    # Tentativas de login falhadas
    echo "🚫 Tentativas de login falhadas (últimas 24h):"
    ausearch -m USER_LOGIN -ts today | grep -c "res=failed" || echo "0"
    echo
    
    # Modificações de arquivos críticos
    echo "📁 Modificações em arquivos críticos:"
    ausearch -k critical_files -ts recent | wc -l || echo "0"
    echo
    
    # Comandos sudo executados
    echo "⚡ Comandos sudo executados hoje:"
    ausearch -m USER_CMD -ts today | grep -c "sudo" || echo "0"
}

# Detecção de ameaças em tempo real
threat_detection() {
    echo -e "\e[1;31m🛡️ DETECÇÃO DE AMEAÇAS\e[0m"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    
    echo "🔍 Procurando por atividades suspeitas..."
    
    # Escalação de privilégios
    echo "⬆️ Tentativas de escalação de privilégios:"
    ausearch -m USER_ROLE_CHANGE -ts recent | wc -l || echo "0"
    
    # Comandos suspeitos
    echo "⚠️ Comandos potencialmente perigosos:"
    ausearch -k dangerous_commands -ts recent | wc -l || echo "0"
    
    # Acesso a arquivos sensíveis
    echo "🔒 Acesso a arquivos sensíveis:"
    ausearch -k sensitive_files -ts recent | wc -l || echo "0"
    
    # Conexões de rede suspeitas
    echo "🌐 Conexões de rede monitoradas:"
    ausearch -k network_connections -ts recent | wc -l || echo "0"
}

# Verificação de integridade do sistema
system_integrity_check() {
    echo -e "\e[1;36m🔧 VERIFICAÇÃO DE INTEGRIDADE\e[0m"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    
    echo "🔍 Verificando integridade de arquivos críticos..."
    
    # Verificar arquivos de sistema importantes
    local critical_files=(
        "/etc/passwd"
        "/etc/shadow"
        "/etc/sudoers"
        "/etc/ssh/sshd_config"
        "/etc/audit/auditd.conf"
    )
    
    for file in "${critical_files[@]}"; do
        if [[ -f "$file" ]]; then
            echo "✅ $file - OK"
        else
            echo "❌ $file - AUSENTE!"
        fi
    done
    
    echo
    echo "📊 Estatísticas do sistema:"
    echo "• Usuários com shell: $(grep -c '/bin/bash\|/bin/sh' /etc/passwd)"
    echo "• Processos em execução: $(ps aux | wc -l)"
    echo "• Conexões de rede ativas: $(netstat -an | grep ESTABLISHED | wc -l)"
}

# Backup automático de configurações
backup_audit_config() {
    echo -e "\e[1;35m💾 BACKUP DE CONFIGURAÇÕES\e[0m"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    
    # Criar diretório de backup se não existir
    mkdir -p "$BACKUP_DIR"
    
    local timestamp=$(date +"%Y%m%d_%H%M%S")
    local backup_file="$BACKUP_DIR/audit_backup_$timestamp.tar.gz"
    
    echo "📦 Criando backup em: $backup_file"
    
    # Fazer backup das configurações
    tar -czf "$backup_file" \
        /etc/audit/ \
        /var/log/audit/ \
        2>/dev/null
    
    if [[ $? -eq 0 ]]; then
        echo "✅ Backup criado com sucesso!"
        echo "📁 Localização: $backup_file"
        echo "📊 Tamanho: $(du -h "$backup_file" | cut -f1)"
    else
        echo "❌ Erro ao criar backup!"
    fi
}

# Otimização de performance
optimize_audit_performance() {
    echo -e "\e[1;33m⚡ OTIMIZAÇÃO DE PERFORMANCE\e[0m"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    
    echo "🔧 Aplicando otimizações..."
    
    # Configurações otimizadas para auditd.conf
    local config_file="/etc/audit/auditd.conf"
    
    if [[ -f "$config_file" ]]; then
        # Backup da configuração atual
        cp "$config_file" "$config_file.backup.$(date +%s)"
        
        echo "• Otimizando buffer de logs..."
        sed -i 's/^num_logs = .*/num_logs = 10/' "$config_file"
        
        echo "• Configurando rotação de logs..."
        sed -i 's/^max_log_file = .*/max_log_file = 100/' "$config_file"
        
        echo "• Otimizando flush de disco..."
        sed -i 's/^flush = .*/flush = INCREMENTAL_ASYNC/' "$config_file"
        
        echo "✅ Otimizações aplicadas!"
        echo "🔄 Reinicie o auditd para aplicar as mudanças."
    else
        echo "❌ Arquivo de configuração não encontrado!"
    fi
}

# Configuração de regras de segurança avançadas
setup_advanced_rules() {
    echo -e "\e[1;32m🛡️ CONFIGURAÇÃO DE REGRAS AVANÇADAS\e[0m"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    
    echo "📝 Adicionando regras de segurança avançadas..."
    
    # Regras para arquivos críticos
    auditctl -w /etc/passwd -p wa -k critical_files
    auditctl -w /etc/shadow -p wa -k critical_files
    auditctl -w /etc/sudoers -p wa -k critical_files
    auditctl -w /etc/ssh/sshd_config -p wa -k critical_files
    
    # Regras para comandos perigosos
    auditctl -a always,exit -F arch=b64 -S unlink,unlinkat,rename,renameat -k dangerous_commands
    auditctl -a always,exit -F arch=b64 -S chmod,fchmod,fchmodat -k file_permissions
    
    # Regras para monitoramento de rede
    auditctl -a always,exit -F arch=b64 -S socket,connect,accept -k network_connections
    
    # Regras para escalação de privilégios
    auditctl -w /bin/su -p x -k privilege_escalation
    auditctl -w /usr/bin/sudo -p x -k privilege_escalation
    
    echo "✅ Regras avançadas configuradas!"
    echo "📋 Total de regras ativas: $(auditctl -l | wc -l)"
}

# ===== MENU PRINCIPAL APRIMORADO =====
menu() {
    clear
    echo -e "\e[1;32m"
    echo "╔══════════════════════════════════════════════════════════╗"
    echo "║                   Ѽ  MATRIX AUDIT Ѽ                      ║"
    echo "║             Sistema de Auditoria Dev Thiago Oliveira     ║"
    echo "╠══════════════════════════════════════════════════════════╣"
    echo "║                   CONTROLES BÁSICOS                      ║"
    echo "║  1) Iniciar auditd              2) Parar auditd          ║"
    echo "║  3) Status auditd               4) Habilitar no boot     ║"
    echo "║                                                          ║"
    echo "║                  GERENCIAR REGRAS                        ║"
    echo "║  5) Listar regras               6) Adicionar regra       ║"
    echo "║  7) Remover regra               8) Regras de execução    ║"
    echo "║  9) Regras avançadas           10) Recarregar regras     ║"
    echo "║                                                          ║"
    echo "║                   ANÁLISE E BUSCA                        ║"
    echo "║ 11) Buscar por chave           12) Buscar por UID        ║"
    echo "║ 13) Relatório geral            14) Relatório arquivos    ║"
    echo "║ 15) Relatório logins           16) Análise avançada      ║"
    echo "║                                                          ║"
    echo "║                  SEGURANÇA AVANÇADA                      ║"
    echo "║ 17) Detecção de ameaças        18) Verificar integridade ║"
    echo "║ 19) Monitor tempo real         20) Backup configurações  ║"
    echo "║ 21) Otimizar performance       22) Mostrar regras        ║"
    echo "║                                                          ║"
    echo "║  0) Sair                                                 ║"
    echo "╚══════════════════════════════════════════════════════════╝"
    echo -e "\e[0m"
}

# ===== FUNÇÕES EXISTENTES MANTIDAS =====
check_root() {
    if [[ $EUID -ne 0 ]]; then
        echo "⚠️ Este script precisa ser executado como root."
        exit 1
    fi
}

start_auditd() { systemctl start auditd; echo "✅ auditd iniciado."; }
stop_auditd() { systemctl stop auditd; echo "🛑 auditd parado."; }
status_auditd() { systemctl status auditd; }
enable_auditd() { systemctl enable auditd; echo "✅ auditd habilitado no boot."; }
list_rules() { auditctl -l; }
add_rule() { read -p "Arquivo: " file; read -p "Permissões (r,w,x,a): " perm; read -p "Chave: " key; auditctl -w "$file" -p "$perm" -k "$key"; echo "✅ Regra adicionada."; }
del_rule() { read -p "Arquivo: " file; read -p "Permissões: " perm; read -p "Chave: " key; auditctl -W "$file" -p "$perm" -k "$key"; echo "❌ Regra removida."; }
add_rule_exec() { read -p "Chave: " key; auditctl -a always,exit -F arch=b64 -S execve -k "$key"; echo "✅ Regra de execução adicionada."; }
search_key() { read -p "Chave: " key; ausearch -k "$key"; }
search_user() { read -p "UID: " uid; ausearch -ua "$uid"; }
report_summary() { aureport; }
report_files() { aureport -f; }
report_logins() { aureport -l; }
reload_rules() { augenrules --load; echo "♻️ Regras recarregadas."; }
show_persistent_rules() { cat /etc/audit/rules.d/*.rules 2>/dev/null || echo "Nenhuma regra persistente encontrada."; }
monitor_mode() { echo "🔍 Monitor em tempo real (CTRL+C para sair)..."; tail -f "$AUDIT_LOG"; }

# ===== EXECUÇÃO PRINCIPAL =====
# Executar intro Matrix completa
matrix_intro_complete

# Verificar permissões
check_root

# Loop principal do menu
while true; do
    menu
    read -p "Escolha uma opção: " opcao
    case $opcao in
        1) start_auditd ;;
        2) stop_auditd ;;
        3) status_auditd ;;
        4) enable_auditd ;;
        5) list_rules ;;
        6) add_rule ;;
        7) del_rule ;;
        8) add_rule_exec ;;
        9) setup_advanced_rules ;;
        10) reload_rules ;;
        11) search_key ;;
        12) search_user ;;
        13) report_summary ;;
        14) report_files ;;
        15) report_logins ;;
        16) advanced_log_analysis ;;
        17) threat_detection ;;
        18) system_integrity_check ;;
        19) monitor_mode ;;
        20) backup_audit_config ;;
        21) optimize_audit_performance ;;
        22) show_persistent_rules ;;
        0) echo "👋 Desconectando da Matrix..."; sleep 1; clear; exit 0 ;;
        *) echo "❌ Opção inválida. Tente novamente." ;;
    esac
    echo
    read -p "Pressione ENTER para voltar ao menu..."
done
