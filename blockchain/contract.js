const {cav} = require('./caver');
const path = require('path');
const fs = require("fs");
const solc = require('solc');
// var Contract = require('caver-klay-contract');
//
// Contract.setProvider('http://localhost:8551');

let SolPath = path.resolve(__dirname, 'contract', 'fairdraw.sol');
let source = fs.readFileSync(SolPath, 'utf8');
let compiledContract = solc.compile(source, 200);

let abi = JSON.parse(compiledContract.contracts[':Fairdraw'].interface);
let bytecode = compiledContract.contracts[':Fairdraw'].bytecode;

let sampleaccounts = cav.klay.accounts.create();
let gasEstimate = cav.klay.estimateGas({data: "0x" + bytecode})
let myContract = new cav.klay.Contract(abi, {from : sampleaccounts.address, gas: gasEstimate});
cav.klay.personal.unlockAccount("0x55A6F3603ffcEEdAa46bB545Bb28699559dc8460",'wnsgur12')

const deploy = myContract.deploy({
    data: "0x" + bytecode
}).send({
    from: "0x55A6F3603ffcEEdAa46bB545Bb28699559dc8460",
    gas: 5000000,
    gasPrice: '25000000000'
})

console.log(abi[6].inputs)

let deployedContract = new cav.klay.Contract(abi, "0xF0A8c80CA9de075bA84cf5E5c77a4ED3E5F84A3f");

// var normallist = ["son", "gang", "sin", "jang", "lee", "cha"]
// deployedContract.methods.addDraw("normal", "[son,]").send({
//     from: "0x55A6F3603ffcEEdAa46bB545Bb28699559dc8460",
//     gas: 5000000,
//     gasPrice: '25000000000'
// }).on('receipt', function(receipt) {
//     console.log(receipt);
// });
// var premiumlist = ["ron", "mesi", "son", "gang", "sin", "jang"];
deployedContract.methods.addDraw("premium", '["asdf","asdf"]').send({
    from: "0x55A6F3603ffcEEdAa46bB545Bb28699559dc8460",
    gas: 5000000,
    gasPrice: '25000000000'
}).on('receipt', function(receipt) {
    console.log(receipt);
});

module.exports = {
    myContract: myContract,
    deploy : deploy
}

