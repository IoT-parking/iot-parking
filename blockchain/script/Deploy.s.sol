// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../src/SensorToken.sol";

contract DeployScript is Script {
    function run() external {
        // Klucz prywatny konta #0 z domyślnego mnemonika Anvil
        uint256 deployerPrivateKey = 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80;
        
        // Rozpoczynamy transakcję jako ten użytkownik
        vm.startBroadcast(deployerPrivateKey);

        // Wdrażamy kontrakt
        new SensorToken();

        vm.stopBroadcast();
    }
}