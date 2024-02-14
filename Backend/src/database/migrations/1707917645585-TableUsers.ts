import { MigrationInterface, QueryRunner, Table } from "typeorm";

export class TableUsers1707917645585 implements MigrationInterface {

  public async up(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.createTable(new Table({
      name:"users",
      columns:[
        {
          name:"id",
          type:"int",
          isPrimary:true,
          isGenerated:true,
          generationStrategy:"increment"
        },
        {
          name:"nome",
          type:"varchar",
          length:"50",
          isNullable:false,
        },
        {
          name:"email",
          type:"varchar",
          length:"50",
          isNullable:false,
        },
        {
          name:"senha",
          type:"varchar",
          length:"50",
          isNullable:false,
        },
        {
          name:"endereco",
          type:"varchar",
          length:"100",
          isNullable:true,
        },
        {
          name:"contato",
          type:"varchar",
          length:"11",
          isNullable:true,
        },
        {
          name:"data_cadastro",
          type:"timestamp",
          default:"CURRENT_TIMESTAMP",
          isNullable:false
        }

      ]
    }));

  }

  public async down(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.dropTable("users");
  }

}
