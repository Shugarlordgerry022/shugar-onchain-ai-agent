import pytest
from agent.core.agent import ShugarAgent
from agent.workflow.executor import WorkflowExecutor


def test_agent_initialization():
    """Test agent initialization"""
    agent = ShugarAgent(
        contract_address="0x1234567890123456789012345678901234567890",
        private_key="0x" + "1" * 64,
        rpc_url="https://data-seed-prebsc-1-b.binance.org:8545",
        openai_api_key="sk-test",
    )
    assert agent.contract_address is not None


def test_workflow_executor():
    """Test workflow executor"""
    agent = ShugarAgent(
        contract_address="0x1234567890123456789012345678901234567890",
        private_key="0x" + "1" * 64,
        rpc_url="https://data-seed-prebsc-1-b.binance.org:8545",
        openai_api_key="sk-test",
    )
    
    workflows = [
        {
            "id": "test-workflow",
            "enabled": True,
            "actions": [
                {
                    "type": "trade",
                    "tokenIn": "USDT",
                    "tokenOut": "ETH",
                    "amount": 0.5,
                }
            ],
        }
    ]
    
    executor = WorkflowExecutor(agent, workflows)
    assert len(executor.workflows) == 1
