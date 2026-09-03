const hre = require("hardhat");

async function main() {
  console.log("🚀 Deploying Shugar Onchain Agent...");

  const PANCAKESWAP_ROUTER = "0x10ED43C718457beEF2d55b33d7D44dfA1A534E39";

  const OnchainAgent = await hre.ethers.getContractFactory("OnchainAgent");
  const agent = await OnchainAgent.deploy(PANCAKESWAP_ROUTER);
  await agent.deployed();
  console.log("✅ OnchainAgent deployed to:", agent.address);

  const deploymentInfo = {
    network: hre.network.name,
    timestamp: new Date().toISOString(),
    OnchainAgent: agent.address,
    PancakeSwapRouter: PANCAKESWAP_ROUTER,
  };

  const fs = require("fs");
  fs.writeFileSync("deployment.json", JSON.stringify(deploymentInfo, null, 2));
  console.log("\n📄 Deployment info saved to deployment.json");
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
