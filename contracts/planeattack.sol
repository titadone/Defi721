pragma solidity ^0.5.11;
pragma experimental ABIEncoderV2;

import "./planefactory.sol";
import "./planefuel.sol";

contract PlaneAttack is PlaneFactory, PlaneFuel{

    uint randNonce = 0;
    uint attackVictoryProbability = 60;

  function randMod(uint _modulus) internal returns(uint) {
    randNonce++;
    return uint(keccak256(abi.encodePacked(now,msg.sender,randNonce))) % _modulus;
  }

  function attack(uint _planeId, uint _targetId) external ownerOnlyOf(_planeId) {
    Plane storage myPlane = planes[_planeId];
    Plane storage enemyPlane = planes[_targetId];
    uint rand = randMod(100);
    if (rand <= attackVictoryProbability) {
      myPlane.fightwinCount++;
      myPlane.level++;
      enemyPlane.fightlossCount++;
      repairAndBuild(_planeId, enemyPlane.model);
    } else {
      myPlane.fightlossCount++;
      enemyPlane.fightwinCount++;
      _triggerCooldown(myPlane);
    }
  }
}
