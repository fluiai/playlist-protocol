var Play = artifacts.require("./Play.sol");

module.exports = async deployer => {
	return deployer.deploy(Play);
};
