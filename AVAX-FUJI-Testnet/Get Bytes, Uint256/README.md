# Get > Uint256, Bytes
Smart contract to return a single Uint256 integer, and a single bytes from our oracle using a `curl GET` compatible public JSON API.

## Standard Use Cases:
[1] Pricing Information

## Oracle Address & JobID:
[Oracle Address](https://testnet.snowtrace.io/address/0x37549B5E537f15f3f8b66bea7291A0BdEDC87B57): 
```
0x37549B5E537f15f3f8b66bea7291A0BdEDC87B57
```
Oracle JobID: 
```
7eafe2ad39ae46eb88647ec8cf022ec6
```
Oracle Fee: 0.0 [LINK](https://testnet.snowtrace.io/address/0x0b9d5D9136855f6FEc3c0993feE6E9CE8a297846)
```
minContractPaymentLinkJuels = 0

## Input Variables:
The smart contract requires the following parameters to be specified BEFORE compiling & deploying on Remix:

* Line 39: `"https://your_API_endpoint_url"` - Update to your API Endpoint

* Line 40: `"data,results1"` - comma-separated JSON Path1 used to the positive number wanted to be delivered to the requesting smart contract

* Line 41: `"data,results2"` - comma-separated JSON Path2 used to the positive number wanted to be delivered to the requesting smart contract

Note: If you want to access arrays within JSON responses, you have to use the proper syntax, such as "0,data,results".

* Line 42: `100` - multiplication factor must be used to multiply all the decimal places present within the API JSON response:

Note: If you want your smart contract to receive all 6 significant digits of the number 123.456, you should use a multiplication factor of 1000 (123456).

## Example Chainlink Oracle Setting
If you specify the following parameters

* API Endpoint : https://raw.githubusercontent.com/glinknode/chainlink-public-jobs/main/example-json/example-bytes_uint256.json

* JSON Path1 : `"uint256_data`

* JSON Path2 : `"bytes_data"`

* Multiplication factor : 100

If this example request was used with the example smart contract, it would have returned: `1337,0xf5c58d3e2f5e03964c68f054271ee84c9d128cb90317c334214dd1ca2e0d5d46e38c8a767f879c55d5b9bbf9ec8e1b2625f5d3a3cb0f2f8e0e31a88ddbc831319f1d2c7aafbd6c597d6c4e6ebf4c9934a02b89a1c9d178de2868c388e69e`

Note: After the fulfillRequest function is executed, you should divide the result by the previously used multiplication factor to obtain the appropriate number of decimal places for downstream usage.

## Curl Command
Curl command : 
```
curl https://raw.githubusercontent.com/glinknode/chainlink-public-jobs/main/example-json/example-bytes_uint256.json
```

JSON API Output:
```
{
  "uint256_data": 13.37,
  "bytes_data": "0xf5c58d3e2f5e03964c68f054271ee84c9d128cb90317c334214dd1ca2e0d5d46e38c8a767f879c55d5b9bbf9ec8e1b2625f5d3a3cb0f2f8e0e31a88ddbc831319f1d2c7aafbd6c597d6c4e6ebf4c9934a02b89a1c9d178de2868c388e69e"
}
```

## Step by step process:
[1] Visit [Remix.org](https://remix.ethereum.org/)

[2] Log in to Metamask and confirm that you're currently on the AVAX FUJI Test network

[3] Copy & Paste the entire contents of `Get > Get Bytes, Uint256.sol` from this directory

[4] Ensure that the input parameters on lines 39-42 are updated for your specific use case

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



