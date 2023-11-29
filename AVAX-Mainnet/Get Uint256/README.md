# Get > Uint256
This smart contract is designed to retrieve a single Uint256 value from our oracle using a public JSON API that is compatible with `curl GET` requests.

## Standard Use Cases:
[1] Returns am unsigned Number

## Oracle Address & JobID:
[Oracle Address](https://snowtrace.io/address/0x6c2e87340Ef6F3b7e21B2304D6C057091814f25E): 
```
0x6c2e87340Ef6F3b7e21B2304D6C057091814f25E
```
Oracle JobID: 
```
dcc22a602333489a9ceb0d6ef3949c04
```
Oracle Fee: 0.1 [LINK](https://snowtrace.io/address/0x5947BB275c521040051D82396192181b413227A3)
```
minContractPaymentLinkJuels = 100000000000000000
```

## Input Parameters:
BEFORE compiling and deploying the smart contract on Remix, you MUST specify the following parameters:

* Line 39: `"https://your_API_endpoint_url"` - Update to your API Endpoint

* Line 40: `"data,results"` - comma-separated JSON path used to the positive number wanted to be delivered to the requesting smart contract

Note: Arrays within JSON responses can be accessed with proper syntax such as: `"0,data,results"`

* Line 41: `100` - multiplication factor must be used to multiply all the decimal places present within the API JSON response:

Note: If you want your smart contract to receive all 6 significant digits of the number 123.456, you should use a multiplication factor of 1000 (123456).

## Example Chainlink Oracle Setting
If you specify the following parameters

* API Endpoint : https://raw.githubusercontent.com/glinknode/chainlink-public-jobs/main/example-json/example-uint256.json

* JSON Path : `"data_uint256"`

* Multiplication factor : 100
									            
If this example request was used with the example smart contract, it would have returned: `1337`

Note: After the fulfillRequest function is executed, you should divide the result by the previously used multiplication factor to obtain the appropriate number of decimal places for downstream usage.

## Curl Command
Curl command : 
```
curl https://raw.githubusercontent.com/glinknode/chainlink-public-jobs/main/example-json/example-uint256.json
```

JSON API Output:
```
{
  "data_uint256": 13.37
}
```

## Step by step process:
[1] Visit [Remix.org](https://remix.ethereum.org/)

[2] Log in to Metamask and confirm that you're currently on the AVAX Mainnet network

[3] Copy & Paste the entire contents of `Get > Uint256.sol` from this directory

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
If you can't find an answer to your question, welcome to our [Discord](https://discord.gg/KmZVYhYJUy)!  
You can also check out our [website](https://www.glink.solutions)!



