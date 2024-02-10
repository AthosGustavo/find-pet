import { Request, Response } from "express";
import { UserService } from "../service/UserService";

export class UserController {

  async functionUserController(req: Request, res: Response): Promise<void> {
    try {
      const objectUserService: UserService = new UserService();
      const result = await objectUserService.getAllUsers();
      res.status(200).json(result); // Enviar a resposta como JSON
    } catch (error) {
      console.error("Error while fetching users", error);
      res.status(500).json({ message: "Internal server error" }); // Tratamento de erro
    }
  }

}