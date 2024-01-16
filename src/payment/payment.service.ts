import { Injectable } from '@nestjs/common';
import { CheckoutPaymentDto } from './dto/checkout-payment.dto';
import { StripeHelper, StripeProduct } from './stripe.helper';

@Injectable()
export class PaymentService {
  private stripeHelper: StripeHelper;
  constructor(stripeHelper: StripeHelper) {
    this.stripeHelper = stripeHelper;
  }

  async checkoutPayment(payment: CheckoutPaymentDto): Promise<any> {
    let email = 'testuser@stripe.com';
    let userId = await this.stripeHelper.createUser(email)
    let feDomain = process.env.FE_DOMAIN;
    let product: StripeProduct = {
      price: payment.total,
      currency: 'usd',
      name: 'Total',
      quantity: 1,
    };

    let url = await this.stripeHelper.checkoutPayment(userId, [product], feDomain);
    return {
      status: 'success',
      url: url,
    }
  }
}
