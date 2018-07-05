pragma solidity ^0.4.24;

import './TokenProvider.sol';

contract MintTokensInterface is TokenProvider {

  function mintTokens(address to, uint tokens) internal;

}

