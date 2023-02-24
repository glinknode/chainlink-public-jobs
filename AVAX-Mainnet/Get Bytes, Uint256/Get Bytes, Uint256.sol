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
    setChainlinkToken(0x5947BB275c521040051D82396192181b413227A3);
    setChainlinkOracle(0x6c2e87340Ef6F3b7e21B2304D6C057091814f25E);
    externalJobId = "da9f8925eb5a41de86580f05d88e00e3";
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
