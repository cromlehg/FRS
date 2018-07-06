import additional from './token/additional';
import basic from './token/basic';
import mintable from './token/mintable';
import ownable from './token/ownable';
import standard from './token/standard';

const token = artifacts.require('Token.sol');

contract('Token - BasicToken test', function (accounts) {
  basic(token, accounts);
});
contract('Token - StandardToken test', function (accounts) {
  standard(token, accounts);
});
contract('Token - Mintable test', function (accounts) {
  mintable(token, accounts);
});
contract('Token - Ownable test', function (accounts) {
  ownable(token, accounts);
});
contract('Token - Additional conditions test', function (accounts) {
  additional(token, accounts);
});
