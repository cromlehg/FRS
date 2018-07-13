![FRS coin](logo.png "FRS coin")
http://frscoin.com

# FRS coin smart contract

* _Standard_        : [ERC20](https://github.com/ethereum/EIPs/blob/master/EIPS/eip-20.md)
* _[Name](https://github.com/ethereum/EIPs/blob/master/EIPS/eip-20.md#name)_            : FRSCoin
* _[Ticker](https://github.com/ethereum/EIPs/blob/master/EIPS/eip-20.md#symbol)_          : FRS
* _[Decimals](https://github.com/ethereum/EIPs/blob/master/EIPS/eip-20.md#decimals)_        : 18
* _Emission_        : Mintable
* _Crowdsales_      : 2
* _Fiat dependency_ : No
* _Tokens locked_   : Yes

## Smart-contracts description

The tokens for the bounty and the team are minted after the ICO  is finished.  
There is a special function to return 3rd party tokens that were sent by mistake (function retrieveTokens()).  
Each stage has a direct minting function in wei. This is made to support the external payment gateways.

### Contracts contains
1. _Token_ - Token contract
2. _PreITO_ - PreITO contract
3. _ITO_ - ITO contract
4. _Configurator_ - contract with main configuration for production

### How to manage contract
To start working with contract you should follow next steps:
1. Compile it in Remix with enamble optimization flag and compiler 0.4.18
2. Deploy bytecode with MyEtherWallet. Gas 5100000 (actually 5073514).
3. Call 'deploy' function on addres from (3). Gas 4000000 (actually 3979551). 

Contract manager must call finishMinting after each crowdsale milestone!
To support external mint service manager should specify address by calling _setDirectMintAgent_. After that specified address can direct mint tokens by calling _mintTokensByETHExternal_ and _mintTokensExternal_.

### How to invest
To purchase tokens investor should send ETH (more than minimum 0.1 ETH) to corresponding crowdsale contract.
Recommended GAS: 250000, GAS PRICE - 21 Gwei.

### Wallets with ERC20 support
1. MyEtherWallet - https://www.myetherwallet.com/
2. Parity 
3. Mist/Ethereum wallet

EXODUS not support ERC20, but have way to export key into MyEtherWallet - http://support.exodus.io/article/128-how-do-i-receive-unsupported-erc20-tokens

Investor must not use other wallets, coinmarkets or stocks. Can lose money.

## Tokens distribution

* _Team tokens_                 : 10%
* _For sale tokens_             : 90%

## AirDrop feature
* Contains airdrop support contracts

## Main network configuration

* _Team tokens wallet_        : 0xA5A5cf5325AeDA4aB32b9b0E0E8fa91aBDb64DdC
* _Direct mint address_       : 0xF3D57FC2903Cbdfe1e1d33bE38Ad0A0753E72406
* _Contracts manager_         : 0xd8Fe93097F0Ef354fEfee2e77458eeCc19D8D704

### Links
1. _Token_ - https://etherscan.io/token/0x601b31afde3558f0f3da77bb87d58a91172428a1
2. _PreITO_ - https://etherscan.io/address/0x142382f8854790016740e9442b45182143834a18
3. _ITO_ - https://etherscan.io/address/0x06b4952c04f55733c90c57d40fd0f26524c33354

### Features
* Manually mint tokens by owner or sale agent at any time until token minting finished. 
* Manually mint tokens in ether value by owner or sale agent at corresponding sale contract during current sale processing. 

### Crowdsale stages

#### PreITO
* _Minimal insvested limit_     : 0.1 ETH
* _Base price_                  : 1 ETH = 1080 Tokens
* _Softcap_                     : 1000 ETH
* _Hardcap_                     : 4000 ETH
* _Period_                      : 48 days
* _Start_                       : 15 Jul 2018 00:00:00 GMT
* _Wallet_                      : 0x89C92383bCF3EecD5180aBd055Bf319ceFD2D516

#### ITO
* _Minimal insvested limit_     : 0.1 ETH
* _Base price_                  : 1 ETH = 900 Tokens
* _Hardcap_                     : 32 777 ETH
* _Start_                       : 1 Sep 2018 00:00:00 GMT
* _Wallet_                      : 0xb13a4803bcC374B8BbCaf625cdD0a3Ac85CdC0DA
 
##### Milestones
1. 7 days, bonus +15%
2. 7 days, bonus +13%
3. 7 days, bonus +11% 
4. 7 days, bonus +9% 
5. 7 days, bonus +7% 
6. 7 days, bonus +5% 
7. 7 days, bonus +3% 


## Ropsten network configuration

### Links
1. _Token_ - https://ropsten.etherscan.io/address/0x4235f3f7d8cc9171a47d1caca8d4818ae96945e5
2. _PreITO_ - https://ropsten.etherscan.io/tx/0x349d05bba7ce92ae00e5be4e6c4a5cd4ec75f5258b412a70fa7122c67907f900
3. _ITO_ - https://ropsten.etherscan.io/address/0x3a89930c4a0e009fad47eae689ba7794de93018c


### Crowdsale stages

#### PreITO

* _Minimal insvested limit_     : 0.1 ETH
* _Base price_                  : 1 ETH = 1080 Tokens
* _Softcap_                     : 1 ETH
* _Hardcap_                     : 2 ETH
* _Period_                      : 48 days
* _Start_                       : 07 Jul 2018 00:00:00 GMT
* _Wallet_                      : 0x8fd94be56237ea9d854b23b78615775121dd1e82

##### Purchasers

* 1 ETH => 1080 tokens, gas = 173083
https://ropsten.etherscan.io/tx/0x6679a9f505a2eb4d56e4a5bf337a94a664a4ace3dd184d2192d25753b0e8c188

* 0.01 ETH => rejected txn, less then mininal investment limit, gas = 21297
https://ropsten.etherscan.io/tx/0x8a91810de5769b6f1499fd5fee7b603809f24f9d018a1c59e159aa158085eb0c

* 1 ETH =>  tokens, gas = 51911
https://ropsten.etherscan.io/tx/0x19ff2928918e921fc034cb0a680900d3883b4022863f788049b74c025d09a08d

* 1 ETH => rejected txn, preITO is finished, gas = 27887
https://ropsten.etherscan.io/tx/0x2085b3863a6e06909413f35d3be9c4f4f3379d65d594fe47853c0cd52bf510c0

##### Service operations

* finish, gas = 67529
https://ropsten.etherscan.io/tx/0x8cdff4c43c28dabbfde3604207c2e67dcb2a385a0de78de498847843715b7965

#### ITO

* _Minimal insvested limit_     : 0.1 ETH
* _Base price_                  : 1 ETH = 900 Tokens
* _Hardcap_                     : 32 777 ETH
* _Start_                       : 07 Jul 2018 00:00:00 GMT
* _Wallet_                      : 0x8fd94be56237ea9d854b23b78615775121dd1e82
* _Team tokens wallet_          : 0xaa8ed6878a202eF6aFC518a64D2ccB8D73f1f2Ca
* _Team tokens percent_         : 10%

_Milestones_

1. 7 days, bonus +15%
2. 7 days, bonus +13%
3. 7 days, bonus +11%
4. 7 days, bonus +9%
5. 7 days, bonus +7%
6. 7 days, bonus +5%
7. 7 days, bonus +3%

##### Purchasers

* 1 ETH => 1035 tokens (15% bonus), gas = 71080
https://ropsten.etherscan.io/tx/0x6812bcfcf9b3497b5075a816d4a64d421936f773092b55f2314d88aa144a298f

* 1 ETH => 1017 tokens (13% bonus), gas = 57498
https://ropsten.etherscan.io/tx/0x41c2a78fb2a43c2827733671dbb468f573c1b7f1429cf0411b748753c133ecd1

##### Service operations

* setStart, gas = 27883
https://ropsten.etherscan.io/tx/0xcae99fdebc0cd473f70880612ae74435861e5f20f7e217b0f32644ffa7f4865e

* finish, gas = 96789
https://ropsten.etherscan.io/tx/0x7851dabb74875d55ad8a4ee299e7e96f3302984c7a276e7ad4c79d2e8af7b708

### Token holders
https://ropsten.etherscan.io/token/0x4235f3f7d8cc9171a47d1caca8d4818ae96945e5#balances
