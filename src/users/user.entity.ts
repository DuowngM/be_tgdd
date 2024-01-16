import { Cart } from 'src/cart/cart.entity';
import { Order } from 'src/order/order.entity';
import { Rate } from 'src/rate/rate.entity';
import { Entity, Column, PrimaryColumn, OneToMany, ManyToMany } from 'typeorm';
import { v4 as uuidv4 } from 'uuid';
@Entity({ name: 'user' })
export class User {
  @PrimaryColumn()
  user_id: string = uuidv4();

  @Column()
  phoneNumber: string;

  @Column()
  password: string;

  @Column({ nullable: true })
  user_email: string;

  @Column({ nullable: true })
  user_name: string;

  @Column({ nullable: true })
  address: string;

  @Column({ nullable: true })
  gender: number;

  @Column({ nullable: true })
  date_of_birth: string;

  @Column()
  roles: number;

  @Column()
  status: string;
  @OneToMany(() => Cart, (cart) => cart.user)
  cartItems: Cart[];

  @OneToMany(() => Order, (order) => order.customer)
  orders: Order[];

  @OneToMany(() => Rate, (rate) => rate.user)
  rates: Rate[];
}
