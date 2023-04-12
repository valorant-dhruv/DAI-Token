const Dai = artifacts.require("Dai");
const Defi = artifacts.require("Defi");

module.exports = async function (deployer, _network, accounts) {
  await deployer.deploy(Dai);

  //Now we need to pass the address of the deployed dai smart contract inside the defi smart contract
  const dai = await Dai.deployed();

  await deployer.deploy(Defi, dai.address);

  const defi = await Defi.deployed();

  //Now we call the faucet function to transfer the dai tokens to the defi smart contract
  await dai.faucet(defi.address, 100);

  //This is the balance of the dai tokens in the defi smart contract
  //This is because after minting the tokens the tokens are sent to the defi smart contract because it is the receipent address
  // let balance1 = await defi.tokenbalance();
  let balance1 = await dai.balanceOf(defi.address);
  console.log(
    `${balance1.toNumber()}dai tokens is the balance of the defi smart contract before transferring`
  );
  console.log(typeof balance1);

  //Now we call the transfer function to transfer these dai tokens to the account address from the defi smart contract
  await defi.transfer(accounts[1], 100);

  balance1 = await dai.balanceOf(defi.address);
  let balance2 = await dai.balanceOf(accounts[1]);

  console.log(
    `${balance1.toNumber()} dai tokens is the balance of the defi smart contract after transferring`
  );
  console.log(
    `${balance2.toNumber()}dai tokens is the balance of the accounts[1] smart contract after transferring`
  );
};
