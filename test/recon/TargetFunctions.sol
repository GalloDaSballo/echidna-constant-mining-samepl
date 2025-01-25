// SPDX-License-Identifier: GPL-2.0
pragma solidity ^0.8.0;

import {BaseTargetFunctions} from "@chimera/BaseTargetFunctions.sol";
import {BeforeAfter} from "./BeforeAfter.sol";
import {Properties} from "./Properties.sol";
import {vm} from "@chimera/Hevm.sol";
import {Authorization, Signature} from "../../src/interfaces/IMorpho.sol";
import {IMorpho, MarketParams} from "../../src/interfaces/IMorpho.sol";

abstract contract TargetFunctions is BaseTargetFunctions, Properties {
    function morpho_accrueInterest(MarketParams memory marketParams) public {
        morpho.accrueInterest(marketParams);
    }

    function morpho_borrow(MarketParams memory marketParams, uint256 assets, uint256 shares, address onBehalf, address receiver) public {
        morpho.borrow(marketParams, assets, shares, onBehalf, receiver);
    }

    function morpho_createMarket() public returns (MarketParams memory) {
        morpho.createMarket(marketParams);

        return marketParams;
    }

    function morpho_enableIrm(MarketParams memory marketParams) public {
        morpho.enableIrm(irm);
    }

    function morpho_enableLltv(MarketParams memory marketParams) public {
        morpho.enableLltv(lltv);
    }

    function morpho_flashLoan(MarketParams memory marketParams, address token, uint256 assets, bytes memory data) public {
        morpho.flashLoan(token, assets, data);
    }


    function morpho_liquidate(MarketParams memory marketParams, address borrower, uint256 seizedAssets, uint256 repaidShares, bytes memory data) public {
        morpho.liquidate(marketParams, borrower, seizedAssets, repaidShares, data);
    }


    function morpho_liquidate_clamped(uint256 assets) public {
        morpho_liquidate(marketParams, address(this), assets, 0, hex"");
    }

    // Macro

    function morpho_repay(MarketParams memory marketParams, uint256 assets, uint256 shares, address onBehalf, bytes memory data) public {
        morpho.repay(marketParams, assets, shares, onBehalf, data);
    }

    function morpho_setAuthorization(address authorized, bool newIsAuthorized) public {
        morpho.setAuthorization(authorized, newIsAuthorized);
    }

    function morpho_setAuthorizationWithSig(Authorization memory authorization, Signature memory signature) public {
        morpho.setAuthorizationWithSig(authorization, signature);
    }

    function morpho_setFee(MarketParams memory marketParams, uint256 newFee) public {
        morpho.setFee(marketParams, newFee);
    }

    function morpho_setFeeRecipient(address newFeeRecipient) public {
        morpho.setFeeRecipient(newFeeRecipient);
    }

    function morpho_setOwner(address newOwner) public {
        morpho.setOwner(newOwner);
    }

    function morpho_supply(MarketParams memory marketParams, uint256 assets, uint256 shares, address onBehalf, bytes memory data) public {
        morpho.supply(marketParams, assets, shares, onBehalf, data);
    }

    function morpho_supplyCollateral(MarketParams memory marketParams, uint256 assets, address onBehalf, bytes memory data) public {
        morpho.supplyCollateral(marketParams, assets, onBehalf, data);
    }

    function morpho_withdraw(MarketParams memory marketParams, uint256 assets, uint256 shares, address onBehalf, address receiver) public {
        morpho.withdraw(marketParams, assets, shares, onBehalf, receiver);
    }

    function morpho_withdrawCollateral(MarketParams memory marketParams, uint256 assets, address onBehalf, address receiver) public {
        morpho.withdrawCollateral(marketParams, assets, onBehalf, receiver);
    }
}
