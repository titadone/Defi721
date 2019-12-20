pragma solidity ^0.5.11;
pragma experimental ABIEncoderV2;

import "./planefactory.sol";

contract PlaneFuel is PlaneFactory {

    uint refuelFee = 0.1 ether;

    function _triggerCooldown(Plane storage _plane) internal {
        _plane.readyTimeFuel = uint32(block.timestamp + cooldownTime);
    }

    function _isReady(Plane memory _plane) public view returns (bool) {
      return (_plane.readyTimeFuel >= block.timestamp);
    }

    function refuel(uint _planeId)public payable{
        require(msg.value >= refuelFee,"Pas assez de fond pour recharger en fuel");
        planes[_planeId].readyTimeFuel = uint32(block.timestamp+ cooldownTime);
    }

    function repairAndBuild(uint _planeId, uint _targetModel) public ownerOnlyOf(_planeId) {
        Plane storage myPlane = planes[_planeId];
        require(_isReady(myPlane),"Votre avion n'est pas encore prêt");
        _targetModel = _targetModel % modelModulus;
        uint newModel = (myPlane.model + _targetModel) / 2;
        _createPlane("NoNamePlane", newModel);
        _triggerCooldown(myPlane);
    }

}
