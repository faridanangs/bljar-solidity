// SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 < 0.9.0;

contract Parent {

    // private *ini hanya bisa di akses oleh semua contractor parentnya
    uint private dataPrivate;
    function setPrivatData(uint a) private view returns(uint) {return dataPrivate + a;}
    function getPrivateData() public view returns(uint) {
        return setPrivatData(10);
    }

    // public *ini bisa di akses di semua contract seperti external,parent,inheritance dll.
    uint info = 30;
    constructor(){
        info = 10;
    }

    function setPublicData(uint a, uint b) public returns(uint){
        return info = a + b;
    }
    function getPublicData() public returns(uint) {
        setPublicData(199, 20);
        return info;
    }


    // internal *ini hanya bisa di akses di contract parennya dan juga inheritance.
    function setInternalData(uint a, uint b) internal pure returns (uint) {
        return a + b;
    }
    function getInternalData() internal pure returns(uint) {
        return setInternalData(10,30);
    }

    // external *bisa mengakses data public dan external saja
    function setDataExternal(uint a, uint b) external pure returns (uint) {
        return a + b;
    }
}

contract External {
    Parent extrnl = new Parent();
    function redDataParent() public returns (uint) {
        return extrnl.getPublicData();
    }

    function getDataExternal() public view returns (uint) {
        return extrnl.setDataExternal(20,40);
    }
}

contract Inheritance is Parent{
    uint public test = info;

    function ambilDataInternal() public pure returns(uint) {
        return getInternalData();
    }
}