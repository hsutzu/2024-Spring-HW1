// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/* Problem 1 Interface & Contract */
contract StudentV1 {
    // Note: You can declare some state variable
    uint256 private init = 0;
    function register() external returns (uint256) {
        // TODO: please add your implementaiton here
        
        if(init == 0){
            return 1000;
            init++;
        }
        else{
            return 123;
        }
    }
}

/* Problem 2 Interface & Contract */
interface IClassroomV2 {
    function isEnrolled(address) external view returns (bool);
}

contract StudentV2 {
    function register() external view returns (uint256) {
        // TODO: please add your implementaiton here
        IClassroomV2 ClassroomV2 = IClassroomV2(msg.sender);
        if(ClassroomV2.isEnrolled()){
            return 123;
        }
        else{
            return 1000;
        }
    }
}

/* Problem 3 Interface & Contract */
contract StudentV3 {
    function register() external view returns (uint256) {
        // TODO: please add your implementaiton here
        if(gas == 10000){
            return 1000;
        }
        else{
            return 123;
        }
    }
}