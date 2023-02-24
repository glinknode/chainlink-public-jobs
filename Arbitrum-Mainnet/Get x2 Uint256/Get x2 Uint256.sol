// SPDX-License-Identifier: MIT
// https://glink.solutions
// Discord=https://discord.gg/a69JjGd3y6

/**
 * THIS IS AN EXAMPLE CONTRACT WHICH USES HARDCODED VALUES FOR CLARITY.
 * THIS EXAMPLE USES UN-AUDITED CODE.
 * DO NOT USE THIS CODE IN PRODUCTION.
 */

pragma solidity ^0.8.7;

import "@chainlink/contracts/src/v0.8/ChainlinkClient.sol";
import "@chainlink/contracts/src/v0.8/ConfirmedOwner.sol";

contract getMultiVariableTemplate is ChainlinkClient, ConfirmedOwner {
  using Chainlink for Chainlink.Request;

  bytes32 private externalJobId;
  uint256 private oraclePayment;

  uint256 public Value2;
  uint256 public Value1;

  constructor() ConfirmedOwner(msg.sender){
  setChainlinkToken(0xf97f4df75117a78c1A5a0DBb814Af92458539FB4);
  setChainlinkOracle(0x6c2e87340Ef6F3b7e21B2304D6C057091814f25E);
  externalJobId = "dec3f81a1483436f89c462c181d436b7";
  oraclePayment = ((10 * LINK_DIVISIBILITY) / 100); // n * 10**18
  }

  function requestValue1AndValue2()
    public
    onlyOwner
  {
    Chainlink.Request memory req = buildChainlinkRequest(externalJobId, address(this), this.fulfillValue1AndValue2.selector);
    req.add("get", "https://your_API_endpoint_url");
    req.add("path1", "data,results1");
    req.add("path2", "data,results2");
    req.addInt("times", 100);
    sendOperatorRequest(req, oraclePayment);
  }

  event RequestFulfilledValue1AndValue2(bytes32 indexed requestId, uint256 indexed Value2, uint256 indexed Value1);

  function fulfillValue1AndValue2(bytes32 requestId, uint256 _Value2, uint256 _Value1)
    public
    recordChainlinkFulfillment(requestId)
  {
    emit RequestFulfilledValue1AndValue2(requestId, _Value2, _Value1);
    Value1 = _Value1;
    Value2 = _Value2;
  }

}
