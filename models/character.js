var mongoose = require('mongoose');
var Schema = mongoose.Schema;

var characterSchema = new Schema({
    Id : String,
    Level : Number,
    Tx_hash : String,
});

module.exports = mongoose.model('character', characterSchema);