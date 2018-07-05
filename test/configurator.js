import ether from './helpers/ether';
import tokens from './helpers/tokens';
import {advanceBlock} from './helpers/advanceToBlock';
import {increaseTimeTo, duration} from './helpers/increaseTime';
import latestTime from './helpers/latestTime';
import EVMRevert from './helpers/EVMRevert';

const should = require('chai')
  .use(require('chai-as-promised'))
  .use(require('chai-bignumber')(web3.BigNumber))
  .should();

const Configurator = artifacts.require('Configurator.sol');
const Token = artifacts.require('DreamToken.sol');
const PreITO = artifacts.require('PreITO.sol');
const ITO = artifacts.require('ITO.sol');

contract('Configurator integration test', function (accounts) {
  let configurator;
  let token;
  let preito;
  let ito;

  const manager = '0xaaE84d793CFCEcA10E1C5e62400BF743989BC12C';

  before(async function () {
    // Advance to the next block to correctly read time in the solidity "now" function interpreted by testrpc
    await advanceBlock();
    configurator = await Configurator.new();
    await configurator.deploy();

    const tokenAddress = await configurator.token();
    const preitoAddress = await configurator.preITO();
    const itoAddress = await configurator.ito();

    token = await Token.at(tokenAddress);
    preito = await PreITO.at(preitoAddress);
    ito = await ITO.at(itoAddress);
  });

  it('contracts should have token address', async function () {
    const tokenOwner = await token.owner();
    tokenOwner.should.bignumber.equal(manager);
  });

  it('contracts should have preITO address', async function () {
    const preitoOwner = await preito.owner();
    preitoOwner.should.bignumber.equal(manager);
  });

  it('contracts should have ITO address', async function () {
    const itoOwner = await ito.owner();
    itoOwner.should.bignumber.equal(manager);
  });

  it('preITO and ITO should have start time as described in README', async function () {
    const preitoStart = await preito.start();
    preitoStart.should.bignumber.equal((new Date('09 Jul 2018 00:00:00 GMT')).getTime() / 1000);
    const itoStart = await ito.start();
    itoStart.should.bignumber.equal((new Date('10 Sep 2018 00:00:00 GMT')).getTime() / 1000);
  });

  it ('preTCO and ITO should have price as described in README', async function () {
    const preitoPrice = await preito.price();
    preitoPrice.should.bignumber.equal(tokens(12000));
    const itoPrice = await ito.price();
    itoPrice.should.bignumber.equal(tokens(6000));
  });

  it ('preITO and ITO should have hardcap as described in README', async function () {
    const preitoHardcap = await preito.hardcap();
    preitoHardcap.should.bignumber.equal(ether(25000));
    const itoHardcap = await ito.hardcap();
    itoHardcap.should.bignumber.equal(ether(100000));
  });

  it ('preITO and ITO should have minimal insvested limit as described in README', async function () {
    const preitoMinInvest = await preito.minInvestedLimit();
    preitoMinInvest.should.bignumber.equal(ether(0.1));
    const itoMinInvest = await ito.minInvestedLimit();
    itoMinInvest.should.bignumber.equal(ether(0.1));
  });

  it ('preITO and ITO should have wallets as described in README', async function () {
    const preitoWallet = await preito.wallet();
    preitoWallet.should.bignumber.equal('0x30Ba66F9C85D8a7564c9D19f2845b015b36f086a');
    const itoWallet = await ito.wallet();
    itoWallet.should.bignumber.equal('0x09205aD4daAE9090427e81D6b0B3B00169427abb');
  });

});

