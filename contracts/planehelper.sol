pragma solidity ^0.5.11;
pragma experimental ABIEncoderV2;

import "./planefactory.sol";
import "./ownable.sol";

contract PlaneHelper is PlaneFactory{
    uint levelUpFee = 0.001 ether;
    uint private _balance;

  modifier aboveLevel(uint _level, uint _planeId) {
    require(planes[_planeId].level >= _level, "Votre niveau n'est pas suffisant");
    _;
  }

  function withdraw(address payable _fund) external onlyOwner {
    _fund.transfer(_balance);
  }

  function setLevelUpFee(uint _fee) external onlyOwner {
    levelUpFee = _fee;
  }

  function levelUp(uint _planeId) external payable {
    require(msg.sender != address(0),"Adrresse invalide");
    require(msg.value == levelUpFee,"Vous n'avez pas assez de fee");
    planes[_planeId].level = planes[_planeId].level.add(1);
  }

  function changeName(uint _planeId, string memory _newName) public aboveLevel(2, _planeId) ownerOnlyOf(_planeId) {
    planes[_planeId].name = _newName;
  }

  function changeModel(uint _planeId, uint _newModel) external aboveLevel(10, _planeId) ownerOnlyOf(_planeId) {
    planes[_planeId].model = _newModel;
  }

  function getPlanesByOwner(address _owner) external view returns(uint[] memory) {
    uint[] memory result = new uint[](ownerPlaneCount[_owner]);
    uint counter = 0;
    for (uint i = 0; i < planes.length; i++) {
      if (planeToOwner[i] == _owner) {
        result[counter] = i;
        counter++;
      }
    }
    return result;
  }
}
