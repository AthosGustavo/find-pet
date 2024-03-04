import { DataSource } from "typeorm";
import { envVariables } from "../config/env-variables";
import { User } from "../entities/User/User";


const [DATA_BASE_HOST, DATA_BASE_TYPE, MYSQL_USER, MYSQL_PASSWORD, MYSQL_DATABASE] = envVariables;
const AppDataSource = new DataSource({
  type: DATA_BASE_TYPE,
  host: DATA_BASE_HOST,
  username: MYSQL_USER,
  password: MYSQL_PASSWORD,
  database: MYSQL_DATABASE,
  entities:[User],
  migrations: [`${__dirname}/**/migrations/*.{ts,js}`],
  migrationsTableName: "migrations",
  
});

export default AppDataSource;


