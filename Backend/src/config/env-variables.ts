import dotenv from "dotenv";

dotenv.config();
export const DATA_BASE_PORT = Number(process.env.DATA_BASE_PORT);
const DATA_BASE_HOST = process.env.DATA_BASE_HOST;
const DATA_BASE_TYPE = process.env.DATA_BASE_TYPE;
const DATA_BASE_USER = process.env.DATA_BASE_USER;
const MYSQL_PASSWORD = process.env.MYSQL_PASSWORD;
const MYSQL_DATABASE = process.env.MYSQL_DATABASE;


export const envVariables:any[] = [
  
  DATA_BASE_HOST,
  DATA_BASE_TYPE,
  DATA_BASE_USER,
  MYSQL_PASSWORD,
  MYSQL_DATABASE
];