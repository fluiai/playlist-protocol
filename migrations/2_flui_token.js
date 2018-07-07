var FluiCoin = artifacts.require("./FluiCoin.sol");

module.exports = async deployer => {
	return deployer.deploy(FluiCoin);
};
