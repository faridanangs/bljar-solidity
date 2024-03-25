// SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 < 0.9.0;

contract Payable {
     // Payable address can send Ether via transfer or send
    address payable public owner;

    constructor() payable {
        owner = payable(msg.sender);
    }

    function deposit() public payable  {}

    function getAmount() public view returns(uint) {
        uint amount = address(this).balance;
        return amount;
    }


    // fungsi untuk menarik semua ether dari contract ini
    function withdraw() public {
        uint amount = address(this).balance;

        // kirim semua ether kepada owner
        (bool success,) = owner.call{value: amount}("");
        require(success, "gagal mengirim ether");
    }

    // fungsi untuk mengirim ether dari contract ini ke alamat yang di inputkan
    function transfer(address payable _addrs, uint _amount) public {
        (bool success,) = _addrs.call{value: _amount}("");
        require(success, "gagal mengirim ether");
    }
}