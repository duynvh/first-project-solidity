pragma solidity ^0.8.4;
import "hardhat/console.sol";

contract HelloWorld {
    string public message;

    constructor(string memory _message) {
        message = _message;
    }

    function print() public view returns (string memory) {
        return message;
    }

    function update(string memory _message) public {
        console.log("message:", _message);
        message = _message;
    }
}
