//SPDX-License-Identifier: GPL2.0
pragma solidity ^0.8.4;

contract iancoin{
	mapping(address=>uint256) public balance;
	address owner;
	string name="Ian Coin";
	string symbol="IAN";
	uint256 totalSupply;

	constructor(uint256 _totalSupply) public {
		owner=msg.sender;
		totalSupply = _totalSupply;
		balance[owner]=_totalSupply;
	}

	event Transfer (
		address _from,
		address _to,
		uint256 _amount
		);

	function balanceOf(address _owner) view public returns (uint256){
		return balance[_owner];
	}
	
   function totalCoins() view public returns (uint256){
   		return totalSupply;
	}
	
	function transfer( address _to, uint256 _amount) public returns (bool success){
		require(balanceOf(msg.sender) >= _amount);
		balance[msg.sender] -= _amount;
		balance[_to] += _amount;
		emit Transfer(msg.sender, _to, _amount);
		return true;
	}
}
