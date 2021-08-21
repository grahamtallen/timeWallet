pragma solidity 0.8.4;
//SPDX-License-Identifier: MIT

import "hardhat/console.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol"; //https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol

contract Allocator {
    using SafeMath for uint256;

  event SetPurpose(address sender, string purpose);
  event FundsSent(address reciever, uint256 amount);
  event AdditionalFundsAllocatted(address reciever, uint256 amount);
  event RecieverJournal(address sender, string message);

  string public purpose = "Storing funds for later allocation";
  address public owner;
  mapping(uint256 => string) public logs;

  constructor() {
      owner = msg.sender;
      // no value by default
  }

  function publicRecieverJournal(address logger, string message) public {
      logs[block.timestamp] = message;
  }

  modifier onlyOwner () {
      require(msg.sender == owner, "Not owner");
      _;
  }

  function approveFundsWithdrawal() onlyOwner {
      require(msg.sender == owner);
      emit FundsSent(msg.sender, purpose);
  }

//  function addAdditionalFunding() onlyOwner payable {

//  }

  function setPurpose(string memory newPurpose) public {
      purpose = newPurpose;
      emit SetPurpose(msg.sender, purpose);
  }
}
