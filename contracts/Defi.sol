pragma solidity >=0.5.0 <0.9.0;
import '../node_modules/@openzeppelin/contracts/token/ERC20/IERC20.sol';

contract Defi{

    //This is the state variable of IERC20
    IERC20 dai;

    constructor(address daiaddress)
    {
        dai=IERC20(daiaddress);
    }

    //This function returns the ether balance of the smart contract
    function getbalance() public view returns(uint){
        return address(this).balance;
    }

    //This function returns the token balance of the smart contract
    function tokenbalance() public returns(uint){
        uint balance=dai.balanceOf(address(this));
        return balance;
    }

    function tokenbalance(address given) public returns(uint)
    {
        uint balance=dai.balanceOf(given);
        return balance;
    }

    //This is the function for transferring the dai tokens from the contract address to the some other address
    //As the msg.sender is the defi smart contract the tokens will be transferred from defi address to the account address
    function transfer(address receipent,uint amount) external
    {
        dai.transfer(receipent,amount);
    }
}