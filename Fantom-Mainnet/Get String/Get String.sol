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

contract getStringTemplate is ChainlinkClient {
  using Chainlink for Chainlink.Request;

  string public stringVariable;

  bytes32 private externalJobId;
  uint256 private oraclePayment;

  constructor(
  ) {
    setChainlinkToken(0x6F43FF82CCA38001B6699a8AC47A2d0E66939407);
    setChainlinkOracle(0x1db329cDE457D68B872766F4e12F9532BCA9149b);
    externalJobId = "22e236f634e348edad6be31cba401b50";
    oraclePayment = ((15 * LINK_DIVISIBILITY) / 100); // n * 10**18
  }

  function requestString(
  )
    public
  {
    Chainlink.Request memory req = buildChainlinkRequest(externalJobId, address(this), this.fulfillString.selector);
    req.add("get", "https://your_API_endpoint_url");
    req.add("path1", "data,results");
    sendOperatorRequest(req, oraclePayment);
  }

  event RequestFulfilled(bytes32 indexed requestId, string indexed stringVariable);

  function fulfillString(bytes32 requestId, string calldata _stringVariable)
    public
    recordChainlinkFulfillment(requestId)
  {
    emit RequestFulfilled(requestId, _stringVariable);
    stringVariable = _stringVariable;
  }

}
