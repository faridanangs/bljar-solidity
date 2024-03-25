// SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 < 0.9.0;

// lokasi data *dimana setiap variable itu di simpan 
// biaya gas fee *tergantung dari lokasi data yang kita gunkan
// jika kita bisa menempatkan data yang tepat itu bisa mengurangi biaya gas fee


////// jenis lokasi data
// storage *ini dia di simpan di sistem dan bersifat permanent(gas lbih besar) dan dia berada di state or di luar function" supaya bisa di gunakan
// memory *biaya gasnya lebih murah di simpan sementara dan hanya bisa di gunakan di dalam function itu saja
// calldata *data yang tidak bisa di moditifikasi dan tetap dan lokasi default parameternya
// stack *bersifat tidak tetap yang di kelola langsung olek evm, lokasi stake ini sampe 1024 ether

// // contract DataLocationContract {
//     // storage (state) bisa di akses oleh banyak contract
//     uint stateStorage;

//     // uint storage stateStorage; dia akan *error* karna kita tidak perlu menedfinisikan storagenya
//     // karna dia sudah otomatis di definisikan sbagai storage

//     //  parameter function / return ini akan tersimpan di dalam memory scrara otomatis
//     function kalkulasi(uint a, uint b) public pure returns(uint){
//         return a + b;
//     }
// }

// contract Locations {
//     // state storage
//     bool isReady;

// //     function iniFungsi() public {
//         // local memory, semua data di dalam func ini bersifat memory
//         bool isOke;
//         uint number;
//         address akun; 
//     }

// }



contract Locatoins {
    uint stateVar = 10;
    function iniHasil() public returns(uint) {
        uint localVar = 40;
        stateVar = localVar;
        localVar = 10;
        return stateVar;
        // ini hasilnya 40 kenapa tidak 10 seperti type references karna statevar ini dia mencopy datanya.
        // sehingga ketika data induknya di ubah data yang sudah di kopi tidak ikut berubah.
    }

    function refrencesTypes() public pure returns(uint[] memory, uint[]memory) {
        // jika di refrences type kita harus mendefinisikan dulu locationya
        uint[] memory refrencesType1 = new uint[](3);

        refrencesType1[0] = 10;
        refrencesType1[1] = 30;
        refrencesType1[2] = 50;

        uint[] memory refrencesType2 = refrencesType1;
        refrencesType1[0] = 100;
        return (refrencesType1, refrencesType2);
        // jika kita lihat di sini hasilnya adalah 100,30,50 kenapa tidak 10 karna data induknya kita ubah
        // otomatis yang menggunakan data tersebut akan ikut berubah karna dia tidak mencopy datanya.
        // dia ini berbeda dengan type value.
    }
}

