import {
  BadRequestException,
  Injectable,
  NotFoundException,
  Res,
} from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Response } from 'express';
import { User } from 'src/users/user.entity';
import { Repository } from 'typeorm';
import { LoginDTO, SignupDTO } from './dtos/auth.dto';
import * as argon from 'argon2';
import { JwtService } from '@nestjs/jwt';
@Injectable()
export class AuthService {
  constructor(
    private readonly jwtService: JwtService,
    @InjectRepository(User) private usersRepository: Repository<User>,
  ) {}
  async signup(signupDto: SignupDTO, @Res() res: Response) {
    try {
      const checkPhoneNumber = await this.usersRepository.findOne({
        where: { phoneNumber: signupDto.phoneNumber },
      });
      if (checkPhoneNumber) {
        return res.status(400).json({});
      }
      const hashedPassword = await argon.hash(signupDto.password);
      const user = this.usersRepository.create({
        phoneNumber: signupDto.phoneNumber,
        password: hashedPassword,
        roles: 0,
        status: 'Available',
      });
      await this.usersRepository.save(user);
      delete user.password;
      return res.status(201).json({
        user,
      });
    } catch (error) {
      throw new BadRequestException(error.message);
    }
  }
  async login(loginDto: LoginDTO, @Res() res: Response) {
    try {
      const user = await this.usersRepository.findOne({
        where: { phoneNumber: loginDto.phoneNumber },
      });
      if (!user) {
        throw new NotFoundException('Email or password not found');
      }
      const checkPassword = await argon.verify(
        user.password,
        loginDto.password,
      );
      if (!checkPassword) {
        return res.status(400).json({});
      }
      const token = this.jwtService.sign({
        sub: user.user_id,
        roles: user.roles,
      });

      delete user.password;

      return res.status(200).json({
        user,
        token,
      });
    } catch (error) {
      console.log(error);
    }
  }

  async changePassword(changePassword, id, res) {
    try {
      const user = await this.usersRepository.findOne({
        where: { user_id: id },
      });
      const checkPassword = await argon.verify(
        user.password,
        changePassword.oldPassword,
      );
      if (!checkPassword) {
        return res.json({
          status: 401,
        });
      }
      const hashedPassword = await argon.hash(changePassword.newPassword);
      user.password = hashedPassword;
      await this.usersRepository.save(user);
      return res.status(200).json({});
    } catch (error) {
      throw new BadRequestException(error.message);
    }
  }
}
