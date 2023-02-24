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
    setChainlinkToken(0xf97f4df75117a78c1A5a0DBb814Af92458539FB4);
    oracle = 0x6c2e87340Ef6F3b7e21B2304D6C057091814f25E;
    externalJobId = "7f310336b4e246ee9d908568ffe16a45";
    oraclePayment = ((10 * LINK_DIVISIBILITY) / 100); // n * 10**18
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
