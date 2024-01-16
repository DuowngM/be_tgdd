import {
  Controller,
  Get,
  Param,
  Res,
  Body,
  Post,
  Delete,
} from '@nestjs/common';
import { VoucherService } from './voucher.service';
import { Response } from 'express';
@Controller('voucher')
export class VoucherController {
  constructor(public voucherService: VoucherService) {}
  @Get()
  getAllVoucher(@Res() res: Response) {
    return this.voucherService.getAllVoucher(res);
  }
  @Get('/:voucher')
  getOneVoucher(@Param('voucher') voucher: string, @Res() res: Response) {
    return this.voucherService.getOneVoucher(voucher, res);
  }
  @Post()
  addNewVoucher(@Body() voucher: any, @Res() res: Response) {
    return this.voucherService.addNewVoucher(voucher, res);
  }
  @Delete('/:id')
  deleteVoucher(@Param('id') id: number, @Res() res: Response) {
    console.log(id);

    return this.voucherService.deleteVoucher(id, res);
  }
}
