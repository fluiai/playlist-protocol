const MintedCrowdsale = artifacts.require('MintedCrowdsale')

contract('MintedCrowdsale', ([owner, beneficiary, coin]) => {
	let mintedCrowdsale

	beforeEach('setup contact for each test', async () => {
		mintedCrowdsale = await MintedCrowdsale.new(10, owner, coin)
	})

	it('should be initialized contact', async () => {
		// deployed()
		// console.log(mintedCrowdsale)
		const rate = await mintedCrowdsale.rate()
		console.log('rate:',rate.toNumber());
		expect(rate.toNumber()).to.equal(10)

		const wallet = await mintedCrowdsale.wallet()
		console.log('wallet address',wallet.toString());
		expect(wallet).to.equal(owner)

		const token = await mintedCrowdsale.token()
		console.log('token contract',token);
		expect(token).to.equal(coin)

		const weiRaised = await mintedCrowdsale.weiRaised()
		console.log('weiRaised:',weiRaised.toNumber());
		expect(weiRaised.toNumber()).to.equal(0)


	})

	it('accepts funds', async () => {

		//token
		//console.log('owner:',owner.getToken());

		//mintedCrowdsale.buyTokens("0x4695b4ce6057cb92509d6ace5ce60bdbd56de3d9")
		//const balance = balances[owner]
		//console.log('balance:',balance);

	})

	it('empty')

})
