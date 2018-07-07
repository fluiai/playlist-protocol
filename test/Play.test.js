const Play = artifacts.require('Play')

contract('Play', () => {
	let play

	beforeEach('setup contract Play', async () => {
		play = await Play.new()
	})

	it('should be initialized contact', async () => {
		// deployed()
		// console.log(mintedCrowdsale)

		await play.setQuestion("0x4695b4ce6057cb92509d6ace5ce60bdbd56de3d9", "title1", "desc1");
		await play.setQuestion("0x4695b4ce6057cb92509d6ace5ce60bdbd56de3d9", "title2", "desc2");

		const result1 = await play.getQuestion(0);

		expect(result1.address).to.equal('')
		expect(result1[1]).to.equal("title1");

		const result2 = await play.getQuestion(1);
		expect(result2[2]).to.equal("desc2");

		console.log('result',result1);
		console.log('result',result2);

		await play.setAnswer(0, "https://www.naver.com", "portal site");
		const answerResult = await play.getAnswer(0);
		console.log('result',answerResult);
	})

	it('created question', async () => {


	})

	//it('empty')

})
