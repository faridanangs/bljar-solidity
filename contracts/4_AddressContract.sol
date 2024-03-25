// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract AddressContract {
    // Address = no rekening  *di gunakan untuk mengirim / menerima ether
    // smart contract memiliki address sendiri

    // di solidity addres memiliki dua rasa yaitu
    //1. address biasa
    //2. address payable *memiliki sub send dan transfer ether


    /////////  Address Biasa
    //// cara 1
    // address public caller;
    // function getCallerAddress1() public returns (address) {
    //     // kita gunakan msg.sender untuk mengambil address orang yang memanggil getCallerAddress ini.
    //     caller = msg.sender;
    //     return caller;
    // }

    // //// Cara 2
    // function getCallerAddress2() public view returns(address caller2) {
    //     return caller2 = msg.sender;
    // }

    // //// Cara 3 *mendapatkan address dari smart contractnya
    // function getAddress() public view returns (address myAddress) {
    //     // akita gunakan address(this) untuk mendapatkan nilai address di dalam function ini
    //     myAddress = address(this);
    //     return myAddress;
    // }



    // langkah ke 2. membuat penampung etherum yg di kirim sebelum menjalankan function transfer dan send
    uint receivedAmount;
    function receivedEther() payable public  {
        receivedAmount = msg.value;
    }

    // langkah ke 1. bellow
    // jika kita menjalankan function di bawah ini dia akan error karna kita belum memiliki
    // ethernya maka dari itu kita harus mempunyai ether dulu baru bisa func bellow 
    /////////  Address PayAble
    function transferFund(address payable _address, uint nominal) public payable {
        require(address(this).balance >= nominal, "Ether anda kurang boy");
        _address.transfer(nominal);
    }

    function sendFund(address payable _address, uint nominal) public payable  {
        require(address(this).balance >= nominal, "Ether anda kurang boy");
        bool ok = _address.send(nominal);
        require(ok, "gagal lol");
    }
}
