import ether from './helpers/ether';
import tokens from './helpers/tokens';
import unixTime from './helpers/unixTime';
import {duration} from './helpers/increaseTime';

import capped from './preito/capped';
import common from './preito/common';
import refundable from './preito/refundable';
import additional from './preito/additional';

const token = artifacts.require('Token.sol');
const crowdsale = artifacts.require('PreITO.sol');

contract('PreITO - common test', function (accounts) {
  before(config);
  common(token, crowdsale, accounts);
});

contract('PreITO - capped crowdsale test', function (accounts) {
  before(config);
  capped(token, crowdsale, accounts);
});

contract('PreITO - refundable crowdsale test', function (accounts) {
  before(config);
  refundable(token, crowdsale, accounts);
});

contract('PreITO - additional features test', function (accounts) {
  before(config);
  additional(token, crowdsale, accounts);
});

function config() {
  // variables list based on info from README
  this.start = unixTime('15 Jul 2018 00:00:00 GMT');
  this.period = 48;
  this.price = tokens(1080);
  this.softcap = ether(1000);
  this.hardcap = ether(4000);
  this.minInvestedLimit = ether(0.1);
  this.wallet = '0xa86780383E35De330918D8e4195D671140A60A74';
  this.PercentRate = 100;

  // variables for additional testing convinience
  this.end = this.start + duration.days(this.period);
  this.beforeStart = this.start - duration.seconds(10);
  this.afterEnd = this.end + duration.seconds(1);
}
