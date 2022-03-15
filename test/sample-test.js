const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("Hello World", function () {
  const message = "Hello World";
  const messageUpdate = "Bye World";

  it("Should return message correctly", async function () {
    const HelloWorld = await ethers.getContractFactory("HelloWorld");
    const helloWorld = await HelloWorld.deploy(message);

    await helloWorld.deployed();

    expect(await helloWorld.print()).to.be.equal(message);

    await helloWorld.update(messageUpdate);
    expect(await helloWorld.print()).to.be.equal(messageUpdate);
  });
});
