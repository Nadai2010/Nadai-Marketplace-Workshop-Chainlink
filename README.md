# Nadai-Marketplace-Workshop-Chainlink
First test Nadai MarketPlace

# Acerca de este repositorio 
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


# Configuración

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
