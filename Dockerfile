# Dockerfile para Blog Hugo - Was Menezes
FROM klakegg/hugo:ext-alpine


# Instalar dependências adicionais
RUN apk add --no-cache \
    git \
    curl \
    bash \
    file

# Definir diretório de trabalho
WORKDIR /src

# Copiar arquivos de configuração primeiro (para cache do Docker)
COPY hugo.toml go.mod go.sum ./

# Copiar todo o projeto
COPY . .

# Verificar se hugo está funcionando
RUN hugo version

# Expor porta padrão do Hugo
EXPOSE 1313

# Script de entrada para desenvolvimento
COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

# Comando padrão
ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["server"] 