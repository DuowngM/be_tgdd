import { ApiProperty } from '@nestjs/swagger';

export class CheckoutPaymentDto {
    @ApiProperty({ default: 300, required: true })
    public total: number;
    @ApiProperty({ default: '123123123123', required: true })
    public customerId: string;
    @ApiProperty({ default: 'some note', required: true })
    public note: string;
    @ApiProperty({ default: 'home_delivery', required: true })
    public deliveryOption: string;

    constructor(total: number, customerId: string, note: string, deliveryOption: string) {
        this.total = total;
        this.customerId = customerId;
        this.note = note;
        this.deliveryOption = deliveryOption;
    }
}
