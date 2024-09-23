//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "./savings.sol";

contract Manager {
  
  // IERC20 public immutable Token = IERC20(0x0000000000000000000000000000000000000000);
  IERC20 public immutable Token = IERC20(0x4CeE656cb7952258FA69AEEC1cD5752778E3C343);
  SavingsAccount savings = SavingsAccount(0xc255877D53346a82Ae4E713488cb3F91A294D2FA);

  function depositUserTokens(uint amount) external returns (bool) {

    address savingsAddress = address(savings);
    bool transferred = Token.transferFrom(msg.sender, savingsAddress, amount);

    savings.deposit(msg.sender, amount);
    
    return transferred;
  }
}