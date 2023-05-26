import { getConnection } from "../database/database";

const getClients = async (req, res) => {
    try {
        const connection = await getConnection();
        const result = await connection.query("SELECT id_user, client_name FROM usuarios WHERE rol = 2");
        res.json(result);
    } catch (error) {
        res.status(500);
        res.send(error.message);

    }
};

const getDiscount= async (req, res) => {
    try {
        const { id_client } = req.body;
        const connection = await getConnection();
        const result = await connection.query(`SELECT SUM(total) as total_invoices, fecha_creado FROM invoice  INNER JOIN usuarios ON usuarios.id_user = invoice.id_client WHERE id_client = '${id_client}'`);
        
        console.log(result[0].fecha_creado);
        console.log(result[0].total_invoices);

        if(result[0].fecha_creado == null){
            const result1 = await connection.query(`SELECT fecha_creado FROM usuarios WHERE id_user = '${id_client}'`);
            result[0].fecha_creado = result1[0].fecha_creado;
            result[0].total_invoices = 0;
        }
        
        const date = new Date(result[0].fecha_creado);
        const formattedDate = date.toISOString().slice(0,10); 
        result[0].fecha_creado = formattedDate
        res.json(result);
    } catch (error) {
        res.status(500);
        console.log(error.message);
        res.send(error.message);

    }
};



export const methods = {
    getClients,
    getDiscount
}