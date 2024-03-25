// SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 < 0.9.0;

abstract contract Abstract{
    address payable owner;
    // kita tandai func ini sebagai virtual supaya tdk error
    function getAddress() internal virtual;
    function withdraw() external virtual;

} 

contract Iplm is Abstract {
    // kemudian kita gunakan override untuk menggunakan func yang ada di abstract spya td error
    function getAddress() internal override{}
    function withdraw() external override{}
}