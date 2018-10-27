var mongoose = require('mongoose');
var Schema = mongoose.Schema;

var userSchema = new Schema({
    userId: String,
    AccountAddress: String,
    privateKey: String
});

module.exports = mongoose.model('user', userSchema);