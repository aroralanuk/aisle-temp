//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

//import "hardhat/console.sol";
import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/access/Ownable.sol";


// otherwise use opensea 1155 tradable
contract AislePass is ERC1155 {
    constructor(string _flightCode, _seats) public ERC1155("metadata link") {
        _mint(msg.sender, _flightId, _seats, "");
    }
}

// using Counters for Counters.Counter;
// Counters.Counter private _tokenIds;

// contract AislePass is ERC1155, Ownable {
//     constructor(string memory _uri) ERC1155(_uri) {}

//     function mint(address _to, uint256 _quantity,
// 		  bytes memory _data
//   )
//       public
//       onlyOwner returns (uint256)
//   {
//       if(tokenSupply[_id] == 0)
//         require(_id == _currentTokenID, "Wrong id provided");
// 		  _mint(_to, _id, _quantity, _data);
// 		  tokenSupply[_id] = tokenSupply[_id] + _quantity;
//       _incrementTokenTypeId();


//   }
// }