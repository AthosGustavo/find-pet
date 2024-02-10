import { User } from "../entities/User";
import AppDataSource from "../database/DataSource";


export class UserService{

  async getAllUsers():Promise<User[]>{

    const repository = AppDataSource.getRepository(User);
    const userReturn = repository.find();
    
    
    return userReturn;
  }
}