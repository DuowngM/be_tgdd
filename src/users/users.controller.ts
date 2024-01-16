import {
  Controller,
  Get,
  Put,
  Delete,
  Param,
  Body,
  Res,
  Patch,
} from '@nestjs/common';
import { Response } from 'express';
import { CreateUserDto, UpdateUser } from './dtos/createUser.dto';
import { UsersService } from './users.service';
@Controller('users')
export class UsersController {
  constructor(public usersService: UsersService) {}
  @Get()
  async getAllUsers(@Res() res: Response) {
    return await this.usersService.getAllUsers(res);
  }
  @Get('/:id')
  async getOneUser(@Param('id') id: string, @Res() res: Response) {
    return await this.usersService.getOneUser(id, res);
  }
  @Put('/:id')
  async updateUser(
    @Body() updatedUser: any,
    @Param('id') id: string,
    @Res() res: Response,
  ) {
    return await this.usersService.updatedUser(id, updatedUser, res);
  }
  @Patch('/status/:id')
  async updateStatusUser(@Param('id') id: string, @Res() res: Response) {
    return await this.usersService.updateStatusUser(id, res);
  }
  @Put('/status/:id')
  async updateUnLockUser(@Param('id') id: string, @Res() res: Response) {
    return await this.usersService.updateUnLockUser(id, res);
  }
}
