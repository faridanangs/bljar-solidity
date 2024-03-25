// SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 < 0.9.0;

contract DappVoting {
    
    struct Pemilih{
        address pemilih;
        uint jmlhPilih;
        bool sudahMemilih;
        uint dipilih;
    }

    struct Peserta{
        string nama;
        uint suara;
    }

    address panitiaPemilihan;
    Peserta[] public pesertas;
    mapping(address => Pemilih) public pemilihs;

    // akan menerima nama" calon peserta
    constructor(string[] memory namaPeserta){
        panitiaPemilihan = msg.sender;
        pemilihs[panitiaPemilihan].jmlhPilih = 1;

        for (uint i = 0; i < namaPeserta.length; i++){
            pesertas.push(Peserta({
                nama: namaPeserta[i],
                suara: 0
            }));
        }
    }

    // menentukan siapa saja yang boleh memilih
    function bolehMemilih(address _pemilih) public {
        require(panitiaPemilihan == msg.sender, "anda tidak berhak melakuakn ini");
        require(!pemilihs[_pemilih].sudahMemilih, "anda sudah memilih");
        require(pemilihs[_pemilih].jmlhPilih == 0);
        pemilihs[_pemilih].jmlhPilih = 1;
    }

    // memberikan suara kepada para peserta
    function berikanSuara(uint noPeserta) public {
        Pemilih storage pemilih = pemilihs[msg.sender];
        require(pemilih.jmlhPilih != 0, "anda tidak boleh memilih");
        require(!pemilih.sudahMemilih, "anda sudah memilih");
        pemilih.sudahMemilih = true;
        pemilih.dipilih = noPeserta;

        pesertas[noPeserta].suara += pemilih.jmlhPilih;
    }

    // pemenangPemilihanSuara
    function pemenangPemilihanSuara() public view returns (uint _indexPemenang) {
        uint penympanSuara = 0;
        for (uint i = 0; i < pesertas.length; i ++){
            if (pesertas[i].suara > penympanSuara){
                penympanSuara = pesertas[i].suara;
                _indexPemenang = i;
            }
        }
    }

    // akun pemenang
    function lihatNamaPemenang() public view returns(string memory) {
        return pesertas[pemenangPemilihanSuara()].nama;
    }
}