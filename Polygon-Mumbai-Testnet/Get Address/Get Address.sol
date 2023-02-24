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
    setChainlinkToken(0x326C977E6efc84E512bB9C30f76E30c160eD06FB);
    setChainlinkOracle(0x4eA56b3DA6d4D2E837fd664B2b5f602a3B07A646);
    externalJobId = "f99f6b5f80ca424c87b96ce4f845c798";
    oraclePayment = ((0 * LINK_DIVISIBILITY) / 100); // n * 10**18
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
