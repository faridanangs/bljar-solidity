// SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 < 0.9.0;

interface IERC20 {
    function transfer(address, uint256) external;
}


contract Token {
    function transfer(address, uint256) external{}
}

contract AbiEncode {

    function deposite() public payable {}

    event Log(string func, uint256 gas);

    fallback() external payable { 
        emit Log("fallback", gasleft());
    }
    receive() external payable {
        emit Log("receive", gasleft());
    }

    function test(address _contract, string calldata data) external  {
        (bool ok,) = _contract.call(bytes(data));
        require(ok, "call failed");
    }

    function encodeWithSignature(address to, uint256 amount) external pure returns (bytes memory) {
        return abi.encodeWithSignature("transfer(address, uint256", to, amount);
    }

    function encodeWithSelector(address[] memory to, uint256 amount) external pure returns (bytes memory){
        bytes memory result;
        for (uint i = 0; i < to.length; i++){
            result = abi.encodeWithSelector(IERC20.transfer.selector, to, amount);
        }
        return result;
    }

    function encodeCall(address to, uint256 amount) external pure returns (bytes memory) {
        return abi.encodeCall(IERC20.transfer, (to, amount));
    }
}