const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("OnchainAgent", function () {
  let agent;
  let owner;
  let addr1;
  let mockRouter;

  beforeEach(async function () {
    [owner, addr1] = await ethers.getSigners();
    
    const OnchainAgent = await ethers.getContractFactory("OnchainAgent");
    agent = await OnchainAgent.deploy("0x10ED43C718457beEF2d55b33d7D44dfA1A534E39");
    await agent.deployed();
  });

  describe("Authorization", function () {
    it("Should authorize agent", async function () {
      await agent.authorizeAgent(addr1.address, true);
      expect(await agent.authorizedAgents(addr1.address)).to.be.true;
    });

    it("Should revoke agent", async function () {
      await agent.authorizeAgent(addr1.address, true);
      await agent.authorizeAgent(addr1.address, false);
      expect(await agent.authorizedAgents(addr1.address)).to.be.false;
    });
  });

  describe("Workflow Configuration", function () {
    it("Should configure workflow", async function () {
      const tokenIn = "0x55d398326f99059fF775485246999027B3197955"; // USDT
      const tokenOut = "0x2170Ed0880ac9A755fd29B2688956BD959F933F8"; // ETH

      await agent.configureWorkflow(
        "dca-eth",
        tokenIn,
        tokenOut,
        ethers.utils.parseEther("0.1"),
        ethers.utils.parseUnits("10", "gwei")
      );

      const config = await agent.getWorkflowConfig("dca-eth");
      expect(config.id).to.equal("dca-eth");
      expect(config.enabled).to.be.true;
    });
  });
});
