import "reflect-metadata";
import express from "express";
import AppDataSource from "./database/DataSource";
import { DATA_BASE_PORT } from "./config/env-variables";
import { routes } from "./routes";

const app = express();
//Caso esse trecho de código for declarado abaixo de 
//app.use(routes) não será possível acessar dados do corpo de uma requisicao post
app.use(express.json());
app.use(routes);


(async () => {
  try{
    await AppDataSource.initialize();
    
    if(AppDataSource.isInitialized){
      console.log("Database connected");
      app.listen(DATA_BASE_PORT, () => console.log(`Server is running at port:${DATA_BASE_PORT}`));
    }
  }catch(erro){
    console.error("Error during Data Source initialization", erro);
    
  }
})();  
  
  