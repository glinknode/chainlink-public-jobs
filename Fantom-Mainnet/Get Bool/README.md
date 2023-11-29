# Get > Bool
This smart contract is designed to retrieve True or False values from our oracle using a public JSON API that is compatible with `curl GET` requests.

## Standard Use Cases:
[1] Returns a Boolean

## Oracle Address & JobID:
[Oracle Address](https://ftmscan.com/address/0x1db329cDE457D68B872766F4e12F9532BCA9149b):  
```
0x1db329cDE457D68B872766F4e12F9532BCA9149b
```
Oracle JobID: 
```
7b5bfa62217845d4acf79867502510b3
```
Oracle Fee: 0.1 [LINK](https://ftmscan.com/address/0x6F43FF82CCA38001B6699a8AC47A2d0E66939407)
```
minContractPaymentLinkJuels = 100000000000000000
```

NOTE: When using Chainlink oracles on Fantom Mainnet, payment must be made using the ERC677 LINK token, rather than the ERC20 LINK token. To bridge the LINK tokens, you can use [multichain.org](https://app.multichain.org/#/router)

## Input Variables:
BEFORE compiling and deploying the smart contract on Remix, you MUST specify the following parameters:

* Line 39: `"https://your_API_endpoint_url"` - Update to your API Endpoint

* Line 40: `"data,results"` - comma-separated JSON path used to the positive number wanted to be delivered to the requesting smart contract

Note: If you want to access arrays within JSON responses, you have to use the proper syntax, such as "0,data,results".

## Example Chainlink Oracle Setting
If you specify the following parameters

* API Endpoint : https://raw.githubusercontent.com/glinknode/chainlink-public-jobs/main/example-json/example-bool.json


* JSON Path : `"data_bool"`

If this example request was used with the example smart contract, it would have returned: `true`

## Curl Command
Curl command : 
```
curl https://raw.githubusercontent.com/glinknode/chainlink-public-jobs/main/example-json/example-bool.json
```

JSON API Output:
```
{
  "data_bool": true
}
```

## Step by step process:
[1] Visit [Remix.org](https://remix.ethereum.org/)

[2] Log in to Metamask and confirm that you're currently on the Fantom Mainnet network

[3] Copy & Paste the entire contents of `Get > Bool.sol` from this directory

[4] Ensure that the input parameters on lines 39-40 are updated for your specific use case

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
