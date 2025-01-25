// SPDX-License-Identifier: GPL-2.0
pragma solidity ^0.8.0;

import {BaseSetup} from "@chimera/BaseSetup.sol";
import {ERC20} from "./mocks/ERC20.sol";
import {OracleMock} from "../../src/mocks/OracleMock.sol";
import {Morpho} from "../../src/Morpho.sol";
import {IrmMock} from "../../src/mocks/IrmMock.sol";
import {IMorpho, MarketParams} from "../../src/interfaces/IMorpho.sol";

abstract contract Setup is BaseSetup {
    //A market needs a loanToken , a collateralToken an oracle etc

    // address of loanToken
    ERC20 public loanToken;
    // address of collateralToken
    ERC20 public collateralToken;
    // address of oracle
    address public oracle;
    // address of irm
    address public irm;
    // lltv
    uint256 public lltv;

    // deployer
    address owner = msg.sender;

    // address of morpho
    Morpho public morpho;
    // market parameters
    MarketParams marketParams;

    function setup() internal virtual override {
        // deploy loanToken
        loanToken = new ERC20("loanToken", "LOAN");
        // deploy collateralToken
        collateralToken = new ERC20("collateralToken", "COLL");
        // deploy oracle
        oracle = address(new OracleMock());
        // deploy irm
        irm = address(new IrmMock());

        // deploy 1 morpho
        morpho = new Morpho(address(this));
        // set the market parameters for creating a new market
        marketParams = MarketParams(address(loanToken), address(collateralToken), address(oracle), address(irm), lltv);
        // NOTE: WE CLAMP THE MARKETS
        // Should just deploy and mint stuff
    }

    // Add a new market
    // Switch market
    // Market input is gone (everythign or from clamped)
}
