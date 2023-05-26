import { Router } from "express";
import * as invoiceControllers from "../controllers/invoice.controllers"

const router=Router();

router.get("/get_all", invoiceControllers.methods.getInvoices);
router.get("/get/:id_invoice", invoiceControllers.methods.getInvoice);
router.post("/add", invoiceControllers.methods.addInvoice);
router.delete("/delete/:id", invoiceControllers.methods.deleteInvoice);
router.put("/update/:id", invoiceControllers.methods.updateInvoice);
router.get("/invoice_products/:id_invoice", invoiceControllers.methods.getProducts_invoice);


export default router;