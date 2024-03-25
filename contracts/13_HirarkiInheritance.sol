// SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 < 0.9.0;

contract A {
    function fromA() external   pure returns(string memory) {
        return "from A";
    }
}

contract B is A{}

contract C is B {}

contract caller {
    C c = new C();
    B b = new B();

    function fromCaller() public view returns(string memory, string memory) {
        return (c.fromA(), b.fromA());
    }
}