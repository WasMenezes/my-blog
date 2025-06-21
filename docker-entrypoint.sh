#!/bin/bash
set -e

# Script de entrada para container Hugo - Was Menezes Blog

echo "🚀 Iniciando Hugo Blog - Was Menezes"
echo "📁 Diretório atual: $(pwd)"
echo "📦 Versão do Hugo: $(hugo version)"

# Função para mostrar ajuda
show_help() {
    echo "
🔧 Comandos disponíveis:
  server    - Inicia servidor de desenvolvimento (padrão)
  build     - Constrói o site para produção
  new       - Cria novo post (ex: new posts/meu-post.md)
  shell     - Abre shell bash no container
  help      - Mostra esta ajuda

📖 Exemplos:
  docker run -p 1313:1313 wasmenezes-blog server
  docker run wasmenezes-blog build
  docker run wasmenezes-blog new posts/novo-post.md
"
}

# Processar comandos
case "${1:-server}" in
    server)
        echo "🌐 Iniciando servidor Hugo na porta 1313..."
        echo "🔗 Acesse: http://localhost:1313"
        hugo server \
            --bind=0.0.0.0 \
            --port=1313 \
            --baseURL=http://localhost:1313 \
            --appendPort=false \
            --disableFastRender
        ;;
    build)
        echo "🏗️  Construindo site para produção..."
        hugo --gc --minify
        echo "✅ Site construído em ./public/"
        ;;
    new)
        if [ -z "$2" ]; then
            echo "❌ Erro: Especifique o arquivo a criar"
            echo "💡 Exemplo: new posts/meu-post.md"
            exit 1
        fi
        echo "📝 Criando novo arquivo: $2"
        hugo new "$2"
        ;;
    shell)
        echo "🐚 Abrindo shell bash..."
        exec /bin/bash
        ;;
    help|--help|-h)
        show_help
        ;;
    *)
        echo "🤔 Comando desconhecido: $1"
        show_help
        exit 1
        ;;
esac 