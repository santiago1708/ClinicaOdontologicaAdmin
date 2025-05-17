import { Request, Response } from 'express';
import { pool } from "../db";

export const loginUsuarios = async (req  , res )  => {
    const { emailusuario, contraseñausuario } = req.body;
    try {
        const query = `SELECT * FROM seguridad.iniciarSesion($1, $2)`;

        const values = await pool.query(query, [emailusuario, contraseñausuario]);
        if (values.rows.length === 0) {
            return res.status(401).json({
                message: 'Login successful'
            });
        } 
        res.status(200).json(values.rows[0]);
    } catch (error) {
        console.error('Error al iniciar' , error);
        res.status(500).json({message: 'Error al iniciar sesión'})
    }
}