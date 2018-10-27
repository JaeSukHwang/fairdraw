const Caver = require('caver-js')

const config = {
    rpcURL: 'http://localhost:8551'
}

const cav = new Caver(config.rpcURL)

module.exports = {
    cav : cav
}
