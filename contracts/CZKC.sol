// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.17;

import "./ERC20.sol";

contract CZKC is ERC20{
    address public owner;
    mapping(address => bool) public minter;

    constructor() {
        name = "CZK Coin";
        symbol = "CZKC";
        decimals = 18;
        owner = msg.sender;
        minter[msg.sender] = true;
    }

    function setOwner(address to) external {
        require(owner == msg.sender);
        owner = to;
    }

    function addMinter(address to) external {
        require(owner == msg.sender);
        minter[to] = true;
    }

    function removeMinter(address to) external {
        require(owner == msg.sender);
        minter[to] = false;
    }

    function mint(address recipient, uint amount) external returns(bool) {
        require(minter[msg.sender] == true);
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