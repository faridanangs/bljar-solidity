// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0 <0.8.0;

contract BasicContract{
    uint storeData;

    // set data
    function set(uint x) public{
        storeData = x;
    }

    // get sata
    function get() public view returns (uint){
        return storeData;
    }
}
