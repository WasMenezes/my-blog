# 📦 Como Transferir para Ubuntu

## 🎯 Objetivo
Transferir todo o ambiente do blog Hugo do Mac para o Ubuntu com Docker.

## 📋 Arquivos a transferir

### Obrigatórios (Docker)
```
wasmenezes-myblog/
├── Dockerfile              ← Configuração container
├── docker-compose.yml      ← Orquestração
├── docker-entrypoint.sh    ← Script de entrada
├── .dockerignore           ← Otimização build
├── setup-ubuntu.sh         ← Setup automático
```

### Configuração Hugo
```
├── hugo.toml               ← Config principal
├── go.mod                  ← Módulos Go
├── go.sum                  ← Checksums
```

### Conteúdo
```
├── content/                ← Posts e páginas
├── static/                 ← Imagens estáticas
├── assets/                 ← Assets processados
├── layouts/                ← Templates customizados
```

### Documentação
```
├── README-Docker.md        ← Manual completo
├── DOCKER-SETUP.md         ← Setup rápido
└── TRANSFER-TO-UBUNTU.md   ← Este arquivo
```

## 🚀 Método 1: Via GitHub (Recomendado)

### No Mac (atual)
```bash
# 1. Criar repositório Git
git init
git add .
git commit -m "Hugo blog com Docker environment"

# 2. Criar repo no GitHub e fazer push
git remote add origin https://github.com/WasMenezes/myblog.git
git push -u origin main
```

### No Ubuntu
```bash
# 1. Clonar repositório
git clone https://github.com/WasMenezes/myblog.git
cd myblog

# 2. Setup automático
chmod +x setup-ubuntu.sh
./setup-ubuntu.sh

# 3. Logout/login para aplicar Docker

# 4. Iniciar blog
docker-compose up -d

# 5. Acessar: http://localhost:1313
```

## 🗂️ Método 2: Via SCP/SFTP

### Compactar no Mac
```bash
tar -czf wasmenezes-blog.tar.gz \
  Dockerfile \
  docker-compose.yml \
  docker-entrypoint.sh \
  .dockerignore \
  setup-ubuntu.sh \
  hugo.toml \
  go.mod \
  go.sum \
  content/ \
  static/ \
  assets/ \
  layouts/ \
  *.md
```

### Transferir para Ubuntu
```bash
# Via SCP
scp wasmenezes-blog.tar.gz user@ubuntu-server:~/

# No Ubuntu
tar -xzf wasmenezes-blog.tar.gz
cd wasmenezes-myblog/
chmod +x setup-ubuntu.sh docker-entrypoint.sh
./setup-ubuntu.sh
```

## 🗜️ Método 3: Via Pen Drive

### No Mac
```bash
# Copiar para pen drive
cp -r wasmenezes-myblog/ /Volumes/PENDRIVE/
```

### No Ubuntu
```bash
# Copiar do pen drive
cp -r /media/PENDRIVE/wasmenezes-myblog/ ~/
cd ~/wasmenezes-myblog/
chmod +x setup-ubuntu.sh docker-entrypoint.sh
./setup-ubuntu.sh
```

## ⚡ Execução Rápida no Ubuntu

### Setup completo (1 comando)
```bash
# Download e execução do setup
curl -fsSL https://raw.githubusercontent.com/WasMenezes/myblog/main/setup-ubuntu.sh | bash
```

### Após setup
```bash
# Navegar para projeto
cd ~/wasmenezes-myblog

# Iniciar blog
docker-compose up -d

# Ver logs
docker-compose logs -f hugo-blog

# Acessar
firefox http://localhost:1313
```

## 🔧 Verificação

### Verificar se tudo funcionou
```bash
# Containers rodando
docker ps

# Site acessível
curl -I http://localhost:1313

# Logs sem erro
docker-compose logs --tail=50
```

### Deverá ver:
- ✅ Container `wasmenezes-hugo-blog` rodando
- ✅ Porta 1313 ativa
- ✅ Site carregando em http://localhost:1313
- ✅ Avatar com qualidade alta (200x200px)
- ✅ Post do Thor com imagem funcionando

## 🎯 Resultado Final

```
Ubuntu Server
├── Docker Engine ✅
├── Hugo Blog Container ✅
├── Porta 1313 ativa ✅
├── Live reload ✅
├── Qualidade máxima imagens ✅
└── Ambiente isolado ✅
```

## 🚨 Se algo der errado

```bash
# Parar tudo
docker-compose down

# Rebuild completo
docker-compose build --no-cache

# Iniciar novamente
docker-compose up -d

# Debug
docker-compose logs -f
```

---

**🎉 Sucesso**: Blog Hugo rodando no Ubuntu com Docker! 