// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/* Problem 1 Interface & Contract */
contract StudentV1 {
    uint256 private studentCounter = 0;
    mapping(uint256 => string) private studentRegistry;

    function register(string calldata name) external returns (uint256) {
        studentCounter += 1;
        studentRegistry[studentCounter] = name;
        return studentCounter;
    }
}

/* Problem 2 Interface & Contract */
interface IClassroomV2 {
    function isEnrolled(address student) external view returns (bool);
}

contract ClassroomV2Mock is IClassroomV2 {
    mapping(address => bool) private enrollments;

    function enroll(address student) external {
        enrollments[student] = true;
    }

    function isEnrolled(address student) external view override returns (bool) {
        return enrollments[student];
    }
}

contract StudentV2 {
    IClassroomV2 classroom;

    constructor(address classroomAddress) {
        classroom = IClassroomV2(classroomAddress);
    }

    function checkEnrollment() external view returns (bool) {
        return classroom.isEnrolled(msg.sender);
    }
}

/* Problem 3 Interface & Contract */
contract StudentV3 {
    struct StudentInfo {
        string name;
        string email;
    }

    uint256 private studentCounter = 0;
    mapping(uint256 => StudentInfo) private studentDetails;

    function register(string calldata name, string calldata email) external returns (uint256) {
        studentCounter += 1;
        studentDetails[studentCounter] = StudentInfo(name, email);
        return studentCounter;
    }

    function isRegistered(uint256 studentId) external view returns (bool) {
        return bytes(studentDetails[studentId].name).length > 0;
    }
}
