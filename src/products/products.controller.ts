import {
  Controller,
  Res,
  Get,
  Body,
  Post,
  Param,
  Put,
  Query,
  Patch,
  UseGuards,
} from '@nestjs/common';
import { ProductsService } from './products.service';
import { Response } from 'express';
import { InfoProduct, NewProduct } from './dtos/products.dto';
import { JwtAuthGuard } from 'src/auth/jwt/auth.guard';
import { JwtRolesGuard } from 'src/auth/jwt/roles.guard';
@Controller('products')
export class ProductsController {
  constructor(public productsService: ProductsService) {}
  @Get()
  getAllProducts(
    @Res() res: Response,
    @Query('page') page: number,
    @Query('limit') limit: number,
  ) {
    return this.productsService.getAllProducts(res, page, limit);
  }
  @Get('/allProducts')
  getProducts(@Res() res: Response) {
    return this.productsService.getProducts(res);
  }
  @Get('/details/:id')
  getOneProduct(@Res() res: Response, @Param('id') id: string) {
    return this.productsService.getOneProduct(res, id);
  }
  @Get('/:id')
  getProductByCategory(@Res() res: Response, @Param('id') id: string) {
    return this.productsService.getProductByCategory(res, id);
  }
  @Get('/find/search')
  getProductBySearch(@Query('key') key: string, @Res() res: Response) {
    return this.productsService.getProductBySearch(key, res);
  }
  @Post()
  addNewProduct(@Body() newProduct: NewProduct, @Res() res: Response) {
    return this.productsService.addNewProduct(newProduct, res);
  }
  @Put()
  updateProduct(@Body() infoUpdate: any, @Res() res: Response) {
    return this.productsService.updateProduct(infoUpdate, res);
  }
  @Put('/:id')
  updateStatusProductOn(@Res() res: Response, @Param('id') id: string) {
    return this.productsService.updateStatusProductOn(res, id);
  }
  @Patch('/:id')
  updateStatusProduct(@Res() res: Response, @Param('id') id: string) {
    return this.productsService.updateStatusProduct(res, id);
  }
}
