import {
  Body,
  Controller,
  Post,
  Res,
  Put,
  Param,
  UseGuards,
} from '@nestjs/common';
import { AuthService } from './auth.service';
import { Response } from 'express';
import { ChangePassword, LoginDTO, SignupDTO } from './dtos/auth.dto';
import { JwtAuthGuard } from './jwt/auth.guard';
import { JwtRolesGuard } from './jwt/roles.guard';

@Controller('auth')
export class AuthController {
  constructor(private authService: AuthService) {}
  @Post('login')
  async login(@Body() login: LoginDTO, @Res() res: Response) {
    return await this.authService.login(login, res);
  }

  @Post('signup')
  async signup(@Body() signupDto: SignupDTO, @Res() res: Response) {
    return await this.authService.signup(signupDto, res);
  }
  
  @UseGuards(JwtAuthGuard)
  @Put('changePassword/:id')
  async changePassword(
    @Body() changePassword: ChangePassword,
    @Param('id') id: string,
    @Res() res: Response,
  ) {
    return await this.authService.changePassword(changePassword, id, res);
  }
}
