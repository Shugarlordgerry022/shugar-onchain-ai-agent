// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";

/// @title Shugar Onchain AI Agent
/// @notice Core smart contract for executing AI-driven workflows onchain
interface ISwapRouter {
    function swapExactTokensForTokens(
        uint amountIn,
        uint amountOutMin,
        address[] calldata path,
        address to,
        uint deadline
    ) external returns (uint[] memory amounts);
}

contract OnchainAgent is Ownable, ReentrancyGuard {
    // Events
    event WorkflowExecuted(
        string indexed workflowId,
        address indexed executor,
        bool success,
        string reason
    );

    event TradeExecuted(
        address indexed tokenIn,
        address indexed tokenOut,
        uint amountIn,
        uint amountOut
    );

    event AgentAuthorized(address indexed agent, bool authorized);

    // State Variables
    ISwapRouter public swapRouter;
    mapping(address => bool) public authorizedAgents;
    mapping(string => WorkflowConfig) public workflowConfigs;
    mapping(string => uint) public workflowExecutionCount;

    struct WorkflowConfig {
        string id;
        address tokenIn;
        address tokenOut;
        uint minAmountOut;
        uint maxGasPrice;
        bool enabled;
    }

    modifier onlyAuthorizedAgent() {
        require(authorizedAgents[msg.sender], "Not authorized agent");
        _;
    }

    modifier workflowEnabled(string memory _workflowId) {
        require(workflowConfigs[_workflowId].enabled, "Workflow not enabled");
        _;
    }

    constructor(address _swapRouter) {
        swapRouter = ISwapRouter(_swapRouter);
        authorizedAgents[msg.sender] = true;
    }

    /// @notice Authorize an AI agent address
    function authorizeAgent(address _agent, bool _authorized) external onlyOwner {
        authorizedAgents[_agent] = _authorized;
        emit AgentAuthorized(_agent, _authorized);
    }

    /// @notice Configure a workflow
    function configureWorkflow(
        string memory _workflowId,
        address _tokenIn,
        address _tokenOut,
        uint _minAmountOut,
        uint _maxGasPrice
    ) external onlyOwner {
        workflowConfigs[_workflowId] = WorkflowConfig({
            id: _workflowId,
            tokenIn: _tokenIn,
            tokenOut: _tokenOut,
            minAmountOut: _minAmountOut,
            maxGasPrice: _maxGasPrice,
            enabled: true
        });
    }

    /// @notice Execute a trade workflow
    function executeWorkflow(
        string memory _workflowId,
        uint _amountIn
    ) external onlyAuthorizedAgent workflowEnabled(_workflowId) nonReentrant {
        WorkflowConfig memory config = workflowConfigs[_workflowId];
        require(tx.gasprice <= config.maxGasPrice, "Gas price too high");

        try _executeTrade(config.tokenIn, config.tokenOut, _amountIn, config.minAmountOut) {
            workflowExecutionCount[_workflowId]++;
            emit WorkflowExecuted(_workflowId, msg.sender, true, "Success");
        } catch Error(string memory reason) {
            emit WorkflowExecuted(_workflowId, msg.sender, false, reason);
            revert(reason);
        }
    }

    /// @notice Internal trade execution
    function _executeTrade(
        address _tokenIn,
        address _tokenOut,
        uint _amountIn,
        uint _minAmountOut
    ) internal {
        require(_amountIn > 0, "Amount must be greater than 0");
        require(_tokenIn != _tokenOut, "Cannot swap same token");

        IERC20(_tokenIn).transferFrom(msg.sender, address(this), _amountIn);
        IERC20(_tokenIn).approve(address(swapRouter), _amountIn);

        address[] memory path = new address[](2);
        path[0] = _tokenIn;
        path[1] = _tokenOut;

        uint[] memory amounts = swapRouter.swapExactTokensForTokens(
            _amountIn,
            _minAmountOut,
            path,
            address(this),
            block.timestamp + 300
        );

        emit TradeExecuted(_tokenIn, _tokenOut, _amountIn, amounts[1]);
    }

    /// @notice Get workflow configuration
    function getWorkflowConfig(string memory _workflowId)
        external
        view
        returns (WorkflowConfig memory)
    {
        return workflowConfigs[_workflowId];
    }

    /// @notice Get execution count for a workflow
    function getExecutionCount(string memory _workflowId) external view returns (uint) {
        return workflowExecutionCount[_workflowId];
    }
}
