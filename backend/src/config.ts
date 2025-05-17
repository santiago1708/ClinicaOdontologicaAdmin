import {config} from 'dotenv';

config();

export const db = {
    user: process.env.USERDATABASEPSQL,
    password: process.env.USERDATABASEPASSWORD,
    host: process.env.USERDATABASEHOST,
    port: Number(process.env.USERDATABASEPORT),
    database: process.env.USERDATABASE,
}
