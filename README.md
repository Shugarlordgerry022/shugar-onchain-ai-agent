# Shugar Onchain AI Agent

A complete workflow AI agent built with **Binance Agent OS** that automates onchain DeFi operations through intelligent decision-making.

## 🎯 Features

- **AI-Powered Decision Making**: Uses LangChain + OpenAI/Claude for autonomous decisions
- **Onchain Execution**: Smart contracts on BSC for secure trade execution
- **Workflow Automation**: Time-based, event-based, and condition-based triggers
- **Real-time Monitoring**: Tracks prices, events, and executes workflows
- **Binance Agent OS Integration**: Leverage Agent OS for identity and permissions
- **DeFi Operations**: Automated trading, DCA, yield farming, and more

## 📁 Project Structure

```
shugar-onchain-ai-agent/
├── contracts/              # Solidity smart contracts
├── agent/                  # Python offchain AI agent
├── config/                 # Configuration files
├── tests/                  # Test suite
├── docs/                   # Documentation
└── requirements.txt        # Python dependencies
```

## 🚀 Quick Start

### Prerequisites
- Node.js 16+
- Python 3.9+
- Hardhat
- Web3.py

### 1. Clone and Setup

```bash
git clone https://github.com/Shugarlordgerry022/shugar-onchain-ai-agent.git
cd shugar-onchain-ai-agent
```

### 2. Smart Contract Deployment

```bash
cd contracts
npm install
npx hardhat compile
npx hardhat run scripts/deploy.js --network bsc-testnet
```

### 3. Agent Setup

```bash
pip install -r requirements.txt
cp .env.example .env
# Edit .env with your keys and contract address
python agent/main.py
```

## 🔧 Configuration

Edit `config/workflows.json` to define your workflows

## 📖 Documentation

- [Smart Contracts Guide](docs/CONTRACTS.md)
- [AI Agent Setup](docs/AGENT.md)
- [Workflow Configuration](docs/WORKFLOWS.md)

## 🧪 Testing

```bash
cd contracts && npx hardhat test
pytest tests/
```

## 🔐 Security

- Smart contracts secured with ReentrancyGuard
- Private keys stored in .env (never commit)
- Rate limiting and slippage protection

## 📄 License

MIT License