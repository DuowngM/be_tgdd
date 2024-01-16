import { Controller, Post, Body } from '@nestjs/common';
import { PaymentService } from './payment.service';
import { ApiBody, ApiTags } from '@nestjs/swagger';
import { CheckoutPaymentDto } from './dto/checkout-payment.dto';

@Controller('payment')
@ApiTags('payment')
export class PaymentController {
  constructor(private readonly paymentService: PaymentService) { }

  @Post('checkout')
  @ApiBody({ type: CheckoutPaymentDto })
  async checkoutPayment(@Body() checkoutPayment: CheckoutPaymentDto) {
    return await this.paymentService.checkoutPayment(checkoutPayment);
  }
}
