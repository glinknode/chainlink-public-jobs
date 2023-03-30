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

contract getAddressTemplate is ChainlinkClient {
  using Chainlink for Chainlink.Request;

  address public addressVariable;

  bytes32 private externalJobId;
  uint256 private oraclePayment;

  event RequestFulfilled(bytes32 indexed requestId,address indexed addressVariable);

  constructor() {
    setChainlinkToken(0x779877A7B0D9E8603169DdbD7836e478b4624789);
    setChainlinkOracle(0x6c2e87340Ef6F3b7e21B2304D6C057091814f25E);
    externalJobId = "420ed4a064d74f63976d8939d7539611";
    oraclePayment = ((0 * LINK_DIVISIBILITY) / 10); // n * 10**18
  }

  function RequestAddress()
    public
  {
    Chainlink.Request memory req = buildChainlinkRequest(externalJobId, address(this), this.fulfillAddress.selector);
    req.add("get", "https://your_API_endpoint_url");
    req.add("path1", "data,results");
    sendOperatorRequest(req, oraclePayment);
  }

  function fulfillAddress(bytes32 requestId,address _addressVariable)
    public
    recordChainlinkFulfillment(requestId)
  {
    emit RequestFulfilled(requestId, _addressVariable);
    addressVariable = _addressVariable;
  }

}
