pragma solidity ^0.4.24;

import './MintTokensInterface.sol';

contract MintTokensFeature is MintTokensInterface {

  function mintTokens(address to, uint tokens) internal {
    token.mint(to, tokens);
  }

  function mintTokensBatch(uint amount, address[] to) public onlyOwner {
    for(uint i = 0; i < to.length; i++) {
      token.mint(to[i], amount);
    }
  }

}
