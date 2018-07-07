var MintedCrowdsale = artifacts.require('./MintedCrowdsale.sol')
var FluiCoin = artifacts.require('./FluiCoin.sol')

module.exports = async (deployer, network, accounts) => {
	const instance = await FluiCoin.deployed()
	return deployer.deploy(MintedCrowdsale, 10, accounts[1], instance.address)
}
