pragma solidity ^0.4.15;

contract ProofOfExistence {
  mapping (string => bool) private proofs;

  // store an image proof of existence in the contract state
  function storeProof(string proof) {
    proofs[proof] = true;
  }
  
  // calculate and store proof for image
  function registerAsset(string assetHash) {
    storeProof(assetHash);
  }

  // helper function to get image sha256 hash
  function checkIfRegistered(string assetHash) view returns (bool) {
    return proofs[assetHash];
  }

}
