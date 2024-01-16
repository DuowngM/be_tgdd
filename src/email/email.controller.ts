import { JwtRolesGuard } from './../auth/jwt/roles.guard';
import { JwtAuthGuard } from './../auth/jwt/auth.guard';
import { Controller, Post, Body, Res, Param, UseGuards } from '@nestjs/common';
import { EmailService } from './email.service';
import { Response } from 'express';
@Controller('send-email')
export class EmailController {
  constructor(private readonly emailService: EmailService) {}

  @Post()
  sendEmail(@Body('email') email: string, @Res() res: Response) {
    return this.emailService.sendEmail(email, res);
  }
  @UseGuards(JwtAuthGuard, JwtRolesGuard)
  @Post('/lock_user')
  sendEmailLockUser(@Body('lock_email') lock_email: string, @Res() res) {
    return this.emailService.sendEmailLockUser(lock_email, res);
  }
}
