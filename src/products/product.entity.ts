import { Brand } from 'src/brand/brand.entity';
import { Cart } from 'src/cart/cart.entity';
import { Category } from 'src/category/category.entity';
import { OrderDetails } from 'src/order-details/order-detail.entity';
import { Rate } from 'src/rate/rate.entity';
import {
  Entity,
  Column,
  PrimaryGeneratedColumn,
  ManyToOne,
  JoinColumn,
  OneToMany,
  JoinTable,
  ManyToMany,
} from 'typeorm';

@Entity()
export class Product {
  @PrimaryGeneratedColumn()
  product_id: number;

  @Column()
  product_name: string;

  @Column()
  product_stocks: number;

  @Column()
  price: number;

  @Column({ nullable: true })
  product_image: string;

  @Column({ nullable: true, type: 'longtext' })
  description: string;

  @Column()
  brandId: number;

  @Column()
  categoryId: number;

  @Column({ nullable: true })
  sold: number;

  @Column({ nullable: true })
  status: string;

  @ManyToOne(() => Category, (category) => category.products, {
    onDelete: 'CASCADE',
    onUpdate: 'CASCADE',
  })
  @JoinColumn({ name: 'categoryId' })
  category: Category;

  @ManyToOne(() => Brand, (brand) => brand.products)
  @JoinColumn({ name: 'brandId' })
  brand: Brand;

  @OneToMany(() => Cart, (cart) => cart.product)
  cartItems: Cart;

  @OneToMany(() => OrderDetails, (orderDetails) => orderDetails.product, {
    cascade: true,
  })
  orderDetails: OrderDetails[];
  @OneToMany(() => Rate, (rate) => rate.product)
  rates: Rate[];
}
