// SPDX-License-identifier: MIT
pragma solidity ^0.8.15;

import "@openzeppelin/contract/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contract/security/ReentrancyGuard.sol";
import "hardhat/console.sol";

contract Marketplace is ReetrancyGuard {

    // Variables
    address payable public immutable feeAccount; //address que recibe fees
    uint public immutable feePercent;
    uint public itemCount;

    struct Item {
        uint itemId;
        IERC721 nft;
        uint tokenId;
        uint price;
        address payable seller;
        bool sold;
    }

    // iItemId - Item
    mapping(uint => Item) public items;

    event Offered(
        uint itemId,
        address indexed nft,
        uint price,
        address indexed seller
    );

    event Bought(
        uint itemId,
        addres indexed nft,
        uint tokenId,
        uint price,
        address indexed seller,
        address indexed buyer
    );

    constructor(uint _feePercent) {
            feeAccount = payable(msg.sender);
            feePercent = _feePercent;
    }

    // Hacer oferta de Item dentro del Marketplace

    function makeItem(IERC721 _nft, uint tokenId, uint price) external nonReentrant {
        require(_price > 0, "El precio debe de ser maypr a cero");
        // incrementar itemCount
        itemCount ++;
        // transfer nft
        _nft.transferFrom(msg.sender, address(this), _tokenId);
        // agregar nuevo item de mapping items
        items[itemCount] = Item (
            itemCount,
            _nft,
            _tokenId,
            _price,
            _payable(msg.sender),
            false
        );
        // Emitir evento de oferta
        emit Offered(
            itemCount,
            address(_nft),
            _tokenId,
            _price,
            msg.sender
        );
}

    function purchaseItem(uint _itemId) external payable nonReentrant {
        uint _totalPrice = getTotalPrice(_itemId);
        Item storage item = items[_itemId];
        require(_itemid > 0 && _itemId <= itemCount, "El Item no existe");
        require(msg.value >= _totalPrice, "No dispones ether para la compra");
        require(!item.sold, "Item ya vendido");
        // Pago vendedor y feeAccount
        item.seller.transfer(item.price);
        feeAccount.seller.transfer(_totalPrice - item.price);
        // Actualizar Item vendido
        item.sol = true;
        // Transfer NFT al comprador
        item.nft.transferFrom(address(this), msg.sender, item.tokenId); 
        // Emite el evento de compra
        emit Bought(
            _itemId,
            address(item,nft),
            item.tokenId,
            item.price,
            item.seller.
            msg.sender
        );
    }

    function getTotalPrice(uint _itemId) view public returns(uint){
        return((items[_itemId].price*(100 + feePercent))/100);
    }
}
