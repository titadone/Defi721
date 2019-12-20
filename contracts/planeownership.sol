pragma solidity ^0.5.11;
pragma experimental ABIEncoderV2;

import "./planeattack.sol";
import "./erc721.sol";
import "./safemath.sol";
import "./planefactory.sol";


contract PlaneOwnership is PlaneFactory, ERC721 {

  using SafeMath for uint256;

  mapping (uint => address) planeApprovals;

  function balanceOf(address _owner) public view returns (uint256 _balance) {
    return ownerPlaneCount[_owner];
  }

  function ownerOf(uint256 _planeId) public view returns (address _owner) {
    return planeToOwner[_planeId];
  }

  function _transfer(address _from, address _to, uint256 _planeId) private {
    require(_from != address(0),"Adrresse invalide");
    require(_to != address(0),"Adrresse invalide");
    ownerPlaneCount[_to] = ownerPlaneCount[_to].add(1);
    ownerPlaneCount[msg.sender] = ownerPlaneCount[msg.sender].sub(1);
    planeToOwner[_planeId] = _to;
    emit Transfer(_from, _to, _planeId);
  }

  function transfer(address _to, uint256 _planeId) public ownerOnlyOf(_planeId) {
    _transfer(msg.sender, _to, _planeId);
  }

  function approve(address _to, uint256 _planeId) public ownerOnlyOf(_planeId) {
    planeApprovals[_planeId] = _to;
    emit Approval(msg.sender, _to, _planeId);
  }

  function takeOwnership(uint256 _planeId) public {
    require(planeApprovals[_planeId] == msg.sender,"Vous n'etes pas approuvé pour ce transfert !");
    address owner = ownerOf(_planeId);
    _transfer(owner, msg.sender, _planeId);
  }
}
