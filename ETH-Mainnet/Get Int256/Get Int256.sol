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
    setChainlinkToken(0x514910771AF9Ca656af840dff83E8264EcF986CA);
    oracle = 0x1db329cDE457D68B872766F4e12F9532BCA9149b;
    externalJobId = "e6202cbd2d2242b9a012640660896e0b";
    oraclePayment = ((14 * LINK_DIVISIBILITY) / 10); // n * 10**18
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
