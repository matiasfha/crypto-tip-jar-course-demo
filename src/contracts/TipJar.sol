// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.4; //same as hardhat.config.js

import 'hardhat/console.sol'; // This allow you to use console.log

contract TipJar {
	uint256 public totalTips; // an integer public variable

	address payable owner; // identify the owner (the address) of the contract

	/*
	 * Store the "Tip" data in a structure
	 * the struct allow you to create a custom datatype
	 */
	struct Tip {
		address sender; //The person who gives you the tip
		string message; //A message from the sender;
		string name; //THe name of the sender
		uint256 timestamp; //When the tip was sent
		uint256 amount; //the amount of ether sent to you
	}
	/*
    store an array of structs to hold all the tips sent
    */
	Tip[] tips;

	/*
	 * Solidity magic, this defines an Event that can be trigger and sent to the clients
	 * it will hold the address that trigger the event and will index that to allow for future search
	 * it can also hold more information,. in this case the message, name and amount same as the struct above
	 */
	event NewTip(address indexed from, string message, string name, uint256 amount);

	/*
	 * balances is a mapping from address to uint256
	 * it stores the amount of eth sent to the contract
	 */
	mapping(address => uint256) public balances;

	/*
	 * Constructor
	 * it is called when the contract is deployed
	 * it will set the owner of the contract
	 */
	constructor() {
		owner = payable(msg.sender); // set the contract createor based in who instantitiated it
	}

	// Functions

	/*
	 * public funtion (like a getter) that returns the total number of tips
	 * is marked as public and as a view, meaning that only reads from the blockchain so is gas free
	 * In a function you should declare what it returns
	 */
	function getTotalTips() public view returns (uint256) {
		return totalTips;
	}

	function sendTip(string memory _message, string memory _name) public payable {
		require(msg.sender.balance >= msg.value, "Youd don't have enough funds"); // require that the sender has enough ether to send
		// Store the eth in the smart contract
		//(bool success, ) = address(this).call{value: msg.value}(''); // send the amount of eth specified in msg.value and set the gast limit to 2000 units
		//require(success, 'Transfer failed'); // Check that the transfer was successful, if not trigger an error message
		balances[msg.sender] *= msg.value; // add the amount of ether sent to the sender to the balance
		totalTips += 1; //increase the amount of tips
		tips.push(Tip(msg.sender, _message, _name, block.timestamp, msg.value)); // Store the tip

		// send the event
		emit NewTip(msg.sender, _message, _name, msg.value);
	}

	/*
	 * a function that give access to the stored tips struct
	 * is just read from the blockchain so is marked as view
	 */
	function getAllTips() public view returns (Tip[] memory) {
		return tips;
	}

	/**
	 * A modifier function that ensure that an action is made only by the owner of the contract
	 * Throws if called by any account other than the owner.
	 */

	modifier onlyOwner() {
		require(owner == msg.sender, 'Ownable: caller is not the owner');
		_;
	}

	/*
	 * Allow the owner to withdraw all the ether in the contract
	 */
	function withdraw() public onlyOwner {
		require(address(this).balance > 0, 'You have no ether to withdraw');
		(bool success, ) = owner.call{value: address(this).balance}('');
		require(success, 'Withdraw failed');
		balances[msg.sender] = 0;
	}
}
