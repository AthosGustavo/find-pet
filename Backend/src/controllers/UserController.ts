import { Request, Response } from "express";
import { UserService } from "../service/UserService";

export class UserController {

  async getUserController(req: Request, res: Response): Promise<void> {
    try {
      
      const objectUserService: UserService = new UserService();
      const result = await objectUserService.getUserService();
      
      res.status(200).json(result); // Enviar a resposta como JSON
    
    } catch (error) {
      console.error("Error while fetching users", error);
      res.status(500).json({ message: "Internal server error" }); // Tratamento de erro
    }
  }

  async getUserLoginController(req: Request, res:Response):Promise<any>{

    const {email, senha} = req.body;
    const userService = new UserService();
    const response = await userService.getUserLoginService(email, senha);
    
    if(response.userDTO === null){
      res.status(404).json({mensagem: "Usuário não cadastrado.",acesso:"negado"});
    }else{
      res.status(200).json({acesso:"permitido"});
    }
    
  }

  async createUserController(req: Request, res: Response): Promise<void> {
    try {
      const user = req.body;
      const userService = new UserService();
      userService.createUserService(user);
      res.status(200).json({ message: "Valor recebido com sucesso" });
    
    } catch (error) {
      console.error("Erro ao processar requisição:", error);
      res.status(500).json({ message: "Erro interno do servidor" });
    }
  }


}