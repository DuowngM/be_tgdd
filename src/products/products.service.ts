import { Injectable, BadRequestException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Product } from './product.entity';
import { Repository } from 'typeorm';

@Injectable()
export class ProductsService {
  constructor(
    @InjectRepository(Product) private productsRepository: Repository<Product>,
  ) {}
  async getProducts(res) {
    try {
      const products = await this.productsRepository.find({
        order: {
          product_id: 'DESC',
        },
      });

      return res.json({
        products,
      });
    } catch (error) {
      throw new BadRequestException(error);
    }
  }
  async getAllProducts(res, page, limit) {
    try {
      const products = await this.productsRepository.find({
        order: {
          product_id: 'DESC',
        },
        skip: (page - 1) * limit, // Calculate the number of items to skip based on the page and limit.
        take: limit,
      });

      return res.json({
        products,
      });
    } catch (error) {
      throw new BadRequestException(error);
    }
  }
  async getProductByCategory(res, id) {
    try {
      const products = await this.productsRepository.find({
        where: { categoryId: id },
      });
      return res.json({
        products,
      });
    } catch (error) {
      throw new BadRequestException(error);
    }
  }
  async getProductBySearch(key, res) {
    try {
      const products = await this.productsRepository
        .createQueryBuilder('product')
        .where('product_name LIKE :name', { name: `%${key}%` })
        .getMany();
      return res.json({
        products,
      });
    } catch (error) {
      throw new BadRequestException(error);
    }
  }
  async getOneProduct(res, id) {
    try {
      const findProduct = await this.productsRepository.findOne({
        where: { product_id: id },
      });
      return res.json({
        findProduct,
      });
    } catch (error) {
      throw new BadRequestException(error);
    }
  }

  async addNewProduct(newProduct, res) {
    try {
      const product = await this.productsRepository.create({
        brandId: newProduct.brandId,
        categoryId: newProduct.categoryId,
        price: newProduct.price,
        product_image: newProduct.product_image,
        product_name: newProduct.product_name,
        product_stocks: newProduct.product_stocks,
        description: newProduct.description,
        sold: 0,
        status: 'Available',
      });
      await this.productsRepository.save(product);
      return res.status(201).json({
        message: 'hehe',
      });
    } catch (error) {
      throw new BadRequestException(error);
    }
  }
  async updateProduct(infoProduct, res) {
    try {
      for (let i = 0; i < infoProduct.length; i++) {
        const productId = infoProduct[i].idProduct;
        const quantity = infoProduct[i].quantity;
        const product = await this.productsRepository.findOne({
          where: { product_id: productId },
        });
        if (!product) {
          throw new BadRequestException(
            `Product with ID ${productId} not found.`,
          );
        }

        product.product_stocks -= quantity;
        product.sold += quantity;

        await this.productsRepository.save(product);
      }

      res.json({
        status: 200,
        message: 'Số lượng sản phẩm đã được cập nhật trong kho.',
      });
    } catch (error) {
      throw new BadRequestException(error);
    }
  }
  async updateStatusProduct(res, id) {
    try {
      const findProduct = await this.productsRepository.findOne({
        where: { product_id: id },
      });
      findProduct.status = 'Disabled';
      await this.productsRepository.save(findProduct);
      return res.status(200).json({
        message: 'hehehe',
      });
    } catch (error) {
      throw new BadRequestException(error);
    }
  }
  async updateStatusProductOn(res, id) {
    try {
      const findProduct = await this.productsRepository.findOne({
        where: { product_id: id },
      });
      findProduct.status = 'Available';
      await this.productsRepository.save(findProduct);
      return res.status(200).json({
        message: 'hehehe',
      });
    } catch (error) {
      throw new BadRequestException(error);
    }
  }
}
