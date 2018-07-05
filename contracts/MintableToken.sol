pragma solidity ^0.4.24;

import './ownership/Ownable.sol';
import './token/StandardToken.sol';

contract MintableToken is StandardToken, Ownable {

  event Mint(address indexed to, uint256 amount);

  event MintFinished();

  bool public mintingFinished = false;

  address public saleAgent;

  mapping(address => bool) public unlockedAddressesDuringITO;

  address[] public tokenHolders;

  modifier onlyOwnerOrSaleAgent() {
    require(msg.sender == saleAgent || msg.sender == owner);
    _;
  }

  function unlockAddressDuringITO(address addressToUnlock) public onlyOwnerOrSaleAgent {
    unlockedAddressesDuringITO[addressToUnlock] = true;
  }

  modifier notLocked(address sender) {
    require(mintingFinished ||
            sender == saleAgent || 
            sender == owner ||
            (!mintingFinished && unlockedAddressesDuringITO[sender]));
    _;
  }

  function setSaleAgent(address newSaleAgnet) public onlyOwnerOrSaleAgent {
    saleAgent = newSaleAgnet;
  }

  function mint(address _to, uint256 _amount) public returns (bool) {
    require((msg.sender == saleAgent || msg.sender == owner) && !mintingFinished);
    if(balances[_to] == 0) tokenHolders.push(_to);
    totalSupply_ = totalSupply_.add(_amount);
    balances[_to] = balances[_to].add(_amount);
    emit Mint(_to, _amount);
    emit Transfer(address(0), _to, _amount);
    return true;
  }

  /**
   * @dev Function to stop minting new tokens.
   * @return True if the operation was successful.
   */
  function finishMinting() public returns (bool) {
    require((msg.sender == saleAgent || msg.sender == owner) && !mintingFinished);
    mintingFinished = true;
    emit MintFinished();
    return true;
  }

  function transfer(address _to, uint256 _value) public notLocked(msg.sender) returns (bool) {
    return super.transfer(_to, _value);
  }

  function transferFrom(address from, address to, uint256 value) public notLocked(from) returns (bool) {
    return super.transferFrom(from, to, value);
  }

}
