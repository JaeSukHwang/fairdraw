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
        let user = new User()
        user.userId= req.body.userId
        user.AccountAddress= req.body.AccountAddress
        user.privateKey= req.body.privateKey
  
        user.save(function(err){
            if(err){
                console.error(err);
                res.json({result: 0});
                Schema.statics.create = function (payload) {
                    const todo = new this(payload);
                    return todo.save();
                  };
                return;
            }
    
            res.json({result: 1});
    
        });
    });
    
    app.delete('/api/users/:_id', function(req, res){
        User.remove({ _id: req.params._id }, function(err, output){
            if(err) return res.status(500).json({ error: "database failure" });
    
            /* ( SINCE DELETE OPERATION IS IDEMPOTENT, NO NEED TO SPECIFY )
            if(!output.result.n) return res.status(404).json({ error: "book not found" });
            res.json({ message: "book deleted" });
            */
    
            res.status(204).end();
        })
    });  

    
}
