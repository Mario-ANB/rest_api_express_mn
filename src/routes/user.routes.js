import { Router } from "express";
import * as userControllers from "../controllers/user.controllers"

const router=Router();

router.get("/get_clients",userControllers.methods.getClients);
router.post("/get_discount",userControllers.methods.getDiscount);


export default router;