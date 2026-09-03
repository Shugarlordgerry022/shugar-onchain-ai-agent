# Shugar Onchain AI Agent - Security Policy

## Reporting Security Vulnerabilities

If you discover a security vulnerability, please **do not** open a public issue. Instead:

1. Email us at security@shugar.dev
2. Include detailed description of the vulnerability
3. Provide proof of concept if possible
4. Allow 90 days for a fix

## Security Best Practices

### For Contract Deployment

1. **Audit**: Have contracts audited by professional firm
2. **Testing**: Achieve >80% test coverage
3. **Timelock**: Use timelock for critical upgrades
4. **Multi-sig**: Require multi-signature for sensitive operations
5. **Rate Limiting**: Implement rate limiting
6. **Emergency Pause**: Have emergency pause mechanisms

### For Private Keys

1. **Never commit .env** to version control
2. **Use environment variables** for sensitive data
3. **Store in secure vault** (e.g., HashiCorp Vault)
4. **Rotate keys regularly**
5. **Use hardware wallets** for mainnet

### For Agent Operations

1. **Monitor transactions** continuously
2. **Implement slippage checks** for trades
3. **Use oracle price feeds** for safety
4. **Log all operations** for audit trail
5. **Set maximum transaction sizes**

## Known Vulnerabilities

None currently known. See [SECURITY.md](SECURITY.md) for history.

## Dependency Security

We regularly update dependencies to patch vulnerabilities:

```bash
# Check for vulnerabilities
npm audit
pip audit
```

## Bug Bounty

We may offer bounties for discovered vulnerabilities. Details coming soon.

## License

This security policy is licensed under CC0.
