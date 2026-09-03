# Shugar Onchain AI Agent - Development Guide

## Local Development Setup

### 1. Install Dependencies

#### Smart Contracts
```bash
cd contracts
npm install
```

#### Python Agent
```bash
pip install -r requirements.txt
```

### 2. Environment Setup

```bash
cp .env.example .env
# Edit .env with your configuration
```

### 3. Test Smart Contracts

```bash
cd contracts
npx hardhat test
```

### 4. Run Agent Tests

```bash
pytest tests/ -v
```

### 5. Deploy to Testnet

```bash
cd contracts
npx hardhat run scripts/deploy.js --network bsc_testnet
```

## Project Structure

```
.
├── contracts/                 # Solidity smart contracts
│   ├── contracts/            # Contract source files
│   ├── scripts/              # Deployment scripts
│   ├── test/                 # Contract tests
│   └── hardhat.config.js     # Hardhat configuration
├── agent/                    # Python AI agent
│   ├── core/                 # Core agent logic
│   ├── workflow/             # Workflow execution
│   └── main.py               # Entry point
├── config/                   # Configuration files
├── tests/                    # Python tests
├── docs/                     # Documentation
└── README.md                 # Project README
```

## Code Style

- **Python**: Follow PEP 8, use Black formatter
- **Solidity**: Follow official Solidity style guide
- **JavaScript**: Use ESLint

## Testing

### Smart Contracts
```bash
cd contracts && npx hardhat test
```

### Python Agent
```bash
pytest tests/ -v --cov=agent
```

## Debugging

### Contract Debugging
```bash
cd contracts
npx hardhat test --grep "test-name"
```

### Agent Debugging
```bash
PYTHON_DEBUG=1 python agent/main.py
```

## Contributing

1. Create a feature branch
2. Write tests for new features
3. Ensure all tests pass
4. Submit a pull request

## Useful Resources

- [Hardhat Documentation](https://hardhat.org/)
- [OpenZeppelin Contracts](https://docs.openzeppelin.com/contracts/)
- [Web3.py Documentation](https://web3py.readthedocs.io/)
- [LangChain Documentation](https://python.langchain.com/)
