import { getConnection } from "../database/database";

const loginUser = async (req,res)=>{
    try {

        const {email, password} = req.body;
        console.log(email);
        console.log(password);
        let encrip = utf8_to_b64(password);
        const connection = await getConnection();
        const result = await connection.query(`SELECT * FROM usuarios WHERE email = '${email}'  AND password = '${encrip}'`);
        console.log(result);
        if (result.length != 0){
            const jwt = require("jsonwebtoken");
            jwt.sign({user: result}, 'secretkey', (err, token)=>{
                res.json({
                    token: token,
                    rol: result[0].rol,
                    name: result[0].point_contact
                });
            });
            console.log("Logeado");
        }
        else{
            res.json("No logeado");
        }
    } catch (error) {
        res.status(500);
        res.send(error.message);
    }
}
function utf8_to_b64(str) {
    return btoa(str);
}

function verifyToken( req, res, next){
    const bearerHeader = req.headers [ 'authorization' ];

    if (typeof bearerHeader !== 'undefined'){
        const bearerToken = bearerHeader.split(" ")[1];
        req.token = bearerToken;
        next();
        
    }else{
        res.sendStatus(403);
    }
};

    


export const methods = {
    loginUser,
    verifyToken
}