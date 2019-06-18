

module.exports=() => {
    const router = require('express').Router();
    
    router.post('/list', (req, res)=>{
        return res.json({"list":"data"})
    });

    router.post('/get', (req, res)=>{
    	return res.json({"get":"data"})
    });

    return router;
}