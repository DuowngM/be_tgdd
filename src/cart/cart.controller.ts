import {
  Controller,
  Body,
  Post,
  Get,
  Put,
  Delete,
  Res,
  Param,
  Query,
} from '@nestjs/common';
import { CartService } from './cart.service';
import { AddToCart } from './dtos/cart.dto';
import { Response } from 'express';
@Controller('cart')
export class CartController {
  constructor(private cartService: CartService) {}
  @Get('/:id')
  getOneCart(@Param('id') id: string, @Res() res: Response) {
    return this.cartService.getOneCart(id, res);
  }
  @Post()
  addToCart(@Body() product: AddToCart, @Res() res: Response) {
    return this.cartService.addToCart(product, res);
  }
  @Delete()
  deleteCartAfterPay(@Query('id') id: string, @Res() res: Response) {
    return this.cartService.deleteCartAfterPay(id, res);
  }
  @Delete('/:id/:user_id')
  deleteProduct(
    @Param('id') id: string,
    @Param('user_id') user_id: string,
    @Res() res: Response,
  ) {
    return this.cartService.deleteProduct(id, user_id, res);
  }
}
