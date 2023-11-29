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
    setChainlinkToken(0x514910771AF9Ca656af840dff83E8264EcF986CA);
    oracle = 0x1db329cDE457D68B872766F4e12F9532BCA9149b;
    externalJobId = "6b8afedd9ccd4ff7a21157a2c26e98a1";
    oraclePayment = ((14 * LINK_DIVISIBILITY) / 10); // n * 10**18
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
