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

 
contract getIntTemplate is ChainlinkClient, ConfirmedOwner {
  using Chainlink for Chainlink.Request;

  int256 public int;
  
  bytes32 private externalJobId;
  int256 private oraclePayment;
  address private oracle;
  
  event RequestIntFulfilled(bytes32 indexed requestId,int256 indexed int);

  constructor() ConfirmedOwner(msg.sender){
    setChainlinkToken(0x6F43FF82CCA38001B6699a8AC47A2d0E66939407);
    oracle = 0x1db329cDE457D68B872766F4e12F9532BCA9149b;
    externalJobId = "d11bc24b56aa4451a15f67778836d7bf";
    oraclePayment = ((10 * LINK_DIVISIBILITY) / 100); // n * 10**18
  }

  function requestInt()
    public
    onlyOwner
  {
    Chainlink.Request memory req = buildChainlinkRequest(externalJobId, address(this), this.fulfillInt.selector);
    req.add("get", "https://your_API_endpoint_url");
    req.add("path", "data,results");
    req.addInt("times", 100);
    sendChainlinkRequestTo(oracle, req, oraclePayment);
  }

  function fulfillInt(bytes32 _requestId, int256 _Int)
    public
    recordChainlinkFulfillment(_requestId)
  {
    emit RequestIntFulfilled(_requestId, _Int);
    Int = _Int;
  }

}
