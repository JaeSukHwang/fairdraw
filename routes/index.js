var express = require('express');
var router = express.Router();

/* GET home page. */
router.get("/showstatus", function(req, res){
	res.sendFile(__dirname + "/public/showstatus.html");
})

router.get("/enhancement", function(req, res){
	res.sendFile(__dirname + "/public/enhancement.html");
})

router.get("/success", function(req, res){
	res.sendFile(__dirname + "/public/success.html");
})

router.get("/showtransaction", function(req, res){
	res.sendFile(__dirname + "/public/showtransaction.html");
})


module.exports = router;
