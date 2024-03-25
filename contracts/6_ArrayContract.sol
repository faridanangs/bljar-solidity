// SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 < 0.9.0;

// type data references type di solidity ada 3 yaitu
// 1.array
// 2.struct
// 3.map

contract ArrayContract {
    // array di bagi menjadi dua
    // 1.bersifat fixed

    uint[5] data;
    function getDataFixed() public returns(uint, uint[6] memory) {
        // untuk menentukan panjang arraynya kita taruh di dalamnya contoh uint[5] maka ini panjangnya hanya 5
        // dan jika kita masukan data ke dalam arraynya kita gunakan tipe datanya di bagian awal contoh [uint(10),...]
        // maka data selanjutnya akan terdetengsi sebagai uint

        // dan juga kita bisa edit data refrensi type state di local
         data = [uint(100),200,300,400,500];
         uint[6] memory data2 = [uint(100),200,300,400,500,1000];

         return (data[3], data2);
    }




    // 2. bersifat dinamis
    uint[] dataDinamisInline;
    function getDataDinamis() public returns (uint[] memory, uint[] memory) {
        dataDinamisInline = [100,200,3000,30,23021];//bersifat inline dan kita tidak perlu menentukan typenya di awal" pda saat mnmbah datanya

        // uint[] memory dataDinamisError = new uint[4](100,200,300,400); // jika kita isi seperti ini dia akan error
        uint[] memory dataDinamis = new uint[](3); // yang benar adalah seperti ini
        dataDinamis[0] = 100;
        dataDinamis[1] = 100;
        dataDinamis[2] = 100;

        return (dataDinamisInline, dataDinamis);
    }
}

contract PushAndLength {
    // length
    uint[7] data;
    function getLengthArray() public returns(uint) {
        data = [10,20,32,32];
        return data.length;
    }
    
    uint[] arrpush;
    function pushDataArray() public returns(uint[] memory)  {
        arrpush = [10,20,20];
        arrpush.push(1);
        arrpush.push(7);
        arrpush.pop();
        return arrpush;
    }
}