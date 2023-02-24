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

contract getUint256ArrayTemplate is ChainlinkClient, ConfirmedOwner {
  using Chainlink for Chainlink.Request;

  uint256[] public array;

  bytes32 private externalJobId;
  uint256 private oraclePayment;

  constructor() ConfirmedOwner(msg.sender){
     setChainlinkToken(0x326C977E6efc84E512bB9C30f76E30c160eD06FB);
    setChainlinkOracle(0x4eA56b3DA6d4D2E837fd664B2b5f602a3B07A646);
    externalJobId = "1917a3f2cd484ec18574ba3316299bce";
    oraclePayment = ((15 * LINK_DIVISIBILITY) / 100); // n * 10**18
  }

  function requestArray()
    public
    onlyOwner
  {
    Chainlink.Request memory req = buildChainlinkRequest(externalJobId, address(this), this.fulfillArray.selector);
    req.add("get", "https://your_API_endpoint_url");
    req.add("path", "data,results");
    sendOperatorRequest(req, oraclePayment);
  }

  event RequestFulfilledArray(bytes32 indexed requestId, uint256[] _array);

  function fulfillArray(bytes32 requestId, uint256[] memory _array)
    public
    recordChainlinkFulfillment(requestId)
  {
    emit RequestFulfilledArray(requestId, _array);
    array = _array;
  }
}
