// SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 < 0.9.0;

contract ProofOfExistance {
    mapping(bytes32 => bool) private proofs;

    // menyimpan a bukti of existance in the contract state
    function storeProof(bytes32 proof) private {
        proofs[proof] = true;
    }

    // menghitung dan menyimpan bukti pada sebuah dokument
    function notarize(string memory document) public {
        storeProof(prooffor(document));
    }

    // helper the function to get a documents sha256
    function prooffor(string memory document) private pure returns(bytes32) {
        return sha256(bytes(document));
    }

    // check if a document has been notarized
    function checkDocument(string memory document) public view returns(bool) {
        return proofs[prooffor(document)];
    }
}