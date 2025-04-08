// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

contract AuditCertificate is ERC721URIStorage {
    uint public tokenCount;

    constructor() ERC721("AuditCertificate", "ACERT") {}

    function mint(string memory _tokenURI) public returns (uint) {
        tokenCount++;
        _mint(msg.sender, tokenCount);
        _setTokenURI(tokenCount, _tokenURI);
        return tokenCount;
    }
}
