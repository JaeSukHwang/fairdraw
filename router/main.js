module.exports = function(app, User)
{
    

    app.get('/',function(req,res){
        res.render('index.html')
    });
    app.get('/about',function(req,res){
        res.render('about.html');
    });

    app.post('/api/users', function(req, res){
        var user = new User();
        user.userId = req.body.id;
        user.AccountAddress = req.body.address;
        user.privateKey = req.body.privatekey;
    
        user.save(function(err){
            if(err){
                console.error(err);
                res.json({result: 0});
                return;
            }
    
            res.json({result: 1});
    
        });
    });

    
}
