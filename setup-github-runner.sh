#!/usr/bin/env bash
# Script para baixar e preparar o GitHub Actions Self-Hosted Runner
set -e

RUNNER_DIR="actions-runner"
RUNNER_VERSION="2.317.0"
RUNNER_TAR="actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz"
RUNNER_URL="https://github.com/actions/runner/releases/download/v${RUNNER_VERSION}/${RUNNER_TAR}"

echo "=========================================================="
echo " Prepando o GitHub Actions Self-Hosted Runner local..."
echo "=========================================================="

# Criar diretório para o runner
if [ -d "$RUNNER_DIR" ]; then
    echo "[-] O diretório '$RUNNER_DIR' já existe. Pulando criação."
else
    echo "[+] Criando diretório '$RUNNER_DIR'..."
    mkdir -p "$RUNNER_DIR"
fi

cd "$RUNNER_DIR"

# Baixar o runner se não existir localmente
if [ -f "$RUNNER_TAR" ]; then
    echo "[-] Arquivo '$RUNNER_TAR' já baixado. Pulando download."
else
    echo "[+] Baixando o Runner do GitHub v${RUNNER_VERSION}..."
    curl -o "$RUNNER_TAR" -L "$RUNNER_URL"
fi

# Extrair o pacote
echo "[+] Extraindo os arquivos do Runner..."
tar xzf "./$RUNNER_TAR"

echo ""
echo "=========================================================="
echo " 🎉 GitHub Actions Runner baixado e pronto para configuração!"
echo "=========================================================="
echo ""
echo "Para ativar o runner no seu repositório do GitHub:"
echo "1. Acesse o seu repositório no GitHub."
echo "2. Vá em: Settings -> Actions -> Runners."
echo "3. Clique em 'New self-hosted runner' e selecione 'Linux'."
echo "4. Na seção 'Configure', copie o token de registro gerado pelo GitHub."
echo "5. Execute o comando de configuração na pasta '$RUNNER_DIR':"
echo "   ./config.sh --url https://github.com/micagazineu/integration --token <SEU_TOKEN>"
echo ""
echo "6. Após configurar, inicie o runner com:"
echo "   ./run.sh"
echo "=========================================================="
