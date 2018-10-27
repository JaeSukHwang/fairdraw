const { cav } = require('./caver')

var getinput = function(tx_hash) {
    cav.klay.getTransaction(tx_hash)
        .then(function (result) {
            console.log(result.input)
        })
}

getinput('0x8d808c02721376a15194ada6d1a98e32413e25de24d62392c4fe1573c66de9fe')
