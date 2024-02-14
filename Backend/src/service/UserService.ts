import { UsersRepository } from "./../repositories/UsersRepository";
import { User } from "../entities/User";


export class UserService{

  async getUsersService():Promise<User[]>{

    const usersRepository = new UsersRepository();
    return usersRepository.getUsersRepository();
  }
}