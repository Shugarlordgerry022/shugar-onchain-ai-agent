# AI Agent Setup Guide

## Installation

```bash
pip install -r requirements.txt
```

## Configuration

### Environment Variables

Create `.env` file:

```bash
BSC_RPC_URL=https://bsc-dataseed.binance.org/
PRIVATE_KEY=your_private_key_here
CONTRACT_ADDRESS=0x...
OPENAI_API_KEY=sk-...
```

## Running the Agent

```bash
python agent/main.py
```

## Agent Architecture

### Core Components

1. **ShugarAgent**: Main agent class handling blockchain interactions
2. **WorkflowExecutor**: Manages workflow triggers, conditions, and actions
3. **EventMonitor**: Listens to contract events

### Workflow Flow

```
Trigger Check -> Condition Evaluation -> Action Execution -> Event Logging
```
