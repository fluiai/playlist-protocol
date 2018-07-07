const Farm = artifacts.require('Farm')

contract('Farm', (accounts) => {
    it("get farmOrder", async () => {
        const instance = await Farm.deployed()
        const farmOwner = await instance.farmOwner.call()
        expect(farmOwner).to.equal(accounts[0])
    })
})