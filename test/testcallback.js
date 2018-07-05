import ether from './helpers/ether';
import tokens from './helpers/tokens';
import unixTime from './helpers/unixTime';
import {duration} from './helpers/increaseTime';

import callback from './testcallback/callback';

const token = artifacts.require('DreamToken.sol');
const crowdsale = artifacts.require('ITO.sol');
const callbacktest = artifacts.require('CallbackTest.sol');

contract('Callback test', function (accounts) {
  before(config);
  callback(token, crowdsale, callbacktest, accounts);
});

function config() {
  // variables list based on info from README
  this.start = unixTime('10 Sep 2018 00:00:00 GMT');
  this.period = 113;
  this.price = tokens(6000);
  this.hardcap = ether(100000);
  this.minInvestedLimit = ether(0.1);
  this.wallet = '0x98882D176234AEb736bbBDB173a8D24794A3b085';
  this.PercentRate = 100;

  // variables for additional testing convinience
  this.end = this.start + duration.days(this.period);
  this.beforeStart = this.start - duration.seconds(10);
  this.afterEnd = this.end + duration.seconds(1);
}
