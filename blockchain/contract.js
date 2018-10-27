const {cav} = require('./caver');
const path = require('path');
const fs = require("fs");
const solc = require('solc');
// var Contract = require('caver-klay-contract');
//
// Contract.setProvider('http://localhost:8551');

let SolPath = path.resolve(__dirname, 'contract', 'fairdraw.sol');
let source = fs.readFileSync(SolPath, 'utf8');
let compiledContract = solc.compile(source, 1);

let abi = JSON.parse(compiledContract.contracts[':Fairdraw'].interface);
let bytecode = compiledContract.contracts[':Fairdraw'].bytecode;

let sampleaccounts = cav.klay.accounts.create();
let gasEstimate = cav.klay.estimateGas({data: "0x" + bytecode})
let myContract = new cav.klay.Contract(abi, {from : sampleaccounts.address, gas: gasEstimate});
let contractAddress;
let tx_hash
const unlockAccount = cav.klay.personal.unlockAccount("0x55A6F3603ffcEEdAa46bB545Bb28699559dc8460",'wnsgur12')

const deploy = myContract.deploy({
        data: "0x" + bytecode
    }).send({
        from: "0x55A6F3603ffcEEdAa46bB545Bb28699559dc8460",
        gas: 1500000,
        gasPrice: '25000000000'
    }, function(error, transactionHash){})

module.exports = {
    deploy : deploy
}

