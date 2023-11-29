// SPDX-License-Identifier: MIT
// https://glink.solutions
// Discord=https://discord.gg/KmZVYhYJUy

/**
 * THIS IS AN EXAMPLE CONTRACT WHICH USES HARDCODED VALUES FOR CLARITY.
 * THIS EXAMPLE USES UN-AUDITED CODE.
 * DO NOT USE THIS CODE IN PRODUCTION.
 */

pragma solidity ^0.8.7;

import "@chainlink/contracts/src/v0.8/ChainlinkClient.sol";
import "@chainlink/contracts/src/v0.8/ConfirmedOwner.sol";

contract getUint256ArrayTemplate is ChainlinkClient, ConfirmedOwner {
  using Chainlink for Chainlink.Request;

  uint256[] public array;

  bytes32 private externalJobId;
  uint256 private oraclePayment;

  constructor() ConfirmedOwner(msg.sender){
     setChainlinkToken(0xb0897686c545045aFc77CF20eC7A532E3120E0F1);
    setChainlinkOracle(0xbac0638773782e9130DfeAF59a5b27bBc49a7007);
    externalJobId = "1917a3f2cd484ec18574ba3316299bce";
    oraclePayment = ((15 * LINK_DIVISIBILITY) / 100); // n * 10**18
  }

  function requestArray()
    public
    onlyOwner
  {
    Chainlink.Request memory req = buildChainlinkRequest(externalJobId, address(this), this.fulfillArray.selector);
    req.add("get", "https://your_API_endpoint_url");
    req.add("path", "data,results");
    sendOperatorRequest(req, oraclePayment);
  }

  event RequestFulfilledArray(bytes32 indexed requestId, uint256[] _array);

  function fulfillArray(bytes32 requestId, uint256[] memory _array)
    public
    recordChainlinkFulfillment(requestId)
  {
    emit RequestFulfilledArray(requestId, _array);
    array = _array;
  }
}
