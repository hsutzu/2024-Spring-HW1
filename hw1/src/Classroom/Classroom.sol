// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/* Problem 1 Interface & Contract */
contract StudentV1 {
    uint256 private studentIdCounter = 0;

    function register() external returns (uint256) {
        studentIdCounter += 1;
        return studentIdCounter;
    }
}

/* Problem 2 Interface & Contract */
interface IClassroomV2 {
    function isEnrolled() external view returns (bool);
}

contract StudentV2 {
    IClassroomV2 classroom;

    constructor(address _classroomAddress) {
        classroom = IClassroomV2(_classroomAddress);
    }

    function register() external view returns (uint256) {
        require(classroom.isEnrolled(), "Student is not enrolled");
        // Assuming student ID is 1 for simplicity. Implement your logic as needed.
        return 1;
    }
}

/* Problem 3 Interface & Contract */
contract StudentV3 {
    uint256 registrationFee = 0.01 ether;

    function register() external payable returns (uint256) {
        require(msg.value >= registrationFee, "Insufficient registration fee");
        // Assuming student ID is 1 for simplicity. Implement your logic as needed.
        return 1;
    }
}
