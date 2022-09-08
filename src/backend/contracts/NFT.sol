// SPDX-License-identifier: MIT
pragma solidity ^0.8.15;

import "@openzeppelin/contract/token/ERC721/extensions/ERC721URIStorage.sol";

contract NFT is ERC721URIStorage {
    unit public tokenCount;

    constructor() ERC721("NadaiMarketPlace","NAI") {}

    function mint(string memory _tokenURI) external returns(unit) {
        tokenCount ++;
        _safeMint(msg.sender, tokenCount);
        _setTokenURI(tokenCount, _tokenURI);
        return(tokenCount);
    }
}
