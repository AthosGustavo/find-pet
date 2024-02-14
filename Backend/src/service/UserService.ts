import { UsersRepository } from "./../repositories/UsersRepository";
import { User } from "../entities/User/User";


export class UserService{

  private usersRepository: UsersRepository;

  constructor(){
    this.usersRepository = new UsersRepository();
  }
  
  async getUserService():Promise<User[]>{
    return await this.usersRepository.getUserRepository();
  }

  async createUserService(user: User){
    return await this.usersRepository.createUserRepository(user);
  }


}