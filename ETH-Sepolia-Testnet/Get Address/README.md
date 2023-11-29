# Get > Address
This smart contract is designed to retrieve address values from our oracle using a public JSON API that is compatible with `curl GET` requests.

## Standard Use Cases:
[1] Returns an Address

## Oracle Address & JobID:
[Oracle Address](https://sepolia.etherscan.io/address/0x6c2e87340Ef6F3b7e21B2304D6C057091814f25E): 
```
0x6c2e87340Ef6F3b7e21B2304D6C057091814f25E
```
Oracle JobID: 
```
420ed4a064d74f63976d8939d7539611
```
Oracle Fee: 0 [LINK](https://sepolia.etherscan.io/token/0x779877A7B0D9E8603169DdbD7836e478b4624789)
```
minContractPaymentLinkJuels = 000000000000000000
```

## Input Parameters:
BEFORE compiling and deploying the smart contract on Remix, you MUST specify the following parameters:

* Line 36: `"https://your_API_endpoint_url"` - Update to your API Endpoint

* Line 37: `"data,results"` - comma-separated JSON path used to the positive number wanted to be delivered to the requesting smart contract

Note: If you want to access arrays within JSON responses, you have to use the proper syntax, such as "0,data,results".

## Example Chainlink Oracle Setting
If you specify the following parameters

* API Endpoint : https://raw.githubusercontent.com/glink/chainlink-public-jobs/example-json/example-address.json

* JSON Path : `"data_address"`

If this example request was used with the example smart contract, it would have returned:`0xcb697bae5f28d9ec85e40f4cde0b295669a9fd93`

## Curl Command
Curl command : 
```
curl https://raw.githubusercontent.com/glink/chainlink-public-jobs/example-json/example-address.json
```

JSON API Output:
```
{
  "data_address": 0xcb697bae5f28d9ec85e40f4cde0b295669a9fd93
}
```

## Step by step process:
[1] Visit [Remix.org](https://remix.ethereum.org/)

[2] Log in to Metamask and confirm that you're currently on the ETH Sepolia Test network

[3] Copy & Paste the entire contents of `Get > Address.sol` from this directory

[4] Ensure that the input parameters on lines 36-37 are updated for your specific use case

[5] Compile and deploy the smart contract

[6] Send the minimum amount of ERC677 LINK required for the number of requests to your newly deployed smart contract.

[6] Click the orange `requestAddress` button in the smart contract Read/Write functionality

[7] Pay the gas fee to send the request to our oracle

[8] Wait approximately 1-2 minutes (1-2 blocks) for the requested data to be delivered to your requesting smart contract

[9] Click the blue `AddressVariable` button to display the returned value from the oracle

## Troubleshooting: :nut_and_bolt:
Please see our troubleshooting guide [here](https://github.com/glink/chainlink-public-jobs/README.md#troubleshooting).

## Contact :iphone:
If you can't find an answer to your question, welcome to our [Discord](https://discord.gg/KmZVYhYJUy)!  
You can also check out our [website](https://www.glink.solutions)!



