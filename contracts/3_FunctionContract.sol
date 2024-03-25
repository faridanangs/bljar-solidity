// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract HelloWorld {
    uint hasil;

    // memory ini akan menyimpan data secara sementara saat fungsi di eksekusi
    // dan tidak di simpan di blockchain dan ini berfungsi untuk mengurangi biaya gas dan penyimpanan
    function cetakHello() public pure returns (string memory) {
        return "hellllo world";
    }

    function tambah(uint num1, uint num2) public {
        uint hasil2 = num1 + num2;
        hasil = hasil2;
    }

    function getHasil() public view returns (uint){
        return hasil;
    }
}

contract PayAbleContract {
    uint receivedAmount;

    // supaya function ini bisa menerima ether yang dikirim kita gunakan payable
    function receivedEter() payable public {
        // untuk menangkap value ether(biasanya Wey) yang dikirim
        // kita gunakan msg.value untuk menangkap nilainya
        receivedAmount = msg.value;
    }

    function getTotalAmount() public view returns (uint) {
        return receivedAmount;
    }

    // overload
    // ini mendukung fungsinya sama tapi dengan syarat parameternya harus berbeda(lebih or kurang)
    function tambah (uint8 a, uint8 b) public pure returns (uint8 jawaban){
        jawaban = a + b;
    }

    function tambah (uint8 a, uint8 b, uint8 c) public pure returns (uint8){
        uint8 jawaban = a + b + c;
        return  jawaban;
    }
}