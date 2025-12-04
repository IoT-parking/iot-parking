#!/bin/sh

echo "Starting Anvil..."
# Uruchom Anvil w tle
anvil --host 0.0.0.0 --block-time 1 &

# Czekaj aż Anvil wstanie
# Zamiast 'nc', używamy 'cast', który jest częścią Foundry
echo "Waiting for Anvil to be ready..."
until cast block-number --rpc-url http://127.0.0.1:8545 > /dev/null 2>&1; do
  sleep 1
done

echo "Anvil is UP! Deploying contract..."

# Deploy kontraktu
# Używamy --private-key konta #0, aby adres kontraktu był zawsze deterministyczny (0x5FbDB...)
forge script script/Deploy.s.sol:DeployScript --rpc-url http://127.0.0.1:8545 --broadcast --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80

echo "Contract deployed successfully."

# Utrzymaj kontener przy życiu
wait
```

### 2. Przebuduj kontenery

Ponieważ zmieniliśmy skrypt startowy, musisz przebudować obraz blockchaina:

```bash
docker-compose up --build