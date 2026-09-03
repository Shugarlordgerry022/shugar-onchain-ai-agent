# Contributing to Shugar Onchain AI Agent

## Getting Started

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit changes (`git commit -m 'Add amazing feature'`)
4. Push to branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## Development Process

### 1. Set Up Development Environment

```bash
git clone https://github.com/Shugarlordgerry022/shugar-onchain-ai-agent.git
cd shugar-onchain-ai-agent

# Install dependencies
cd contracts && npm install && cd ..
pip install -r requirements.txt

# Configure environment
cp .env.example .env
```

### 2. Create Feature Branch

```bash
git checkout -b feature/your-feature-name
```

### 3. Make Changes

- Write tests for new features
- Follow code style guidelines
- Update documentation

### 4. Test Your Changes

```bash
# Test smart contracts
cd contracts && npx hardhat test

# Test Python agent
pytest tests/ -v
```

### 5. Submit Pull Request

- Describe your changes clearly
- Reference any related issues
- Ensure CI/CD passes

## Code Standards

### Python
- Use PEP 8 style guide
- Format with Black: `black agent/`
- Lint with Flake8: `flake8 agent/`
- Type hints for all functions

### Solidity
- Use Solidity 0.8.20+
- Follow [official style guide](https://docs.soliditylang.org/)
- Add natspec comments
- Test coverage > 80%

### JavaScript/TypeScript
- Use ESLint
- Format with Prettier
- Test coverage > 80%

## Commit Message Format

```
<type>(<scope>): <subject>

<body>

<footer>
```

### Types
- **feat**: New feature
- **fix**: Bug fix
- **docs**: Documentation
- **test**: Adding tests
- **refactor**: Code refactoring

### Example
```
feat(workflow): add support for conditional execution

Implement condition evaluation for workflows to allow
more complex automation logic.

Closes #123
```

## Testing Guidelines

### Unit Tests
- Test individual functions
- Mock external dependencies
- Use fixtures for setup

### Integration Tests
- Test contract interactions
- Use testnet for testing
- Verify event emissions

### Performance Tests
- Benchmark gas usage
- Monitor execution time
- Check memory usage

## Documentation

- Update README.md for major changes
- Add docstrings to functions
- Update relevant docs/ files
- Include examples for new features

## Code Review Process

1. Create a pull request
2. Pass automated tests
3. Request review from maintainers
4. Address review feedback
5. Merge once approved

## Questions?

- Open an issue for discussions
- Check existing issues first
- Be respectful and constructive

Thank you for contributing! 🙌
