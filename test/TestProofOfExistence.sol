pragma solidity ^0.4.2;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/ProofOfExistence.sol";

contract TestProofOfExistenct {

  function testProofOfExistenceOwner() public {
    ProofOfExistence proofofexistence = new ProofOfExistence();
    Assert.equal(proofofexistence.owner(), this, "An owner want to register image.");
  }

  // store an image proof of existence in the contract state
  function testStoreProof() {

  }

  // calculate and store proof for image
  function testRegisterAsset() {

  }

  // helper function to get image sha256 hash
  function testCheckIfRegistered() {

  }

}