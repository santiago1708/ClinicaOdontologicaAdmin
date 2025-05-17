import { Pool } from 'pg';
import { db } from './config'

export const pool = new Pool({
    user: db.user,
    host: db.host,
    password: db.password,
    port: db.port,
    database: db.database,
})
