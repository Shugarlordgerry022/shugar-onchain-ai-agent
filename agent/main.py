#!/usr/bin/env python3
"""
Shugar Onchain AI Agent - Main Entry Point
"""

import os
import json
import asyncio
import logging
from dotenv import load_dotenv
from agent.core.agent import ShugarAgent
from agent.workflow.executor import WorkflowExecutor

logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s'
)
logger = logging.getLogger(__name__)

load_dotenv()

async def main():
    logger.info("🚀 Starting Shugar Onchain AI Agent")

    agent = ShugarAgent(
        contract_address=os.getenv("CONTRACT_ADDRESS"),
        private_key=os.getenv("PRIVATE_KEY"),
        rpc_url=os.getenv("BSC_RPC_URL"),
        openai_api_key=os.getenv("OPENAI_API_KEY"),
    )

    with open("config/workflows.json") as f:
        workflows = json.load(f)

    executor = WorkflowExecutor(agent, workflows["workflows"])

    try:
        while True:
            logger.info("⏳ Checking workflows...")
            await executor.execute_due_workflows()
            await asyncio.sleep(300)
    except KeyboardInterrupt:
        logger.info("🛑 Shutting down agent")
    except Exception as e:
        logger.error(f"❌ Fatal error: {e}", exc_info=True)
        raise

if __name__ == "__main__":
    asyncio.run(main())
