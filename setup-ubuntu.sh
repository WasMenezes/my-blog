#!/bin/bash
# Script de setup automático para Ubuntu - Hugo Blog Was Menezes

set -e

echo "🚀 Setup Hugo Blog - Was Menezes para Ubuntu"
echo "============================================="

# Cores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Função para logging
log() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

warn() {
    echo -e "${YELLOW}[WARN]${NC} $1"
}

error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Verificar se é Ubuntu/Debian
if ! command -v apt &> /dev/null; then
    error "Este script é para sistemas Ubuntu/Debian"
    exit 1
fi

# Atualizar sistema
log "Atualizando sistema..."
sudo apt update && sudo apt upgrade -y

# Instalar dependências básicas
log "Instalando dependências básicas..."
sudo apt install -y curl wget git vim nano

# Verificar se Docker já está instalado
if command -v docker &> /dev/null; then
    warn "Docker já está instalado"
else
    log "Instalando Docker..."
    curl -fsSL https://get.docker.com -o get-docker.sh
    sudo sh get-docker.sh
    rm get-docker.sh
    
    # Adicionar usuário ao grupo docker
    log "Adicionando usuário ao grupo docker..."
    sudo usermod -aG docker $USER
    
    warn "⚠️  IMPORTANTE: Faça logout/login para aplicar as permissões do Docker"
fi

# Instalar Docker Compose
if command -v docker-compose &> /dev/null; then
    warn "Docker Compose já está instalado"
else
    log "Instalando Docker Compose..."
    sudo apt install -y docker-compose-plugin
fi

# Verificar instalação
log "Verificando instalação..."
docker --version
docker compose version

# Criar diretório do projeto se não existir
PROJECT_DIR="$HOME/wasmenezes-myblog"
if [ ! -d "$PROJECT_DIR" ]; then
    log "Criando diretório do projeto em $PROJECT_DIR"
    mkdir -p "$PROJECT_DIR"
fi

echo ""
echo "🎉 Setup concluído com sucesso!"
echo "================================"
echo ""
echo "📋 Próximos passos:"
echo "1. Faça logout/login para aplicar permissões do Docker"
echo "2. Navegue até o diretório: cd $PROJECT_DIR"
echo "3. Coloque os arquivos do blog no diretório"
echo "4. Execute: docker-compose up"
echo ""
echo "🔗 URLs importantes:"
echo "- Blog local: http://localhost:1313"
echo "- Documentação: README-Docker.md"
echo ""
echo "🛠️ Comandos úteis:"
echo "- Iniciar: docker-compose up -d"
echo "- Parar: docker-compose down"
echo "- Logs: docker-compose logs -f"
echo "- Build: docker-compose --profile build run --rm hugo-build"
echo ""

# Verificar se precisa de logout
if groups $USER | grep -q docker; then
    log "✅ Usuário já está no grupo docker"
else
    warn "⚠️  Execute 'newgrp docker' ou faça logout/login para aplicar permissões"
fi

echo "�� Pronto para usar!" 