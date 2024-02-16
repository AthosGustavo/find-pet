import { Router } from "express";
import { UserController } from "./controllers/UserController";

const routes = Router();
const userController = new UserController();

routes.get("/", userController.getUserController);
routes.post("/login", userController.getUserLoginController);
routes.post("/", userController.createUserController);


export { routes };

