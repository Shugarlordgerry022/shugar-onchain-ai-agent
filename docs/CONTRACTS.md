# Smart Contracts Guide

## OnchainAgent Contract

Core contract for executing AI-driven workflows.

### Key Features

- **Workflow Management**: Configure and manage onchain workflows
- **Trade Execution**: Execute token swaps via PancakeSwap
- **Access Control**: Role-based authorization for agents
- **Emergency Functions**: Safe mechanisms to pause or withdraw funds

### Functions

#### `executeWorkflow(workflowId, amountIn)`
Executes a configured workflow.

**Parameters:**
- `_workflowId`: Unique workflow identifier
- `_amountIn`: Amount of input token to trade

#### `configureWorkflow(...)`
Sets up a new workflow with trade parameters.

#### `authorizeAgent(agent, authorized)`
Authorize or revoke agent permissions.

### Events

```solidity
event WorkflowExecuted(string indexed workflowId, address indexed executor, bool success, string reason);
event TradeExecuted(address indexed tokenIn, address indexed tokenOut, uint amountIn, uint amountOut);
```

## Security Considerations

1. **ReentrancyGuard**: Prevents reentrancy attacks
2. **Slippage Protection**: Minimum amount out parameters
3. **Gas Price Limits**: Workflows check gas price limits
4. **Access Control**: Owner and agent-based authorization
