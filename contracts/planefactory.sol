pragma solidity ^0.5.11;

import "./ownable.sol";
import "./safemath.sol";

contract PlaneFactory is Ownable {

  using SafeMath for uint256;
  using SafeMath16 for uint16;

  event NewPlane(uint planeId, string name, uint model);

  uint modelDigits = 16;
  uint modelModulus = 10 ** modelDigits;
  uint cooldownTime = 1 days;

  struct Plane {
    string name;
    uint model;//model
    uint16 level;
    uint32 readyTimeFuel;
    uint16 fightwinCount;//fightWinCount
    uint16 fightlossCount;//fightLossCount
    uint16 fightCount;
  }

  Plane[] public planes;

  mapping (uint => address) public planeToOwner;
  mapping (address => uint) ownerPlaneCount;

  function _createPlane(string memory _name, uint _model) internal {
    uint id = planes.push(Plane(_name, _model,0,uint32(block.timestamp + cooldownTime),0,0,0)) - 1;
    planeToOwner[id] = msg.sender;
    ownerPlaneCount[msg.sender] = ownerPlaneCount[msg.sender].add(1);
    emit NewPlane(id, _name, _model);
  }

  function _generateRandomModel(string memory _str) private view returns (uint) {
    uint rand = uint(keccak256(abi.encodePacked(_str)));
    return rand % modelModulus;
  }

  function createRandomPlane(string memory _name) public {
    require(ownerPlaneCount[msg.sender] == 0, "");
    uint randModel = _generateRandomModel(_name);
    randModel = randModel - randModel % 100;
    _createPlane(_name, randModel);
  }

  modifier ownerOnlyOf(uint _planeId){
    require(planeToOwner[_planeId] == msg.sender,"Cette avion ne vous appartient pas !");
    _;
  }
}
