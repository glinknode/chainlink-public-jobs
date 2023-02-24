# Get > Bytes
This smart contract is designed to retrieve a single Bytes from our oracle using a public JSON API that is compatible with `curl GET` requests.

## Standard Use Cases:
[1] Returns a Byte

## Oracle Address & JobID:
[Oracle Address](https://etherscan.io/token/0x1db329cDE457D68B872766F4e12F9532BCA9149b): 
```
0x1db329cDE457D68B872766F4e12F9532BCA9149b
```
Oracle JobID: 
```
861ba8ef5af045d89a9b5b3d737b068a
```
Oracle Fee: 1.4 [LINK](https://etherscan.io/token/0x514910771AF9Ca656af840dff83E8264EcF986CA)
```
minContractPaymentLinkJuels = 1400000000000000000
```

## Input Parameters:
BEFORE compiling and deploying the smart contract on Remix, you MUST specify the following parameters:

* Line 38: `"https://your_API_endpoint_url"` - Update to your API Endpoint

* Line 39: `"data,results"` - comma-separated JSON path used to the positive number wanted to be delivered to the requesting smart contract

Note: If you want to access arrays within JSON responses, you have to use the proper syntax, such as "0,data,results".

## Example Chainlink Oracle Setting
If you specify the following parameters

* API Endpoint : https://raw.githubusercontent.com/glinknode/chainlink-public-jobs/main/example-json/example-byte.json

* JSON Path : `"data_bytes"`

If this example request was used with the example smart contract, it would have returned: `0xf5c58d3e2f5e03964c68f054271ee84c9d128cb90317c334214dd1ca2e0d5d46e38c8a767f879c55d5b9bbf9ec8e1b2625f5d3a3cb0f2f8e0e31a88ddbc831319f1d2c7aafbd6c597d6c4e6ebf4c9934a02b89a1c9d178de2868c388e69e`

## Curl Command
Curl command : 
```
curl https://raw.githubusercontent.com/glinknode/chainlink-public-jobs/main/example-json/example-byte.json
```

JSON API Output:
```
{
  "data_bytes": "0xf5c58d3e2f5e03964c68f054271ee84c9d128cb90317c334214dd1ca2e0d5d46e38c8a767f879c55d5b9bbf9ec8e1b2625f5d3a3cb0f2f8e0e31a88ddbc831319f1d2c7aafbd6c597d6c4e6ebf4c9934a02b89a1c9d178de2868c388e69e"
}
```


## Step by step process:
[1] Visit [Remix.org](https://remix.ethereum.org/)

[2] Log in to Metamask and confirm that you're currently on the ETH Mainnet network

[3] Copy & Paste the entire contents of `Get > Bytes.sol` from this directory

[4] Ensure that the input parameters on lines 38-39 are updated for your specific use case

[5] Compile and deploy the smart contract

[6] Send the minimum amount of ERC677 LINK required for the number of requests to your newly deployed smart contract.

[6] Click the orange `requestAddress` button in the smart contract Read/Write functionality

[7] Pay the gas fee to send the request to our oracle

[8] Wait approximately 1-2 minutes (1-2 blocks) for the requested data to be delivered to your requesting smart contract

[9] Click the blue `AddressVariable` button to display the returned value from the oracle

## Troubleshooting: :nut_and_bolt:
Please see our troubleshooting guide [here](https://github.com/glinknode/chainlink-public-jobs#troubleshooting-nut_and_bolt).

## Contact :iphone:
If you can't find an answer to your question, welcome to our [Discord](https://discord.gg/a69JjGd3y6)!  
You can also check out our [website](https://www.glink.solutions)!

