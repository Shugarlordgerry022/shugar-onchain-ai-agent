"""
Workflow Execution Engine
"""

import asyncio
import logging
from typing import List, Dict, Any
from datetime import datetime

logger = logging.getLogger(__name__)

class WorkflowExecutor:
    """Manages and executes workflows"""

    def __init__(self, agent, workflows: List[Dict[str, Any]]):
        self.agent = agent
        self.workflows = workflows
        self.last_execution = {}

    async def execute_due_workflows(self):
        """Check and execute workflows that are due"""
        for workflow in self.workflows:
            if workflow.get("enabled", False):
                logger.info(f"Workflow {workflow['id']} is enabled")
                await self._execute_workflow(workflow)

    async def _execute_workflow(self, workflow: Dict[str, Any]):
        """Execute workflow actions"""
        workflow_id = workflow["id"]
        logger.info(f"Executing workflow: {workflow_id}")

        for action in workflow.get("actions", []):
            if action["type"] == "trade":
                await self._execute_trade_action(workflow_id, action)

    async def _execute_trade_action(self, workflow_id: str, action: Dict[str, Any]):
        """Execute trade action"""
        try:
            amount = int(float(action["amount"]))
            self.agent.execute_workflow(workflow_id, amount)
            logger.info(f"✅ Trade executed for {workflow_id}")
        except Exception as e:
            logger.error(f"❌ Trade failed: {e}")
