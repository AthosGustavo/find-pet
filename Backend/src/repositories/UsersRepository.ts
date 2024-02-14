import AppDataSource from "../database/DataSource";
import { User } from "../entities/User";



export class UsersRepository{

  private userRepository;
  
  constructor(){
    const repository = AppDataSource.getRepository(User);
    this.userRepository = repository;
  }
  
  getUsersRepository():Promise<User[]>{
    const resultUserRepository = this.userRepository.find();
    return resultUserRepository;
  }

}