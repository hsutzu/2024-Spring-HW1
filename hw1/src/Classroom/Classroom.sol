/* // SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/* Problem 1 Interface & Contract */
contract StudentV1 {
    uint256 private studentCounter = 0;
    mapping(address => uint256) private studentIDs;

    function register() external returns (uint256) {
        require(studentIDs[msg.sender] == 0, "Student is already registered.");
        studentCounter++;
        studentIDs[msg.sender] = studentCounter;
        return studentCounter;
    }
}

/* Problem 2 Interface & Contract */
interface IClassroomV2 {
    function isEnrolled() external view returns (bool);
}

contract StudentV2 implements IClassroomV2 {
    function isEnrolled() external pure override returns (bool) {
        // Simulation of an enrollment check
        return true; // assuming the student is enrolled for demonstration
    }

    function register() external pure returns (uint256) {
        // Since it's a view function, we cannot modify state, so we simulate a registration
        return 1; // Assume a fixed ID for demonstration
    }
}


/* Problem 3 Interface & Contract */
contract StudentV3 {
    uint256 private studentCounter = 0;
    mapping(address => uint256) private studentIDs;

    function register() external returns (uint256) {
        require(studentIDs[msg.sender] == 0, "Student already registered.");
        studentCounter++;
        studentIDs[msg.sender] = studentCounter;
        // Additional logic could go here. For simplicity, we'll just return the ID.
        return studentCounter;
    }
}
*/