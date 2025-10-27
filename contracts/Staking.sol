// contracts/Staking.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Staking {
    mapping(address => uint256) public stake;

    function deposit() external payable {
        stake[msg.sender] += msg.value;
    }

    function withdraw(uint256 amt) external {
        require(stake[msg.sender] >= amt, "insufficient");
        stake[msg.sender] -= amt;
        payable(msg.sender).transfer(amt);
    }
}
