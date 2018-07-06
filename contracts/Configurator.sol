pragma solidity ^0.4.24;

import './ownership/Ownable.sol';
import './Token.sol';
import './PreITO.sol';
import './ITO.sol';

contract Configurator is Ownable {

  Token public token;

  PreITO public preITO;

  ITO public ito;

  function deploy() public onlyOwner {

    token = new Token();

    preITO = new PreITO();

    preITO.setWallet(0xEA15Adb66DC92a4BbCcC8Bf32fd25E2e86a2A770);
    preITO.setStart(1531612800);
    preITO.setPeriod(48);
    preITO.setPrice(1080000000000000000000);
    preITO.setMinInvestedLimit(100000000000000000);
    preITO.setSoftcap(1000000000000000000000);
    preITO.setHardcap(4000000000000000000000);
    preITO.setToken(token);

    token.setSaleAgent(preITO);

    ito = new ITO();

    ito.setWallet(0xEA15Adb66DC92a4BbCcC8Bf32fd25E2e86a2A770);
    ito.setStart(1535760000);
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
    ito.addWallet(0xEA15Adb66DC92a4BbCcC8Bf32fd25E2e86a2A770, 10);
    ito.setToken(token);

    preITO.setNextSaleAgent(ito);

    address manager = 0xEA15Adb66DC92a4BbCcC8Bf32fd25E2e86a2A770;

    token.transferOwnership(manager);
    preITO.transferOwnership(manager);
    ito.transferOwnership(manager);
  }

}

