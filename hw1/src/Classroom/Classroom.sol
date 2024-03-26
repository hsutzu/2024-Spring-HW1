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

    // Constructor takes an address of a contract that implements IClassroomV2
    constructor(address _classroomAddress) {
        require(_classroomAddress != address(0), "Invalid address");
        classroom = IClassroomV2(_classroomAddress);
    }

    // Function to handle student registration
    function register() external view returns (uint256) {
        // Check if the caller of this function is enrolled
        require(classroom.isEnrolled(), "Student is not enrolled");

        // Assuming student ID is 1 for simplicity. In a real scenario, you would have some logic
        // to assign a unique ID to each student who registers.
        // This could be a state variable that increments with each registration, for example.
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
