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
    setChainlinkToken(0x326C977E6efc84E512bB9C30f76E30c160eD06FB);
    setChainlinkOracle(0x6c2e87340Ef6F3b7e21B2304D6C057091814f25E);
    externalJobId = "59b95d44dae442d69f48d09a0ddabf6e";
    oraclePayment = ((0 * LINK_DIVISIBILITY) / 10); // n * 10**18
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
