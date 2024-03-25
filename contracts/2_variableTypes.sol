// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract VariableTypes {
    // state variable
    // variable ini bisa di gunakan di oleh semua yg ada di dalam contract
    uint sum;


    // local variable
    function tambah(uint num1, uint num2) public  {
        // variable temp ini hanya bisa di gunakan di dalam func ini saja
        // klarna dia bersifat local
        uint temp;
        temp = num1 + num2;
        sum = temp;
    }

    function getHasil() public view returns (uint) {
        return sum;
    }
}

contract Types {
    uint public angkaku = 211;

    int32 public angkamu = -12121;

    bool public valid = false;

    uint32 public ui_data = 31_05_2006;

    bytes public hello = "data bytes";

    string public kalimat = "data string";

    uint8 result;

    function tambah() public{
        // result = 3/5;   tidak mendukung float
        result = 1.5 + 2.5;
    }
}

contract EnumType {
    enum Jobs {Nganggur, Programer, Nguli }

    function getEnum() public pure returns (Jobs) {
        return Jobs.Nguli;
    }
}