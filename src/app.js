import express from "express";
import morgan from "morgan";

//Routes
import productRoutes from "./routes/product.routes";
import invoiceRoutes from "./routes/invoice.routes";
import loginRoutes from "./routes/login.routes";
import userRoutes from "./routes/user.routes";

const app = express();
const cors = require("cors");




//settings
app.set("port", 4000);

//Middlewares
app.use(morgan("dev"));
app.use(express.json());

const DIRECTORIO_PERMITIDO_CORS = "http://localhost:3000";
app.use(cors({
    origin: DIRECTORIO_PERMITIDO_CORS
}));

//Routes
app.use("/product",productRoutes);
app.use("/invoice",invoiceRoutes);
app.use("/login",loginRoutes);
app.use("/user",userRoutes);

export default app;