import pool from "../db";


export class OdontologoController {
    static obtenerinformacionodontologo = async (req, res) => {
        const { numdocumento } = req.params;
        try {
            const query = `
                SELECT * FROM Personal.InformacionOdontologo
                WHERE numdocumentoodontologo = $1;
            `;

            const values = await pool.query(query, [numdocumento]);
            if (values.rows.length === 0) {
                return res.status(404).json({ message: 'Odontólogo no encontrado' });
            }

            res.status(200).json(values.rows[0]);
        } catch (error) {
            console.error("Error al buscar el odontólogo:", error);
            res.status(500).json({ error: "Ocurrió un error al buscar el odontólogo" });
        }
    }



}