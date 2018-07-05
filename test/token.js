import additional from './token/additional';
import basic from './token/basic';
import mintable from './token/mintable';
import ownable from './token/ownable';
import standard from './token/standard';

const token = artifacts.require('DreamToken.sol');

contract('DreamToken - BasicToken test', function (accounts) {
  basic(token, accounts);
});
contract('DreamToken - StandardToken test', function (accounts) {
  standard(token, accounts);
});
contract('DreamToken - Mintable test', function (accounts) {
  mintable(token, accounts);
});
contract('DreamToken - Ownable test', function (accounts) {
  ownable(token, accounts);
});
contract('DreamToken - Additional conditions test', function (accounts) {
  additional(token, accounts);
});
