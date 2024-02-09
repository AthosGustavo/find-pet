
import { DataSource } from "typeorm";
import { envVariables } from "../config/env-variables";




const [DATA_BASE_HOST, DATA_BASE_TYPE, DATA_BASE_USER, DATA_BASE_PASSWORD, DATA_BASE] = envVariables;
const AppDataSource = new DataSource({
  type: DATA_BASE_TYPE,
  host: DATA_BASE_HOST,
  username: DATA_BASE_USER,
  password: DATA_BASE_PASSWORD,
  database: DATA_BASE

});

export default AppDataSource;