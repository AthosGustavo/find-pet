import { User } from "./User";

export class UserDTO{
  nome:string;
  email:string;
  senha:string;
  endereco?:string;
  contato?:string;

  constructor(user: User){
    this.nome = user.nome;
    this.email = user.email;
    this.senha = user.senha;
    this.endereco = user.endereco;
    this.contato = user.contato;

  }
}