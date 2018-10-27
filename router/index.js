module.exports = function(app, User)
{
    

    app.get('/',function(req,res){
        res.render('index.html')
    });
    app.get('/about',function(req,res){
        res.render('about.html');
    });

    app.get('/api/user', function(req,res){
        User.find(function(err, users){
            if(err) return res.status(500).send({error: 'database failure'});
            res.json(users);
        })
    });

    app.post('/api/user', function(req, res){
        // let user = new User(
        //     {
        //       userId: req.body.userId,
        //       AccountAddress: req.body.AccountAddress,
        //       privateKey: req.body.privateKey
        //     }
        // );
        let user = new User()
        user.userId= req.body.userId
        user.AccountAddress= req.body.AccountAddress
        user.privateKey= req.body.privateKey
  
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
