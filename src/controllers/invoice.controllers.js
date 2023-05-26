import { getConnection } from "../database/database";

const getInvoices = async (req, res) => {
    try {
        const connection = await getConnection();
        const result = await connection.query("SELECT * FROM invoice");
        for(let i=0; i<result.length; i++){
            const date = new Date(result[i].date);
            const formattedDate = date.toISOString().slice(0,10);
            result[i].date = formattedDate
        }
        res.json(result);
    } catch (error) {
        res.status(500);
        res.send(error.message);

    }
};

const getInvoice = async (req, res) => {
    try {
        const { id_invoice } = req.params;
        const connection = await getConnection();
        const result = await connection.query("SELECT * FROM invoice WHERE id_invoice = ?", id_invoice);
        console.log(result);
        res.json(result);
    } catch (error) {
        res.status(500);
        res.send(error.message);
    }
};

const addInvoice = async (req, res) => {
    try {
        console.log(req.body);
        const { id_client, date, subtotal, discount, total } = req.body.datos.invoice;
        const products = req.body.datos.products;

        if (id_client == undefined || subtotal == undefined || date == undefined || discount == undefined || total == undefined) {
            res.status(400).json({ message: "Bad Request. Rellene los campos." })
        };

        const invoice = { id_client, date, subtotal, discount, total };
        const connection = await getConnection();
        const result = await connection.query(" INSERT INTO invoice SET ?", invoice);

        let sub_total = 0;
        const id_invoice = result.insertId;
        for (let i = 0; i < products.length; i++) {
            const id_product = products[i].id_product;
            const quantity = products[i].quantity;
            const find = await connection.query("SELECT price FROM productos WHERE id_product = ?", id_product);
            const price = find[0].price;
            sub_total = sub_total + (price * quantity);
            const result = await connection.query("INSERT INTO invoice_products SET id_product = ?, id_invoice = ?, amount = ?", [id_product, id_invoice, quantity])
        };
        
        let itotal = sub_total - ((sub_total * discount) / 100.0);
        const result1 = await connection.query("UPDATE invoice SET subtotal = ?, total = ? WHERE id_invoice = ?", [sub_total, itotal, id_invoice]);
        res.json({ message: "invoice added" });



    } catch (error) {
        res.status(500);
        console.log(error.message);
        res.send(error.message);
    }
};


const deleteInvoice = async (req, res) => {
    try {
        const { id_invoice } = req.params;

        const connection = await getConnection();
        const result = await connection.query("DELETE FROM invoice WHERE id_invoice = ?", id_invoice);
        res.json(result);

    } catch (error) {
        res.status(500);
        res.send(error.message);
    }
};

const updateInvoice = async (req, res) => {
    try {
        const { id_invoice } = req.params;
        const { client, subtotal, discount, total } = req.body;

        if (client == undefined || subtotal == undefined || discount == undefined || total == undefined) {
            res.status(400).json({ message: "Bad Request. Rellene los campos." })
        };

        const invoice = { client, subtotal, discount, total };
        const connection = await getConnection();
        const result = await connection.query("UPDATE invoice SET  ? WHERE id_invoice = ?", [invoice, id_invoice]);
        res.json(result);

    } catch (error) {
        res.status(500);
        res.send(error.message);
    }
};

const getProducts_invoice = async (req, res) => {
    try {
        const { id_invoice } = req.params;
        console.log(id_invoice);
        const connection = await getConnection();
        const result = await connection.query(`SELECT invoice_products.id_product, invoice_products.amount, productos.product_name FROM invoice_products INNER JOIN productos ON invoice_products.id_product = productos.id_product WHERE id_invoice = '${id_invoice}'`);
        console.log(result);
        res.json(result);
    } catch (error) {
        res.status(500);
        res.send(error.message);

    }
};




export const methods = {
    getInvoices,
    getInvoice,
    addInvoice,
    deleteInvoice,
    updateInvoice,
    getProducts_invoice
}