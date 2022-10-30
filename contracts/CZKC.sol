// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.17;

import "./ERC20.sol";

contract CZKC is ERC20{
    string public name;
    string public symbol;
    uint8 public decimals;
    address public owner;

    constructor() {
        name = "CZK Coin2";
        symbol = "CZKC";
        decimals = 18;
        owner = msg.sender;
    }

    function mint(address recipient, uint amount) external returns(bool) {
        require(owner == msg.sender);
        totalSupply += amount;
        balanceOf[recipient] += amount;
        emit Transfer(address(0), recipient, amount);
        return true;
    }

    function burn(uint amount) external returns(bool) {
        totalSupply -= amount;
        balanceOf[msg.sender] -= amount;
        emit Transfer(msg.sender, address(0), amount);
        return true;
    }
}