// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "lib/openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";
import "lib/openzeppelin-contracts/contracts/access/Ownable.sol";

contract SensorToken is ERC20, Ownable {
    constructor() ERC20("SensorRewardToken", "SRT") Ownable(msg.sender) {}

    function rewardSensor(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }
}