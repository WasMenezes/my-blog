# 🐳 Hugo Blog - Was Menezes - Ambiente Docker

Este repositório contém um ambiente Docker completo para o blog Hugo do Was Menezes, incluindo todas as configurações otimizadas para qualidade de imagem e desenvolvimento.

## 📋 Pré-requisitos

### Ubuntu/Linux
```bash
# Instalar Docker
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

# Instalar Docker Compose
sudo apt update
sudo apt install docker-compose-plugin

# Adicionar usuário ao grupo docker (opcional, evita usar sudo)
sudo usermod -aG docker $USER
# Logout e login novamente para aplicar
```

## 🚀 Como usar

### 1. Clonar/Baixar o projeto
```bash
git clone <seu-repositorio>
cd wasmenezes-myblog
```

### 2. Método 1: Docker Compose (Recomendado)

#### Desenvolvimento (servidor local)
```bash
# Iniciar servidor de desenvolvimento
docker-compose up

# Em segundo plano
docker-compose up -d

# Ver logs
docker-compose logs -f

# Parar
docker-compose down
```

#### Construir para produção
```bash
# Construir site otimizado
docker-compose --profile build run --rm hugo-build

# O site será gerado na pasta ./public/
```

### 3. Método 2: Docker direto

#### Construir a imagem
```bash
docker build -t wasmenezes-blog .
```

#### Executar comandos

**Servidor de desenvolvimento:**
```bash
docker run -p 1313:1313 -v $(pwd):/src wasmenezes-blog server
```

**Construir para produção:**
```bash
docker run -v $(pwd):/src wasmenezes-blog build
```

**Criar novo post:**
```bash
docker run -v $(pwd):/src wasmenezes-blog new posts/meu-novo-post.md
```

**Shell interativo:**
```bash
docker run -it -v $(pwd):/src wasmenezes-blog shell
```

## 📁 Estrutura do projeto

```
wasmenezes-myblog/
├── 📄 Dockerfile              # Configuração do container
├── 📄 docker-compose.yml      # Orquestração dos serviços
├── 📄 docker-entrypoint.sh    # Script de entrada
├── 📄 .dockerignore           # Arquivos ignorados no build
├── 📄 hugo.toml               # Configuração do Hugo
├── 📂 content/                # Posts e páginas
├── 📂 static/                 # Arquivos estáticos (imagens)
├── 📂 assets/                 # Assets processados pelo Hugo
├── 📂 layouts/                # Templates customizados
└── 📂 public/                 # Site gerado (criado automaticamente)
```

## 🛠️ Comandos úteis

### Gerenciamento do container
```bash
# Ver containers rodando
docker ps

# Parar container específico
docker stop wasmenezes-hugo-blog

# Remover container
docker rm wasmenezes-hugo-blog

# Ver logs do container
docker logs wasmenezes-hugo-blog

# Entrar no container em execução
docker exec -it wasmenezes-hugo-blog bash
```

### Limpeza
```bash
# Remover imagens não utilizadas
docker image prune

# Limpeza completa (cuidado!)
docker system prune -a
```

## 📝 Criando novos posts

### Método 1: Via Docker
```bash
docker-compose run --rm hugo-blog new posts/meu-post.md
```

### Método 2: Editando diretamente
1. Crie arquivo em `content/posts/meu-post.md`
2. Use o formato:
```markdown
+++
date = '2025-06-21T01:20:42-03:00'
draft = false
title = 'Meu Post'
+++

Conteúdo do post aqui...

![Minha Imagem](/assets/imagem.jpg)
```

### 📸 Adicionando imagens

1. **Para posts**: Coloque em `static/assets/`
   ```markdown
   ![Descrição](/assets/minha-imagem.jpg)
   ```

2. **Para avatar**: Coloque em `assets/avatar.png`

## 🌐 Acessando o site

- **Desenvolvimento**: http://localhost:1313
- **Produção**: Arquivos em `./public/`

## ⚙️ Configurações importantes

### Qualidade de imagem (já configurado)
```toml
[imaging]
  resampleFilter = "Lanczos"
  quality = 95
  anchor = "Smart"
```

### CSS customizado
- Local: `static/css/custom.css`
- Avatar: 200x200px com alta qualidade

## 🔧 Troubleshooting

### Porta 1313 em uso
```bash
# Descobrir o que está usando a porta
sudo lsof -i :1313

# Matar processo
sudo kill -9 <PID>

# Ou usar porta diferente
docker run -p 8080:1313 wasmenezes-blog
```

### Permissões de arquivo
```bash
# Se tiver problemas de permissão
sudo chown -R $USER:$USER .
```

### Rebuild completo
```bash
# Forçar rebuild da imagem
docker-compose build --no-cache

# Ou com Docker direto
docker build --no-cache -t wasmenezes-blog .
```

## 📚 Recursos adicionais

- [Documentação Hugo](https://gohugo.io/documentation/)
- [Hugo Blog Awesome Theme](https://github.com/hugo-sid/hugo-blog-awesome)
- [Docker Compose Reference](https://docs.docker.com/compose/)

## 🎯 Vantagens deste setup

✅ **Ambiente isolado**: Não interfere com outros projetos  
✅ **Reproduzível**: Funciona igual em qualquer máquina  
✅ **Otimizado**: Configurações de alta qualidade para imagens  
✅ **Flexível**: Vários métodos de uso  
✅ **Produção**: Build otimizado para deploy  

---

**Desenvolvido por Was Menezes** 🚀 