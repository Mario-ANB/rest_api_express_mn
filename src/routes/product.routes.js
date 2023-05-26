import { Router } from "express";
import * as productControllers from "../controllers/product.controllers"

const router=Router();

router.get("/get_all", productControllers.methods.getProducts);
router.get("/get/:id_product", productControllers.methods.getProduct);
router.post("/add", productControllers.methods.addProduct);
router.delete("/delete/:id", productControllers.methods.deleteProduct);
router.put("/update/:id", productControllers.methods.updateProduct);


export default router;