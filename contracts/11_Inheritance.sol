// SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 < 0.9.0;

contract Parent{
    uint data;
    function setData(uint _dta) internal returns(uint) {
        data = _dta;
        return data;
    }
}

contract Usman is Parent{
    function getDataFromParent() external returns(uint) {
        return setData(10);
    }
}

contract caller {
    Usman ank = new Usman();
    function getDataFromChildren() public returns(uint) {
        return ank.getDataFromParent();
    }
}