import { Entity, PrimaryGeneratedColumn, Column } from "typeorm";

@Entity()
export class User {
    @PrimaryGeneratedColumn()
      id: number;

    @Column({ type: "varchar", length: 50, nullable: false })
      nome: string;

    @Column({ type: "varchar", length: 50, nullable: false })
      email: string;

    @Column({ type: "varchar", length: 50, nullable: false })
      senha: string;

    @Column({ type: "varchar", length: 100, nullable: true })
      endereco: string;

    @Column({ type: "varchar", length: 11, nullable: true })
      contato: string;

    @Column({ type: "timestamp", default: () => "CURRENT_TIMESTAMP", nullable: false })
      data_cadastro: Date;
}
