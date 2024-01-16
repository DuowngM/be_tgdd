import { IsNotEmpty } from 'class-validator';

export class LoginDTO {
  @IsNotEmpty()
  phoneNumber: string;

  @IsNotEmpty()
  password: string;
}

export class SignupDTO {
  @IsNotEmpty()
  phoneNumber: string;
  @IsNotEmpty()
  password: string;
}

export class ChangePassword {
  @IsNotEmpty()
  oldPassword: string;
  @IsNotEmpty()
  newPassword: string;
}
