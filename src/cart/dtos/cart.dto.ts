import { IsNotEmpty } from 'class-validator';

export class AddToCart {
  @IsNotEmpty()
  productId: number;

  @IsNotEmpty()
  userId: string;
}
