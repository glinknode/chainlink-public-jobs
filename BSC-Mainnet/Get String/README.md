# Get > String
This smart contract is designed to retrieve aa single string from our oracle using a public JSON API that is compatible with `curl GET` requests.

## Standard Use Cases:
[1] Returns a String

## Oracle Address & JobID:
[Oracle Address](https://bscscan.com/token/0x9bA20D237964ce692A73168AdA08163807368040): 
```
0x9bA20D237964ce692A73168AdA08163807368040
```
Oracle JobID: 
```
cd99bc931eea4432abb6b99e9819101d
```
Oracle Fee: 0.15 [LINK](https://bscscan.com/token/0x404460C6A5EdE2D891e8297795264fDe62ADBB75)
```
minContractPaymentLinkJuels = 150000000000000000
```

NOTE: When using Chainlink oracles on BSC Mainnet, payment must be made using the ERC677 LINK token, rather than the ERC20 LINK token. If you need to switch between the two types of LINK tokens, you can use the official Chainlink Platform: [Pegswap](https://pegswap.chain.link/)

## Input Parameters:
BEFORE compiling and deploying the smart contract on Remix, you MUST specify the following parameters:

* Line 36: `"https://your_API_endpoint_url"` - Update to your API Endpoint

* Line 37: `"data,results"` - comma-separated JSON path used to the positive number wanted to be delivered to the requesting smart contract

Note: If you want to access arrays within JSON responses, you have to use the proper syntax, such as "0,data,results".


## Example Chainlink Oracle Setting
If you specify the following parameters

* API Endpoint : https://raw.githubusercontent.com/glinknode/chainlink-public-jobs/main/example-json/example-string.json

* JSON Path : `"data_string"`

If this example request was used with the example smart contract, it would have returned: `chainlink`

## Curl Command
Curl command : 
```
curl https://raw.githubusercontent.com/glinknode/chainlink-public-jobs/main/example-json/example-string.json
```

JSON API Output:
```
{
  "data_string": "chainlink"
}
```

## Step by step process:
[1] Visit [Remix.org](https://remix.ethereum.org/)

[2] Log in to Metamask and confirm that you're currently on the BSC Mainnet network

[3] Copy & Paste the entire contents of `Get > String.sol` from this directory

[4] Ensure that the input parameters on lines 36-37 are updated for your specific use case

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



