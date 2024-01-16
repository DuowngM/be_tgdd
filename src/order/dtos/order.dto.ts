import { IsNotEmpty } from 'class-validator';

export class NewOrder {
  @IsNotEmpty()
  customerId: string;

  @IsNotEmpty()
  total: number;

  @IsNotEmpty()
  method: string;
}
