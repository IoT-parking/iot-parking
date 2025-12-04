#!/bin/sh

echo "Starting Anvil..."
anvil --host 0.0.0.0 --block-time 1 &

echo "Waiting for Anvil to be ready..."
until cast block-number --rpc-url http://127.0.0.1:8545 > /dev/null 2>&1; do
  sleep 1
done

echo "Anvil is UP! Deploying contract..."

# Deploy contract
# We use --private-key of account #0 to ensure the contract address is always deterministic (0x5FbDB...)
forge script script/Deploy.s.sol:DeployScript --rpc-url http://127.0.0.1:8545 --broadcast --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80

echo "Contract deployed successfully."

wait