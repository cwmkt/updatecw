
<p align="center">
<img src="https://cwmkt.com.br/wp-content/uploads/2023/08/logo-github-cwmkt.svg" alt="DispZap Whats Marketing" width="240" />
<p align="center">Seja bem-vindo ao Guia de Atualização do Chatwoot+N8N+Quepasa 🚀</p>
</p>
  
<p align="center">
<img src="https://whatsapp.com/favicon.ico" alt="WhatsAPP-logo" width="32" />
<span>Grupo WhatsaAPP: </span>
<a href="https://chat.whatsapp.com/Cv5WfmujRzE09yQ6hagYim" target="_blank">Grupo</a>
</p>

<hr />
<hr />


### Cria um novo diretótio
```bash
mkdir update_chatwoot
```

### Navegue até o novo diretório criado

```bash
cd update_chatwoot
```

### Clone o arquivo .sh resposavél pelo update

```bash
wget "https://raw.githubusercontent.com/cwmkt/updatecw/main/update_chatwoot.sh"
```

### Edite o arquivo `update_chatwoot.sh` e coloque a senha de sua VPS

```bash
nano update_chatwoot.sh
```

### Instale a ferramenta sshpass para passar a senha no script

```bash
sudo apt install sshpass
```
### Der as permissões de arquivos

```bash
chmod +x update_chatwoot.sh
```

### Converta o script para o formato UNIX

```bash
sed -i 's/\r$//' update_chatwoot.sh
```

### Execute o script

```bash
./update_chatwoot.sh
```
