// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.5.0;

interface IBlueSupplyCallback {
    function blueSupplyCallback(uint256 amount, bytes calldata data) external;
}
