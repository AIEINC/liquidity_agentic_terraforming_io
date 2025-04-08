const hre = require("hardhat");

async function main() {
    const AuditCertificate = await hre.ethers.getContractFactory("AuditCertificate");
    const contract = await AuditCertificate.deploy();
    await contract.deployed();
    console.log("AuditCertificate deployed to:", contract.address);
}

main();
