var mongoose = require('mongoose');
var Schema = mongoose.Schema;

var tx_draw = new Schema({
    Id: String,
    Tx_hash: String
});

module.exports = mongoose.model('tx_draw', userSchema);