import { Router } from "express";
import { UserController } from "./controllers/UserController";

const routes = Router();
const userController = new UserController();

routes.get("/", userController.functionUserController);

export { routes };

