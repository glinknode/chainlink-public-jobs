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

contract getMultiDataTypeTemplate is ChainlinkClient {
  using Chainlink for Chainlink.Request;

  bytes public data;
  string public convertedBytes;
  uint256 public amount;

  bytes32 private externalJobId;
  uint256 private oraclePayment;

  constructor(
  ) {
    setChainlinkToken(0xb0897686c545045aFc77CF20eC7A532E3120E0F1);
    setChainlinkOracle(0xbac0638773782e9130DfeAF59a5b27bBc49a7007);
    externalJobId = "d88662726b4846d191fdce47c3480e20";
    oraclePayment = ((15 * LINK_DIVISIBILITY) / 100); // n * 10**18
  }


  function requestBytesAndAmount(
  )
    public
  {
    Chainlink.Request memory req = buildChainlinkRequest(externalJobId, address(this), this.fulfillBytes.selector);
    req.add("get", "https://your_API_endpoint_url");
    req.add("path1", "data,results1");
    req.add("path2", "data,results2");
    req.addInt("times", 100);
    sendOperatorRequest(req, oraclePayment);
  }

  event RequestFulfilled(bytes32 indexed requestId,bytes indexed data,uint256 amount);

  function fulfillBytes(bytes32 requestId, bytes memory bytesData, uint256 _amount)
    public
    recordChainlinkFulfillment(requestId)
  {
    emit RequestFulfilled(requestId, bytesData, _amount);
    data = bytesData;
    convertedBytes = string(data);
    amount = _amount;
  }

}
