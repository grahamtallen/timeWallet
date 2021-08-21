pragma solidity 0.8.4;
//SPDX-License-Identifier: MIT

import "hardhat/console.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol"; //https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol

contract YourContract {
    using SafeMath for uint256;

  event SetPurpose(address sender, string purpose);
  event FundsSent(address reciever, uint256 amount);
  event AdditionalFundsAllocatted(address reciever, uint256 amount);
  event RecieverJournal(address sender, string message);

  string public purpose = "Storing funds for later allocation";
  address public owner = 0x44719C634c37798c6961c0D33fB20e9Bc618Ffb4;
  mapping(uint256 => string) public logs;

  constructor() {
      // owner = msg.sender;
      // no value by default
  }

  function publicRecieverJournal(address logger, string memory message) public {
      logs[block.timestamp] = message;
  }

  modifier onlyOwner () {
      require(msg.sender == owner, "Not owner");
      _;
  }

  //function approveFundsWithdrawal() onlyOwner public {
  //    require(msg.sender == owner);
  // does this send? does another recieve function send?
  //    emit FundsSent(msg.sender, purpose);
  //}

//  function addAdditionalFunding() onlyOwner payable {

//  }

  function setPurpose(string memory newPurpose) public {
      purpose = newPurpose;
      emit SetPurpose(msg.sender, purpose);
  }
}
