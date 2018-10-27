const {cav} = require('./caver');

let account = cav.klay.accounts.create();

class accounts {
    constructor(user,address, privateKey) {
        this.address = account.address;
        this.privateKey = account.privateKey;
    }

    get prop() {
        return
    }
}

let useraccount = new accounts();

console.log(useraccount)
module.export = {
    account : useraccount
}
