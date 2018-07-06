import ether from '../helpers/ether';
import tokens from '../helpers/tokens';
import {advanceBlock} from '../helpers/advanceToBlock';
import {increaseTimeTo, duration} from '../helpers/increaseTime';
import latestTime from '../helpers/latestTime';
import EVMRevert from '../helpers/EVMRevert';

const should = require('chai')
  .use(require('chai-as-promised'))
  .use(require('chai-bignumber')(web3.BigNumber))
  .should();

export default function (Token, Crowdsale, wallets) {
  let token;
  let crowdsale;

  before(async function () {
    // Advance to the next block to correctly read time in the solidity "now" function interpreted by testrpc
    await advanceBlock();
  });

  beforeEach(async function () {
    token = await Token.new();
    crowdsale = await Crowdsale.new();
    await token.setSaleAgent(crowdsale.address);
    await crowdsale.setToken(token.address);
    await crowdsale.setStart(latestTime());
    await crowdsale.setPrice(this.price);
    await crowdsale.setHardcap(this.hardcap);
    await crowdsale.setMinInvestedLimit(this.minInvestedLimit);
    await crowdsale.addMilestone(7, 15);
    await crowdsale.addMilestone(7, 13);
    await crowdsale.addMilestone(7, 11);
    await crowdsale.addMilestone(7, 9);
    await crowdsale.addMilestone(7, 7);
    await crowdsale.addMilestone(7, 5);
    await crowdsale.addMilestone(7, 3);
    await crowdsale.setWallet(this.wallet);
    await crowdsale.addWallet(wallets[3], this.TeamTokensPercent);
  });

  it('should correctly calculate bonus fot team wallet', async function () {
    await crowdsale.sendTransaction({value: ether(100), from: wallets[1]});
    await crowdsale.sendTransaction({value: ether(1), from: wallets[2]});
    const owner = await crowdsale.owner();
    await crowdsale.finish({from: owner});

    const firstInvestorTokens = await token.balanceOf(wallets[1]);
    const secondInvestorTokens = await token.balanceOf(wallets[2]);
    const TeamTokens = await token.balanceOf(wallets[3]);
    const totalTokens = firstInvestorTokens
      .plus(secondInvestorTokens)
      .plus(TeamTokens);
   
    assert.equal(Math.round(TeamTokens.mul(100).div(totalTokens)), this.TeamTokensPercent); 
  });

}
