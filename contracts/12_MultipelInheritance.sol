// SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 < 0.9.0;

///// cara 1
contract A {
    function fromA() external pure returns(string memory){
        return "dai kontract A";
    }
}

contract B is A {
    function fromB() external pure returns(string memory){
        return "dai kontract B";
    }
}

contract C is B {
    function fromC() external pure returns(string memory){
        return "dai kontract C";
    }
}

contract caller {
    C c = new C();
    function fromCaller() public view returns(string memory, string memory, string memory){
        return (c.fromA(), c.fromB(), c.fromC());
    }
}


// cara 2
contract A2 {
    function fromA(uint _A) internal pure returns(uint) {
        return _A;
    }
}
contract B2 {
    function fromB(uint _B) internal pure returns(uint) {
        return _B;
    }
}

contract C3 is B2,A2{
    function calculateFromC() external pure returns(uint) {
        return fromA(10) + fromB(20);
    }
}

contract caller2 {
    C3 c3 = new C3();

    function callerDia() public view returns (uint) {
        return c3.calculateFromC();
    }
}