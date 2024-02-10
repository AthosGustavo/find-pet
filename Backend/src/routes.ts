import { Router } from "express";
import { UserController } from "./controllers/UserController";

const routes = Router();
const userController = new UserController();

routes.get("/", userController.functionUserController.bind(userController)); // Você precisa vincular o contexto ao método para acessar this corretamente

export { routes };