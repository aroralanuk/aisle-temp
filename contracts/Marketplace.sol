//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Marketplace is ReentrancyGuard, Ownable {

    // * Utils
    using Counters for Counters.Counter;
    Counters.Counter private _flightIds;

    // * State
    mapping(address => mapping (address => uint256 )) public reservations;
    mapping(address => AislePass) public flights;


    // * Structs
    struct AislePass {
        address nftContract;
        uint256 flightId;
        string flightCode;
        address payable flightOperator;
        uint256 price;
        string departureCode;
        string arrivalCode;
        uint256 duration;
        uint256 departureTime;
        uint256 arrivalTime;
        uint256 boardingGate;
        // uint256 seats

        // enum for boarding priority

        // uint256 bid;
        // bool isAuction;
        // address highestBidder;
    }

    constructor() {}

    function createFlight(
        address _nftContract,
        address _flightId,
        string _flightCode, 
        uint256 _price, 
        string _departureCode, 
        string _arrivalCode,
        uint256 _duration,
        uint256 _departureTime,
        uint256 _arrivalTime
        uint256 _seats
    ) public nonReentrant {
        require(_price > 0, "Price must be greater than 0.");
        require(_seats > 0, "Seats # must be greater than 0.");

        AislePass memory newFlight = AislePass({
            nftContract: _nftContract,
            flightId: _flightId,
            flightCode: _flightCode, 
            flightOperator: msg.sender,
            price: _price, 
            departureCode: _departureCode,
            arrivalCode: _arrivalCode,
            duration: _duration,
            departureTime: _departureTime,
            arrivalTime: _arrivalTime
        });

        reservations[msg.sender][_flightId] =  _seats;
        flights[_flightId] = newFlight;
    }


}