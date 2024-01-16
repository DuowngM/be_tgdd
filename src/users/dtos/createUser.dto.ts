import { IsEmail, Length, IsEmpty } from 'class-validator';
export class CreateUserDto {
  @IsEmpty()
  phoneNumber: string;
  @IsEmpty()
  password: string;
}

export class UpdateUser {
  @IsEmpty()
  phoneNumber: string;
  @IsEmpty()
  password: string;
}
