#!/bin/bash

# Defina a senha em uma variável
password="SuaSenhaAqui"

# Função para exibir mensagens informativas com destaque
log_message() {
  echo "#################################################"
  echo "## $1"
  echo "#################################################"
}

# Comandos a serem executados via SSH no servidor N8N
log_message "Atualizando Chatwoot"
sshpass -p "$password" ssh -T root@localhost <<EOF
sudo -i -u chatwoot
cd chatwoot
git checkout master
git pull
bundle
yarn
rake assets:precompile RAILS_ENV=production
RAILS_ENV=production bundle exec rake db:migrate
EOF

# Adicione um intervalo de tempo de 5 segundos
sleep 5

# Comandos a serem executados após o SSH
log_message "Chatwoot Atualizado"
cp /home/chatwoot/chatwoot/deployment/chatwoot-web.1.service /etc/systemd/system/chatwoot-web.1.service
cp /home/chatwoot/chatwoot/deployment/chatwoot-worker.1.service /etc/systemd/system/chatwoot-worker.1.service
cp /home/chatwoot/chatwoot/deployment/chatwoot.target /etc/systemd/system/chatwoot.target
systemctl daemon-reload && systemctl restart chatwoot.target

# Adicione um intervalo de tempo de 10 segundos
sleep 10

log_message "Atualizando N8N"
npm update -g n8n
pm2 restart all

log_message "N8N Atualizado"

# Adicione um intervalo de tempo de 5 segundos
sleep 5

# Comandos a serem executados via SSH no servidor N8N (parte 2)
log_message "Atualizando Quepasa"
sshpass -p "$password" ssh -T root@localhost <<EOF
sudo -i -u quepasa
git pull
exit
EOF

# Adicione um intervalo de tempo de 5 segundos
sleep 5

log_message "Quepasa Atualizado"
systemctl restart quepasa
