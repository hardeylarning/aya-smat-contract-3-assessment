// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract EtherWallet {
    address payable public owner;

    mapping(address => uint)private balances;

    constructor() {
        owner = payable(msg.sender);
    }

    receive() external payable {}

    function withdraw(uint _amount) external {
        require(msg.sender == owner, "caller is not owner");
        payable(msg.sender).transfer(_amount);
    }

    function deposit(uint _amount) public payable {
        require(msg.sender == owner, "caller is not owner");
        balances[msg.sender] += _amount;
    }



    function getBalance() external view returns (uint) {
        return address(this).balance;
    }
}
