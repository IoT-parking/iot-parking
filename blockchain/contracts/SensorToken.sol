// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

/**
 * @title SensorToken
 * @dev ERC-20 Token for rewarding IoT sensors
 */
contract SensorToken is ERC20, Ownable {
    
    // Event emitted when a sensor is rewarded
    event SensorRewarded(address indexed sensorWallet, uint256 amount);

    /**
     * @param initialOwner Address of the wallet deploying the contract
     */
    constructor(address initialOwner) 
        ERC20("SensorToken", "SENS") 
        Ownable(initialOwner) 
    {
        _mint(initialOwner, 1000000 * 10 ** decimals());
    }

    /**
     * @dev Function to reward a sensor.
     * Can only be called by the contract owner.
     * @param to Address of the sensor wallet to receive the reward.
     * @param amount Amount of tokens to send.
     */
    function rewardSensor(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
        emit SensorRewarded(to, amount);
    }

    /**
     * @dev Helper function to change decimals if you want to avoid large numbers (default is 18).
     */
    function decimals() public view virtual override returns (uint8) {
        return 18; // Standard ERC-20
    }
}