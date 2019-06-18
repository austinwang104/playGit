

module.exports=() => {
    const router = require('express').Router();
    router.post('/list', (req, res)=>{
        return res.json({"list":"data"})
    });
    return router;
}