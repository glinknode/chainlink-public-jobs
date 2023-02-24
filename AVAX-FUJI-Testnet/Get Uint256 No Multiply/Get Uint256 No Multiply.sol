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

contract getUintTemplate is ChainlinkClient, ConfirmedOwner {
  using Chainlink for Chainlink.Request;

  uint256 public Uint;

  bytes32 private externalJobId;
  uint256 private oraclePayment;
  address private oracle;
  
  event RequestUintFulfilled(
    bytes32 indexed requestId,
    uint256 indexed Uint
  );

  constructor() ConfirmedOwner(msg.sender){
    setChainlinkToken(0x0b9d5D9136855f6FEc3c0993feE6E9CE8a297846);
    oracle = 0x37549B5E537f15f3f8b66bea7291A0BdEDC87B57;
    externalJobId = "3220bf7f54854f3c9be84e0901c17502";
    oraclePayment = ((0 * LINK_DIVISIBILITY) / 100); // n * 10**18
  }

  function requestUint()
    public
    onlyOwner
  {
    Chainlink.Request memory req = buildChainlinkRequest(externalJobId, address(this), this.fulfillUint.selector);
    req.add("get", "https://your_API_endpoint_url");
    req.add("path", "data,results");
    sendChainlinkRequestTo(oracle, req, oraclePayment);
  }

  function fulfillUint(bytes32 _requestId, uint256 _Uint)
    public
    recordChainlinkFulfillment(_requestId)
  {
    emit RequestUintFulfilled(_requestId, _Uint);
    Uint = _Uint;
  }

}
