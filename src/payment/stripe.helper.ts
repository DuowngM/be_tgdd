import { Global, Injectable, OnModuleInit } from '@nestjs/common';
import Stripe from 'stripe';

export interface StripeProduct {
    price: number;
    currency: string;
    name: string;
    quantity: number;
}

@Injectable()
@Global()
export class StripeHelper implements OnModuleInit {
    private stripe: Stripe;
    onModuleInit() {
        this.stripe = new Stripe(process.env.STRIPE_SECRET_KEY, {
            typescript: true,
        });
    }

    async createUser(email: string): Promise<string> {
        const users = (await this.stripe.customers.list({ email: email })).data;
        const isExistedUser = users.length > 0;

        if (isExistedUser) {
            return users.pop().id;
        }

        const user = await this.stripe.customers.create({
            email,
        });
        return user.id;
    }
    async checkoutPayment(
        userid: string,
        products: StripeProduct[],
        feDomain: string,
    ): Promise<any> {
        const params: Stripe.Checkout.SessionCreateParams = {
            submit_type: 'pay',
            payment_method_types: ['card'],
            mode: 'payment',
            line_items: [
                ...products.map((product) => {
                    return {
                        quantity: product.quantity,
                        price_data: {
                            currency: product.currency,
                            unit_amount: product.price * 100,
                            product_data: {
                                name: product.name,
                            },
                        },
                    };
                }),
            ],
            customer: userid,
            success_url: `https://${feDomain}/?paymentSuccess=true`,
            cancel_url: `https://${feDomain}/payment/?paymentSuccess=false`,
        };
        const checkoutSession = await this.stripe.checkout.sessions.create(params);
        return checkoutSession.url;
    }
}
