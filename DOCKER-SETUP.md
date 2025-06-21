# 🐳 Setup Rápido Docker - Hugo Blog Was Menezes

## 🚀 Setup Automático (Ubuntu)

### 1. Download e execução
```bash
# Baixar e executar script de setup
curl -fsSL https://raw.githubusercontent.com/seu-usuario/wasmenezes-myblog/main/setup-ubuntu.sh | bash

# Ou manualmente:
wget https://raw.githubusercontent.com/seu-usuario/wasmenezes-myblog/main/setup-ubuntu.sh
chmod +x setup-ubuntu.sh
./setup-ubuntu.sh
```

### 2. Após o setup
```bash
# Fazer logout/login ou aplicar permissões
newgrp docker

# Navegar para o projeto
cd ~/wasmenezes-myblog

# Baixar arquivos do projeto (substitua pela URL real)
git clone https://github.com/seu-usuario/wasmenezes-myblog.git .

# Iniciar o blog
docker-compose up -d
```

## ⚡ Comandos Essenciais

```bash
# Iniciar blog
docker-compose up -d

# Ver site ao vivo
# http://localhost:1313

# Parar blog
docker-compose down

# Ver logs
docker-compose logs -f

# Criar novo post
docker-compose run --rm hugo-blog new posts/meu-post.md

# Build para produção
docker-compose --profile build run --rm hugo-build
```

## 📁 Estrutura para transferir

```
wasmenezes-myblog/
├── Dockerfile
├── docker-compose.yml
├── docker-entrypoint.sh
├── .dockerignore
├── setup-ubuntu.sh
├── README-Docker.md
├── hugo.toml
├── content/
├── static/
├── assets/
└── layouts/
```

## 🔧 Configurações Incluídas

✅ **Hugo Extended 0.147.8**  
✅ **Qualidade de imagem 95%**  
✅ **Filtro Lanczos (melhor qualidade)**  
✅ **CSS customizado para avatar 200px**  
✅ **Theme hugo-blog-awesome**  
✅ **Live reload automático**  
✅ **Volumes para desenvolvimento**  

## 🚨 Troubleshooting

### Porta em uso
```bash
sudo lsof -i :1313
sudo kill -9 <PID>
```

### Rebuild total
```bash
docker-compose down
docker-compose build --no-cache
docker-compose up -d
```

### Permissões
```bash
sudo chown -R $USER:$USER .
```

---

**🎯 Resultado**: Blog Hugo funcionando em http://localhost:1313 com todas as otimizações! 