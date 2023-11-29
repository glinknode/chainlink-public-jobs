# GLINK - Chainlink Node Public Jobs

## Available Networks :rocket:


### Mainnets

- Ethereum
- Avalanche
- Polygon
- Binance Smart Chain
- Arbitrum
- Fantom


### Testnets

- Ethereum Goerli
- Ethereum Sepolia
- Avalanche Fuji
- Polygon Mumbai


## List of jobs :steam_locomotive:

### Comparison table - Mainnet

| Job | Ethereum      | Avalanche     |BSC      |Polygon      |Arbitrum     |Fantrom      |
| --------------------------- | ---------------------------  |  ---------------------------  | ---------------------------  |  ---------------------------  | ---------------------------  | ---------------------------  |
| HTTP Get > Address            |✅ / 1.4 LINK  |✅ / 0.15 LINK    | ✅ / 0.15 LINK   | ✅ / 0.15 LINK   | ✅ / 0.1 LINK    | ✅ / 0.15 LINK    |
| HTTP Get > Bool            |✅ / 1.4 LINK  |✅ / 0.1 LINK    | ✅ / 0.1 LINK   | ✅ / 0.1 LINK   | ✅ / 0.1 LINK    | ✅ / 0.1 LINK    |
| HTTP Get > Bytes           |✅ / 1.4 LINK  |✅ / 0.15 LINK    | ✅ / 0.15 LINK   | ✅ / 0.15 LINK   |✅ / 0.1 LINK    |✅ / 0.15 LINK    |
| HTTP Get > Bytes,Uint256   |✅ / 1.4 LINK  |✅ / 0.15 LINK    | ✅ / 0.15 LINK   | ✅ / 0.15 LINK   |✅ / 0.1 LINK    |✅ / 0.15 LINK    |
| HTTP Get > Int256         |✅ / 1.4 LINK  |✅ / 0.1 LINK    | ✅ / 0.1 LINK    | ✅ / 0.1 LINK   |✅ / 0.1 LINK    |✅ / 0.1 LINK    |
| HTTP Get > Uint256         |✅ / 1.4 LINK  |✅ / 0.1 LINK    | ✅ / 0.1 LINK  | ✅ / 0.1 LINK   | ✅ / 0.1 LINK    | ✅ / 0.1 LINK    |
| HTTP Get > Uint256 - no mult |✅ / 1.4 LINK  |✅ / 0.1 LINK    | ✅ / 0.1 LINK  | ✅ / 0.1 LINK   | ✅ / 0.1 LINK    | ✅ / 0.1 LINK    |
| HTTP Get > Uint256,Uint256 |✅ / 1.4 LINK  |✅ / 0.15 LINK    | ✅ / 0.15 LINK   | ✅ / 0.15 LINK   |✅ / 0.1 LINK    |✅ / 0.15 LINK    |
| HTTP Get > Uint256[]       |✅ / 1.4 LINK  |✅ / 0.15 LINK    | ✅ / 0.15 LINK    | ✅ / 0.15 LINK   | ✅ / 0.1 LINK    | ✅ / 0.15 LINK    |
| HTTP Get > String           |✅ / 1.4 LINK  |✅ / 0.15 LINK    | ✅ / 0.15 LINK   | ✅ / 0.15 LINK   |✅ / 0.1 LINK    |✅ / 0.15 LINK    |

### Comparison table - Testnet

| Job                         | Ethereum - Goerli           | Ethereum - Sepolia           | Avalanche - Fuji           | Polygon - Mumbai           |
| --------------------------- | ------           | ------           | ------           | ------           |
| HTTP Get > Address             | ✅ / 0 LINK   | ✅ / 0 LINK   | ✅ / 0 LINK   |✅ / 0 LINK   |
| HTTP Get > Bool             | ✅ / 0 LINK   | ✅ / 0 LINK   | ✅ / 0 LINK   |✅ / 0 LINK   |
| HTTP Get > Bytes            | ✅ / 0 LINK   | ✅ / 0 LINK   | ✅ / 0 LINK   |✅ / 0 LINK   |
| HTTP Get > Bytes,Uint256          | ✅ / 0 LINK   | ✅ / 0 LINK   | ✅ / 0 LINK   |✅ / 0 LINK   |
| HTTP Get > Int256             | ✅ / 0 LINK   | ✅ / 0 LINK   | ✅ / 0 LINK   |✅ / 0 LINK   |
| HTTP Get > Uint256          | ✅ / 0 LINK   | ✅ / 0 LINK   | ✅ / 0 LINK  |✅ / 0 LINK   |
| HTTP Get > Uint256 - no mult         | ✅ / 0 LINK   | ✅ / 0 LINK   | ✅ / 0 LINK  |✅ / 0 LINK   |
| HTTP Get > Uint256,Uint256  | ✅ / 0 LINK   | ✅ / 0 LINK   | ✅ / 0 LINK   |✅ / 0 LINK   |
| HTTP Get > Uint256[]        | ✅ / 0 LINK   | ✅ / 0 LINK   | ✅ / 0 LINK    |✅ / 0 LINK   |
| HTTP Get > String             | ✅ / 0 LINK   | ✅ / 0 LINK   | ✅ / 0 LINK   |✅ / 0 LINK   |

### GET vs POST

All jobs are in the ’GET’-Format. If you need them as POST please join our [Discord](https://discord.gg/KmZVYhYJUy) or contact us through our [website](https://www.glink.solutions).

#### GET-example: 
```
curl GET https://api-endpoint-example.com
```
#### POST-example: 
```
curl -X POST -H "content-type:application/json" https://api-endpoint-example.com --data '{"input1_key": "input1_value"}'
```

## Private & Custom Data Requests 	:lock:

If you don't see the job you're looking for on the list, or if your API requires authentication, please join our [Discord](https://discord.gg/KmZVYhYJUy) or contact us through our [website](https://www.glink.solutions).

## Troubleshooting: :nut_and_bolt:

Below you find the most common problems when integrating our oracle services. If you need additional support please feel free to join our [Discord Server](https://discord.gg/a69JjGd3y6) anytime. 

+ Check the [Chainlink documentation](https://docs.chain.link/resources/link-token-contracts/) and notes specific to the network you're using to ensure you're using the correct LINK TOKEN (ERC20 vs ERC677) for your oracle requests.

+ Use the oracle address specified in our documentation for the network you're using.

+ Make sure there are no dashes in the job-id loaded into the smart contract for your Oracle request. "-".

+ Before sending an oracle request with your desired API endpoint, verify that the endpoint is accurate for both curl GET formats. If you're making a curl POST request, get in touch with us on [Discord Server](https://discord.gg/KmZVYhYJUy) to handle it properly.

+ Make sure you've identified the correct JSON path from the output of the API endpoint, taking into account array notation like "0" for the first array.


## Contact :iphone:

If you can't find an answer to your question, welcome to our [Discord](https://discord.gg/KmZVYhYJUy)!  
You can also check out our [website](https://www.glink.solutions)!
