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

    preITO.setWallet(0x89C92383bCF3EecD5180aBd055Bf319ceFD2D516);
    preITO.setStart(1531612800);
    preITO.setPeriod(48);
    preITO.setPrice(1080000000000000000000);
    preITO.setMinInvestedLimit(100000000000000000);
    preITO.setSoftcap(1000000000000000000000);
    preITO.setHardcap(4000000000000000000000);
    preITO.setToken(token);
    preITO.setDirectMintAgent(0xF3D57FC2903Cbdfe1e1d33bE38Ad0A0753E72406);

    token.setSaleAgent(preITO);

    ito = new ITO();

    ito.setWallet(0xb13a4803bcC374B8BbCaf625cdD0a3Ac85CdC0DA);
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
    ito.addWallet(0xA5A5cf5325AeDA4aB32b9b0E0E8fa91aBDb64DdC, 10);
    ito.setToken(token);
    ito.setDirectMintAgent(0xF3D57FC2903Cbdfe1e1d33bE38Ad0A0753E72406);

    preITO.setNextSaleAgent(ito);

    address manager = 0xd8Fe93097F0Ef354fEfee2e77458eeCc19D8D704;

    token.transferOwnership(manager);
    preITO.transferOwnership(manager);
    ito.transferOwnership(manager);
  }

}

