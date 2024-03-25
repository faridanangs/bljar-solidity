// SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 < 0.9.0;

contract MapingContract {
    // map ini keynya adalah addres dan valuenya = uint
    mapping(address => address) myMap;

    function setMap(address _adrs) public {
        // cara mngisi map cukup seperti ini keynya = adres dan valuenya idx
        myMap[_adrs] = msg.sender;
    }

    function getMap(address _adrs) public view returns(address) {
        // dan cara memanggilnya ckup kita panggil berdasarkan addressnya
        return myMap[_adrs];
    }

    // maping nested
    mapping(address => mapping(uint => bool)) myNested;
        function setMapNested(address _adrs, uint _idx, bool _ys) public {
        // cara mngisi map cukup seperti ini keynya = adres dan valuenya idx
        myNested[_adrs][_idx] = _ys;
    }

    function getMapNested(address _adrs, uint _idx) public view returns(bool) {
        // dan cara memanggilnya ckup kita panggil berdasarkan addressnya
        return myNested[_adrs][_idx];
    }
}