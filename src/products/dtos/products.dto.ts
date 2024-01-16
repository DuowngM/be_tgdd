import { IsNotEmpty } from 'class-validator';

export class NewProduct {
  @IsNotEmpty()
  brandId: number;

  @IsNotEmpty()
  categoryId: string;

  @IsNotEmpty()
  description: string;

  @IsNotEmpty()
  price: number;

  @IsNotEmpty()
  product_image: string;

  @IsNotEmpty()
  product_name: string;

  @IsNotEmpty()
  product_stocks: number;
}

export class InfoProduct {
  @IsNotEmpty()
  order_id: number;
  @IsNotEmpty()
  idProduct: number;
  @IsNotEmpty()
  quantity: number;
  @IsNotEmpty()
  address: number;

}