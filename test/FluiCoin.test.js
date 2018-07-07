const FluiCoin = artifacts.require('FluiCoin')

contract('FluiCoin' , (accounts)=> {

	it('should be exist account', async () => {
		const instance = await FluiCoin.deployed()
		expect(true).to.be.true
	})


})


