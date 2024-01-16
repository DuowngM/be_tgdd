import { Module } from '@nestjs/common';
import { PaymentService } from './payment.service';
import { PaymentController } from './payment.controller';
import { StripeHelper } from './stripe.helper';

@Module({
  controllers: [PaymentController],
  providers: [PaymentService, StripeHelper]
})
export class PaymentModule { }
