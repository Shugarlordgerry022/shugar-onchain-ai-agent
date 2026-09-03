# Workflow Configuration Guide

## Workflow Structure

```json
{
  "id": "workflow-id",
  "name": "Workflow Name",
  "enabled": true,
  "triggers": [...],
  "conditions": [...],
  "actions": [...]
}
```

## Triggers

### Time-Based Trigger
```json
{
  "type": "time",
  "value": "0 0 * * *"
}
```
Uses cron expression format.

## Conditions

### Price Condition
```json
{
  "type": "price",
  "token": "ETH",
  "operator": "<",
  "value": 3200
}
```

## Actions

### Trade Action
```json
{
  "type": "trade",
  "tokenIn": "USDT",
  "tokenOut": "ETH",
  "amount": 0.5,
  "slippage": 1.0
}
```
