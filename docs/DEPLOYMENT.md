# Shugar Onchain AI Agent - Deployment Guide

## Prerequisites

- Node.js 16+
- Python 3.9+
- Hardhat
- BSC wallet with testnet BNB for gas

## Step 1: Deploy Smart Contracts

### 1.1 Configure Environment

```bash
cd contracts
cp .env.example .env
# Edit .env with your private key
```

### 1.2 Compile Contracts

```bash
npx hardhat compile
```

### 1.3 Deploy to BSC Testnet

```bash
npx hardhat run scripts/deploy.js --network bsc_testnet
```

Save the deployed contract address from the output.

## Step 2: Setup Python Agent

### 2.1 Install Dependencies

```bash
pip install -r requirements.txt
```

### 2.2 Configure Agent

```bash
cp .env.example .env
```

Edit `.env`:
```bash
BSC_RPC_URL=https://data-seed-prebsc-1-b.binance.org:8545
CONTRACT_ADDRESS=<your-deployed-contract-address>
PRIVATE_KEY=<your-private-key>
OPENAI_API_KEY=<your-openai-key>
```

## Step 3: Configure Workflows

Edit `config/workflows.json` with your workflow definitions.

## Step 4: Start Agent

```bash
python agent/main.py
```

## Mainnet Deployment

### Security Checklist

- [ ] Contracts audited
- [ ] All tests passing
- [ ] Environment variables secured
- [ ] Private keys in secure vault
- [ ] Rate limiting configured
- [ ] Emergency pause tested

### Deploy to Mainnet

```bash
cd contracts
npx hardhat run scripts/deploy.js --network bsc_mainnet
```

## Monitoring

Monitor agent logs:
```bash
tail -f logs/agent.log
```

Monitor contract events:
- View on [BSCScan](https://bscscan.com/)
- Search for contract address
