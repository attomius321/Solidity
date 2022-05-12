// SPDX-License-Identifier: MIT

pragma solidity >=0.8.0;
pragma experimental ABIEncoderV2;

import "@openzeppelin/contracts/utils/math/SafeMath.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract BookStore is Ownable{

    using SafeMath for uint256;

    modifier onlyOwnerOf(string calldata id) {
        require(msg.sender == bookToOwner[id]);
        _;
    }

    struct Book {
        string title;
        uint16 year;
    }

    mapping(address => uint) ownerBookCount;
    mapping(string => address) bookToOwner;

    Book[] _books;

    function addBook(Book memory book, string calldata id) external returns(Book memory) {
        _books.push(book);
        bookToOwner[id] = msg.sender;
        ownerBookCount[msg.sender] = ownerBookCount[msg.sender].add(1);
        return book;
    }

    function getBooks() external view returns(Book[] memory) {
        return _books;
    }

    function getBooksCounterForOwner() external view returns(uint){
        return ownerBookCount[msg.sender];
    }

    // function getBooksByOwner(address _owner) external view returns(uint[] memory) {
    //     uint[] memory results = new uint[](ownerBookCount[_owner]);
    //     uint counter = 0;
    //     for (uint i = 0; i < books.length; i++) {

    //     }
    // }
}