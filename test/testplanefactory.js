const {BN,ether} = require('@openzeppelin/test-helpers');
const {expect} = require('chai');
const factory = artifacts.require('PlaneFactory');

contract(factory, function (accounts) {
  const owner = accounts[0];
  
  beforeEach(async function () {
    this.factoryInstance = await factory.new({from: owner});
    this.factoryInstance.createRandomPlane.call(owner);
  });
/*
  it("génère un avion a un owner", async function() {
    expect(await this.factoryInstance.getPlaneCount(owner).
    to.be.equal(1));
  });
  */
})
