import { Injectable, BadRequestException } from '@nestjs/common';
import * as nodemailer from 'nodemailer';
import * as fs from 'fs';
@Injectable()
export class EmailService {
  async sendEmail(email: string, res): Promise<any> {
    try {
      const transporter = nodemailer.createTransport({
        service: 'gmail',
        auth: {
          user: 'duowngm1503@gmail.com',
          pass: 'aozmdzfjthdslkeb',
        },
      });
      const html_content = fs.readFileSync(
        'C:/Users/MSI/Desktop/PRJNESTJS/server/src/email/template.html',
        'utf8',
      );
      const mailOptions = {
        from: 'duowngm1503@gmail.com',
        to: email,
        subject: 'THEGIOIDIDONG',
        html: html_content,
      };
      await transporter.sendMail(mailOptions);
      return res.status(200).json({});
    } catch (error) {
      console.error('Error sending forget password email:', error);
      throw new Error('Failed to send the forget password email.');
    }
  }
  async sendEmailLockUser(lock_email: string, res) {
    try {
      const transporter = nodemailer.createTransport({
        service: 'gmail',
        auth: {
          user: 'duowngm1503@gmail.com',
          pass: 'aozmdzfjthdslkeb',
        },
      });
      const html_content = fs.readFileSync(
        'C:/Users/MSI/Desktop/PRJNESTJS/server/src/email/lock_user.html',
        'utf8',
      );
      const mailOptions = {
        from: 'duowngm1503@gmail.com',
        to: lock_email,
        subject: 'THEGIOIDIDONG',
        html: html_content,
      };
      await transporter.sendMail(mailOptions);
      return res.status(200).json({});
    } catch (error) {
      throw new Error('Failed to send email.');
    }
  }
}
