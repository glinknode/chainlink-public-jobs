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

contract getBoolTemplate is ChainlinkClient, ConfirmedOwner {
  using Chainlink for Chainlink.Request;

  bool public boolean;
  
  bytes32 private externalJobId;
  uint256 private oraclePayment;
  address private oracle;

  event RequestBoolFulfilled(bytes32 indexed requestId,bool indexed boolean);

  constructor() ConfirmedOwner(msg.sender){
  setChainlinkToken(0x779877A7B0D9E8603169DdbD7836e478b4624789);
  oracle = 0x6c2e87340Ef6F3b7e21B2304D6C057091814f25E;
  externalJobId = "d58dd82b4d19473a9899098a5c878a9a";
  oraclePayment = ((0 * LINK_DIVISIBILITY) / 10); // n * 10**18
  }

  function requestBool()
    public
    onlyOwner
  {
    Chainlink.Request memory req = buildChainlinkRequest(externalJobId, address(this), this.fulfillBool.selector);
    req.add("get", "https://your_API_endpoint_url");
    req.add("path", "data,results");
    sendChainlinkRequestTo(oracle, req, oraclePayment);
  }

  function fulfillBool(bytes32 _requestId, bool _boolean)
    public
    recordChainlinkFulfillment(_requestId)
  {
    emit RequestBoolFulfilled(_requestId, _boolean);
    boolean = _boolean;
  }

}
