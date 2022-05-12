const { ethers } = require("hardhat");

async function main() {
    const [deployer] = await ethers.getSigners();
    console.log("Deploying contracts with the account: ", deployer.address);

    console.log("Account balance: ", (await deployer.getBalance()).toString());

    const BookStore = await ethers.getContractFactory("BookStore");
    const bookStore = await BookStore.deploy();

    console.log("BookStore address: ", bookStore.address);
}

main().then(() => process.exit(0))
      .catch((err) => {
          console.error(err);
          process.exit(1);
})