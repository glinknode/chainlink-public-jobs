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

contract getMultiDataTypeTemplate is ChainlinkClient {
  using Chainlink for Chainlink.Request;

  bytes public data;
  string public convertedBytes;
  uint256 public amount;

  bytes32 private externalJobId;
  uint256 private oraclePayment;

  constructor(
  ) {
    setChainlinkToken(0x0b9d5D9136855f6FEc3c0993feE6E9CE8a297846);
    setChainlinkOracle(0x37549B5E537f15f3f8b66bea7291A0BdEDC87B57);
    externalJobId = "7eafe2ad39ae46eb88647ec8cf022ec6";
    oraclePayment = ((0 * LINK_DIVISIBILITY) / 100); // n * 10**18
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
