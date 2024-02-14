import AppDataSource from "../database/DataSource";
import { User } from "../entities/User/User";
import { UserDTO } from "../entities/User/UserDTO";



export class UsersRepository{

  private userRepository;
  
  constructor(){
    const repository = AppDataSource.getRepository(User);
    this.userRepository = repository;
  }
  
  getUserRepository():Promise<User[]>{
    const resultUserRepository = this.userRepository.find();
    return resultUserRepository;
  }

  createUserRepository(user:User):void{
    const userDTO = new UserDTO(user);
    this.userRepository.create({userDTO});    
    return this.userRepository.save(user);

  }

}