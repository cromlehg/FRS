pragma solidity ^0.4.24;

import './ownership/Ownable.sol';

contract Token {
  function setSaleAgent(address newSaleAgent) public;
  function transferOwnership(address newOwner) public;
}

contract PreITO {
  function setStart(uint newStart) public;
  function setPeriod(uint newPeriod) public;
  function setPrice(uint newPrice) public;
  function setMinInvestedLimit(uint newMinInvestedLimit) public;
  function setSoftcap(uint newSoftcap) public;
  function setHardcap(uint newHardcap) public;
  function setWallet(address newWallet) public;
  function setNextSaleAgent(address newICO) public;
  function setToken(address newToken) public;
  function transferOwnership(address newOwner) public;
}

contract ITO {
  function setStart(uint newStart) public;
  function addMilestone(uint period, uint bonus) public;
  function setPrice(uint newPrice) public;
  function setMinInvestedLimit(uint newMinInvestedLimit) public;
  function setHardcap(uint newHardcap) public;
  function setWallet(address newWallet) public;
  function addWallet(address wallet, uint percent) public;
  function setToken(address newToken) public;
  function transferOwnership(address newOwner) public;
}

contract TestConfigurator is Ownable {

  Token public token;
  PreITO public preITO;
  ITO public ito;

  function setToken(address _token) public onlyOwner {
    token = Token(_token);
  }

  function setPreITO(address _preITO) public onlyOwner {
    preITO = PreITO(_preITO);
  }

  function setITO(address _ito) public onlyOwner {
    ito = ITO(_ito);
  }

  function deploy() public onlyOwner {

    preITO.setWallet(0x8fD94be56237EA9D854B23B78615775121Dd1E82);
    preITO.setStart(1530921600);
    preITO.setPeriod(48);
    preITO.setPrice(1080000000000000000000);
    preITO.setMinInvestedLimit(100000000000000000);
    preITO.setSoftcap(1000000000000000000);
    preITO.setHardcap(2000000000000000000);
    preITO.setToken(token);

    token.setSaleAgent(preITO);
    preITO.setNextSaleAgent(ito);

    ito.setWallet(0x8fD94be56237EA9D854B23B78615775121Dd1E82);
    ito.setStart(1530921600);
    ito.addMilestone(7, 15);
    ito.addMilestone(7, 13);
    ito.addMilestone(7, 11);
    ito.addMilestone(7, 9);
    ito.addMilestone(7, 7);
    ito.addMilestone(7, 5);
    ito.addMilestone(7, 3);
    ito.setPrice(900000000000000000000);
    ito.setMinInvestedLimit(100000000000000000);
    ito.setHardcap(32777000000000000000000);
    ito.addWallet(0xaa8ed6878a202eF6aFC518a64D2ccB8D73f1f2Ca, 10);
    ito.setToken(token);

    token.transferOwnership(owner);
    preITO.transferOwnership(owner);
    ito.transferOwnership(owner);
  }

}

