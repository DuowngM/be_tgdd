import { Injectable, BadRequestException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Not, Repository } from 'typeorm';
import { User } from './user.entity';
@Injectable()
export class UsersService {
  constructor(
    @InjectRepository(User) private usersRepository: Repository<User>,
  ) {}
  async getAllUsers(res) {
    try {
      const allUsers = await this.usersRepository.find();
      return res.status(200).json({
        allUsers,
      });
    } catch (error) {
      throw new BadRequestException(error);
    }
  }
  async getOneUser(id, res) {
    try {
      const findUser = await this.usersRepository.findOne({
        where: { user_id: id },
      });
      return res.json({
        findUser,
      });
    } catch (error) {
      throw new BadRequestException(error);
    }
  }
  async updatedUser(id, updatedUser, res) {
    try {
      const findUser = await this.usersRepository.findOne({
        where: { user_id: id },
      });

      findUser.user_name = updatedUser.user_name;
      findUser.address = updatedUser.address;
      findUser.gender = updatedUser.gender;
      findUser.date_of_birth = updatedUser.date_of_birth;
      findUser.user_email = updatedUser.user_email;
      await this.usersRepository.save(findUser);
      return res.json({
        findUser,
      });
    } catch (error) {
      throw new BadRequestException(error);
    }
  }
  async updateStatusUser(id, res) {
    try {
      const findUser = await this.usersRepository.findOne({
        where: { user_id: id },
      });
      findUser.status = 'Unavailable';
      await this.usersRepository.save(findUser);
      return res.status(200).json({
        message: 'Update successful',
        findUser,
      });
    } catch (error) {
      throw new BadRequestException(error);
    }
  }
  async updateUnLockUser(id, res) {
    try {
      const findUser = await this.usersRepository.findOne({
        where: { user_id: id },
      });
      findUser.status = 'Available';
      await this.usersRepository.save(findUser);
      return res.status(200).json({
        message: 'Update successful',
      });
    } catch (error) {
      throw new BadRequestException(error);
    }
  }
}
