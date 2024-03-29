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

  async getUserLoginRepository(email:string, senha:string):Promise<{userDTO: UserDTO}>{
    const isUserExist = await this.userRepository.findOne({where:{email, senha}});
    const response = {userDTO:isUserExist};
    return response;

    /*
      Promise<{userDTO: UserDTO}> : Declara que o retorno será uma propriedade do tipo userDTO do tipo UserDTO
      const response = {userDTO:isUserExist} : TIPAGEM, a variável tipada como UserDTO, agora é chave do retorno da requisição 
    */
  }

}