var mongoose = require('mongoose');
var Schema = mongoose.Schema;

var userSchema = new Schema({
    Id: String,
    Password: String,
    AccountAddress: String,
    PrivateKey: String
});

module.exports = mongoose.model('user', userSchema);