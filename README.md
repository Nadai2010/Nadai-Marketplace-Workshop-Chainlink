 <h4>Nadai Marketplace Workshop Chainlink.</h4>

</div>

---
## Tabla de contenido <!-- omit in toc -->
- [Nadai-Marketplace-Workshop-Chainlink](#nadai-marketplace-workshop-chainlink)
- [Acerca de este repositorio ](#acerca-de-este-repositorio)
- [Configuración](#configuración)
- [Configuración y Deploy en red pruebas GOERLI](#configuración-y-deploy-en-red-pruebas-goerli)
  - [Modificaciones .ENV](#modificaciones-env)
  - [Modificaciones en Hardhat config](#modificaciones-en-hardhat-config)
  - [Deploy y Verificación en goerli](#deploy-y-verificación-en-goerli)

## Nadai-Marketplace-Workshop-Chainlink
Nadai MarketPlace

## Acerca de este repositorio 
Este es un NFT Marketplace completo con scripts, pruebas e implementaciones. Construido con Solidity usando Hardhat.

Info Hardhat
-https://hardhat.org/tutorial

Info Workshop
Chainlink Workshop | Crea tu propio Marketplace de NFTs con Solidity - Parte 1
-https://www.youtube.com/watch?v=hXd3YipSwGQ

Chainlink Workshop | Crea tu propio Marketplace de NFTs con Solidity - Parte 2
-https://www.youtube.com/watch?v=n8Y-9pHFCcA

Chainlink Workshop | Crea tu propio Marketplace de NFTs con Solidity - Parte 3
-https://www.youtube.com/watch?v=4r3UNdBRonI

## Configuración

1. Clonar repositorio.

2. Instalar dependencias

```bash
$ cd Marketplace
$ npm install
```
3. Inicie la cadena de bloques de desarrollo local

```bash
$ npx hardhat node
```

Nota IMPORTANTE: debe tener una terminal separada que ejecute su nodo con casco para poder implementar.

4. Conecte las cuentas de blockchain de desarrollo a MetaMask

- Copie la clave privada de las direcciones e importe a MetaMask. 
- Conecte su metamáscara a la cadena de bloques hardhat, red 127.0.0.1:8545. 
- Si no ha agregado un casco a la lista de redes en su metamáscara, abra un navegador, haga clic en el ícono del zorro, luego haga clic en el botón desplegable central superior que enumera todas las redes disponibles y luego haga clic en agregar redes. Debería aparecer un formulario. Para el campo "Nombre de la red", ingrese "HardHat". Para el campo "Nueva URL de RPC", ingrese "http://127.0.0.1:8545". Para el ID de la cadena, ingrese "1337". Luego haga clic en guardar.

5. Despliegue
```bash
$ npx hardhat run src/backend/scripts/deploy.js --network localhost
```

6. Tests

```bash
$ npx hardhat test
```
## Configuración y Deploy en red pruebas GOERLI

En esta parte del tutorial haremos el deploy y verificación del Smart con Hardhat en testnet GOERLI, con tu RPC de ALCHEMY y tu API KEY de ETHERSCHAN. Enlaces directos aqui                                                                                                                
-https://etherscan.io/myapikey                                                                                                     
-https://auth.alchemyapi.io/                                                                                                          

### Modificaciones .ENV
Añadiremos un archivo en la raiz .env con los siguientes parámatros:
```bash
#GOERLI CREDENCIALES
GOERLI_RPC_URL="RPC creada en alchemy o otra RPC como la Standar de Goerli Ifura"
PRIVATE_KEY="Clave privada de la cuenta de Metamask que vayas hacer el deploy"
ETHERSCAN_API_KEY="Api Key creada en Etherscan para verificación del Smart"
```
### Modificaciones en Hardhat config
Necesitamos añadir librerias en el hardhah.config que instalremos con los comandos.
```bash
sudo npm install --save-dev @openzeppelin/hardhat-upgrades
sudo npm install --save-dev @nomiclabs/hardhat-ethers
sudo npm install --save-dev @nomiclabs/hardhat-etherscan
sudo npm install --save-dev dotenv
```
Las nuevas modificaciones en el archivo HardHat.config quedaria:
```code
// Reemplace los datos en .env de clave privada con la clave privada de su cuenta de Goerli 
// Para exportar su clave privada de Metamask, abra Metamask y vaya a Detalles de la cuenta 
// Exportar clave privada
// Cuidado: NUNCA ponga Ether real en las cuentas de prueba.

require("@nomiclabs/hardhat-waffle");
require("@nomiclabs/hardhat-ethers");
require("@openzeppelin/hardhat-upgrades");
require("@nomiclabs/hardhat-etherscan");
require("dotenv").config();

const GOERLI_RPC_URL = process.env.GOERLI_RPC_URL
const PRIVATE_KEY = process.env.PRIVATE_KEY
const ETHERSCAN_API_KEY = process.env.ETHERSCAN_API_KEY

module.exports = {
  solidity: "0.8.14",
  paths: {
    artifacts: "./src/backend/artifacts",
    sources: "./src/backend/contracts",
    cache: "./src/backend/cache",
    tests: "./src/backend/test"
  },
  networks: {
    goerli: {
    url: GOERLI_RPC_URL,
    accounts: PRIVATE_KEY !==undefined ? [PRIVATE_KEY]:[], 
    },
  },
  etherscan: {
    apiKey: {
      goerli: ETHERSCAN_API_KEY,
 },
 },
}
```
### Deploy y Verificación en goerli
Si todo ha ido como esperamos al usar
```bash 
npx hardhat run src/backend/scripts/deploy.js --network goerli
```
Os saldrá un mensaje
```bash
Deployando el Smart en la cuenta X.
```
Ahora entraremos en goerliscan para revisar 
que efectivamente se ha creado el smart, el cual falta verificarlo para leer y escribir en él. Usaremos.
```bash
npx hardhat verify --network goerli 0xEl smart que acabamos de deployar
```
Si todo va bien nos dará un mensaje
```bash
Successfully submitted source code for contract
```

Podrá entrar a su https://goerli.etherscan.io/ y comprobar que todo ha ido bien.

