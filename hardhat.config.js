require("@nomiclabs/hardhat-waffle");

module.exports = {
  solidity: "0.8.14",
  paths: {
    artifacts: "./src/backend/artifacts",
    sources: "./src/backend/contracts",
    cache: "./src/backend/cache",
    tests: "./src/backend/test"
  },
  networks: {
    hardhat: {
    chainId: 1337 // We set 1337 to make interacting with MetaMask simpler
    },
  },
};