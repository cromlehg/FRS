pragma solidity ^0.4.24;

import './AssembledCommonSale.sol';
import './StagedCrowdsale.sol';
import './ExtendedWalletsMintTokensFeature.sol';

contract ITO is ExtendedWalletsMintTokensFeature, StagedCrowdsale, AssembledCommonSale {

  function endSaleDate() public view returns(uint) {
    return lastSaleDate(start);
  }

  function calculateTokens(uint _invested) internal returns(uint) {
    uint milestoneIndex = currentMilestone(start);
    Milestone storage milestone = milestones[milestoneIndex];
    uint tokens = _invested.mul(price).div(1 ether);
    if(milestone.bonus > 0) {
      tokens = tokens.add(tokens.mul(milestone.bonus).div(percentRate));
    }
    return tokens;
  }

  function finish() public onlyOwner {
    mintExtendedTokens();
    token.finishMinting();
  }

}
