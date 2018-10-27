var mongoose = require('mongoose');
var Schema = mongoose.Schema;

var collectionSchema = new Schema({
    User : String,
    Character : Array
});

module.exports = mongoose.model('collection', collectionSchema);