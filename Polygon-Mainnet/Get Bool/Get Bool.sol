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

contract getBoolTemplate is ChainlinkClient, ConfirmedOwner {
  using Chainlink for Chainlink.Request;

  bool public boolean;
  
  bytes32 private externalJobId;
  uint256 private oraclePayment;
  address private oracle;

  event RequestBoolFulfilled(bytes32 indexed requestId,bool indexed boolean);

  constructor() ConfirmedOwner(msg.sender){
  setChainlinkToken(0xb0897686c545045aFc77CF20eC7A532E3120E0F1);
  oracle = 0xbac0638773782e9130DfeAF59a5b27bBc49a7007;
  externalJobId = "10633e94c61c46f7b115e08c4c118bb8";
  oraclePayment = ((10 * LINK_DIVISIBILITY) / 100); // n * 10**18
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
