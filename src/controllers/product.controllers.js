import { getConnection } from "../database/database";

const getProducts = async (req, res) => {
    try {
        const connection = await getConnection();
        const result = await connection.query("SELECT * FROM productos");
        res.json(result);
    } catch (error) {
        res.status(500);
        res.send(error.message);

    }
};

const getProduct = async (req, res) => {
    try {
        const { id_product } = req.params;
        const connection = await getConnection();
        const result = await connection.query("SELECT * FROM productos WHERE id_product = ?", id_product);
        res.json(result);
    } catch (error) {
        res.status(500);
        res.send(error.message);
    }
};

const addProduct = async (req, res) => {
    try {
        const { id_product, product_name, price } = req.body;

        if (id_product == undefined || product_name == undefined || price == undefined) {
            res.status(400).json({ message: "Bad Request. Rellene los campos." })
        };
        const product = { id_product, product_name, price };
        const connection = await getConnection();
        const result = await connection.query(" INSERT INTO productos SET ?", product);
        res.json({ message: " product added" });



    } catch (error) {
        res.status(500);
        res.send(error.message);
    }
};


const deleteProduct = async (req, res) => {
    try {
        const { id_product } = req.params;
        const connection = await getConnection();
        const result = await connection.query("DELETE FROM productos WHERE id_product = ?", id_product);
        res.json(result);

    } catch (error) {
        res.status(500);
        res.send(error.message);
    }
};

const updateProduct = async (req, res) => {
    try {
        const { id_product } = req.params;
        const { product_name, price } = req.body;

        if (id_product == undefined || product_name == undefined || price == undefined) {
            res.status(400).json({ message: "Bad Request. Rellene los campos." })
        };

        const product = {product_name, price};
        const connection = await getConnection();
        const result = await connection.query("UPDATE productos SET  ? WHERE id_product = ?", [product, id_product]);
        res.json(result);

    } catch (error) {
        res.status(500);
        res.send(error.message);
    }
};




export const methods = {
    getProducts,
    getProduct,
    addProduct,
    deleteProduct,
    updateProduct
}