// SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 < 0.9.0;

contract StructContract {
    struct Buku {
        string judul;
        string pnulis;
        uint id;
        bool isReady;
    }

    // cara 1
    Buku buku1;
    function tambahBuku1() public {
        buku1 = Buku("Web3", "anangs", 1, true);
    }
    
    function lihatBuku1() public view returns(string memory, string memory, uint, bool) {
        return (buku1.judul, buku1.pnulis, buku1.id, buku1.isReady);
    }

    Buku buku2 = Buku("Web3", "anangs", 1, true);
    function lihatBuku2() public view returns(string memory, string memory) {
        return (buku2.judul, buku2.pnulis);
    }

    Buku[] buku3;
    function bukuBaru3(string memory j, string memory p, uint id, bool ada) public {
        buku3.push(Buku(j,p, id, ada));
    }

    function lihatBukuById(uint _index) public view returns (string memory, string memory, uint, bool) {
        Buku storage buku = buku3[_index];
        return (buku.judul, buku.pnulis, buku.id, buku.isReady);
    }

    function lihatBuku(string[] memory judulbuku) public returns(string memory) {
        string memory judulBukuuuLoop;
        for (uint i = 0; i < judulbuku.length; i++){
            buku3.push(Buku({
                judul: judulbuku[i],
                pnulis: "oko",
                id: i,
                isReady: true
            }));

            judulBukuuuLoop = buku3[i].judul;
        }

        return judulBukuuuLoop;
    }
}