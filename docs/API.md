# Shugar Onchain AI Agent - API Reference

## Agent API

### ShugarAgent Class

#### Constructor
```python
ShugarAgent(
    contract_address: str,
    private_key: str,
    rpc_url: str,
    openai_api_key: str
)
```

#### Methods

##### `execute_workflow(workflow_id: str, amount_in: int) -> Optional[str]`
Execute a workflow on-chain.

**Parameters:**
- `workflow_id`: Unique workflow identifier
- `amount_in`: Amount of input token

**Returns:** Transaction hash or None if failed

##### `get_workflow_config(workflow_id: str) -> Dict[str, Any]`
Retrieve workflow configuration from contract.

##### `authorize_agent(agent_address: str) -> bool`
Authorize an agent address.

## WorkflowExecutor Class

#### Constructor
```python
WorkflowExecutor(agent: ShugarAgent, workflows: List[Dict[str, Any]])
```

#### Methods

##### `async execute_due_workflows()`
Check and execute workflows that are due.

## Smart Contract ABI

### OnchainAgent Contract

#### Functions

**executeWorkflow(workflowId, amountIn)**
- Executes a workflow
- Only authorized agents can call
- Emits WorkflowExecuted event

**configureWorkflow(workflowId, tokenIn, tokenOut, minAmountOut, maxGasPrice)**
- Configures a workflow
- Only owner can call

**authorizeAgent(agent, authorized)**
- Authorizes or revokes agent
- Only owner can call

#### Events

**WorkflowExecuted(workflowId, executor, success, reason)**
**TradeExecuted(tokenIn, tokenOut, amountIn, amountOut)**
**AgentAuthorized(agent, authorized)**
