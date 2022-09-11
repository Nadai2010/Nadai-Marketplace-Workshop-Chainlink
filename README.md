# About this repository

This is a complete NFT Marketplace with scripts, tests and deploys. Built with Solidity using Hardhat.

# Setting Up


1. Clone the repository

2. Install dependencies

```bash
$ cd workshop-chainlink
$ npm install
```
3. Boot up local development blockchain

```bash
$ npx hardhat node
```

Note: you must have a separate terminal running your node with hardhat in order to deploy.

4. Connect development blockchain accounts to MetaMask

- Copy private key of the addresses and import to MetaMask.
- Connect your metamask to hardhat blockchain, network 127.0.0.1:8545.
- If you have not added hardhat to the list of networks on your metamask, open up a browser, click the fox icon, then click the top center dropdown button that lists all the available networks then click add networks. A form should pop up. For the "Network Name" field enter "Hardhat". For the "New RPC URL" field enter "http://127.0.0.1:8545". For the chain ID enter "1337". Then click save.

5. Deployment
```bash
$ npx hardhat run src/backend/scripts/deploy.js --network localhost
```

6. Tests

```bash
$ npx hardhat test
```

# Contribution

- Create a new branch and open an PR!!