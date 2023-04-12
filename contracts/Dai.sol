// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import '../node_modules/@openzeppelin/contracts/token/ERC20/ERC20.sol';

 contract Dai is ERC20{
  constructor()  ERC20("Dai Stablecoin","DAI")
  {

  }

  //We need to send some dai tokens to the defi smart contract
  

  //For this we have the faucet function 
  //With the help of this function we will have dai tokens inside the dai smart contract and then we transfer these tokens to the defi 
  //smart contract

  //A crypto currency faucet is a system that dispenses tokens to users upon request. 
  function faucet(address receipent,uint amount) external
  {
    //What this means is that the faucet function will be called dai and then it mints some dai tokens
    //These minted dai tokens are then sent to the defi smart contract which is the receipent
    _mint(receipent,amount);
  }
}