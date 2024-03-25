// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 < 0.9.0;


contract LatihanContract {
    function TransferUang(address payable _address) public payable {
        uint amount = msg.value;
        require(amount > 0, "hahahah ether anda tidak ada");
        _address.transfer(amount);
    }
}