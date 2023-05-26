import { Router } from "express";
import * as loginControllers from "../controllers/login.controllers"

const router=Router();

router.post("/login", loginControllers.methods.loginUser);

export default router;