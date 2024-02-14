import { MigrationInterface, QueryRunner } from "typeorm";

export class InsertUserTest1707933397482 implements MigrationInterface {

  public async up(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.query("INSERT INTO users (nome, email, senha, contato) VALUES ('athos', 'athosgustavo@.com', '123', '81975030639')");
    
  }

  public async down(queryRunner: QueryRunner): Promise<void> {
  }

}
