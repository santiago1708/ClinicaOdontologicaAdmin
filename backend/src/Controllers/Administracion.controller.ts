import pool from "../db";

export class AdministracionController {
    static generardiaslaborales = async (req, res) => {
        const { fechainicio, fechafin, horahorario, numcododontolog } = req.body;

        try {
            const query = `
                CALL Personal.GenerarHorariosLaborales(
                    $1, $2, $3, $4
                )
            `;

            await pool.query(query, [fechainicio, fechafin, horahorario, numcododontolog]);
            res.status(200).json({ message: 'Días laborales generados exitosamente' });

        } catch (error) {
            console.error("Error al generar los días laborales:", error);
            res.status(500).json({ error: "Ocurrió un error al generar los días laborales", detalle: error.message });
        }
    }

    static createpaciente = async (req, res) => {
        const { numdocumentopaciente, nombreuno, nombredos, apellidouno, apellidodos, fechanacimiento, pesopaciente, alturapaciente, numerotelefono, tipoafiliacion, 
            contraseñausuario, emailusuario} = req.body;

        try {
            const query = `
                CALL Pacientes.crearPaciente(
                    $1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12
                );
            `;
            await pool.query(query, [numdocumentopaciente, nombreuno, nombredos, apellidouno, apellidodos, fechanacimiento, pesopaciente, alturapaciente, numerotelefono, tipoafiliacion, contraseñausuario, emailusuario]);
            res.status(200).json({ message: 'Paciente creado exitosamente' });

        } catch (error) {
            console.error("Error al crear el paciente:", error);
            res.status(500).json({ error: "Ocurrió un error al crear el paciente", detalle: error.message });
        }
    }

    static getallauditoriaHistorialclinico = async (req, res) => {
        try {
            const query = `
                SELECT * FROM auditoria.historialclinicoauditoria;
            `;
            const values = await pool.query(query);
            if (values.rows.length === 0) {
                return res.status(404).json({ message: 'No se encontraron registros de auditoría' });
            }
            res.status(200).json(values.rows);
        } catch (error) {
            console.error("Error al obtener la auditoría del historial clínico:", error);
            res.status(500).json({ error: "Ocurrió un error al obtener la auditoría del historial clínico" });
        }
    }

    static getallauditoriaCitas = async (req, res) => {
        try {
            const query = `
                SELECT * FROM auditoria.citaauditoria;
            `;
            const values = await pool.query(query);
            if (values.rows.length === 0) {
                return res.status(404).json({ message: 'No se encontraron registros de auditoría' });
            }
            res.status(200).json(values.rows);
        } catch (error) {
            console.error("Error al obtener la auditoría de citas:", error);
            res.status(500).json({ error: "Ocurrió un error al obtener la auditoría de citas" });
        }
    }

    static getallauditoriafacturacion = async (req, res) => {
        try {
            const query = `
                SELECT * FROM auditoria.facturacionauditoria;
            `;
            const values = await pool.query(query);
            if (values.rows.length === 0) {
                return res.status(404).json({ message: 'No se encontraron registros de auditoría' });
            }
            res.status(200).json(values.rows);
        } catch (error) {
            console.error("Error al obtener la auditoría de facturación:", error);
            res.status(500).json({ error: "Ocurrió un error al obtener la auditoría de facturación" });
        }
    }

    static createtratamiento = async (req, res) => {
        const { nombretratamiento, descripciontratamiento, preciotratamiento, 
            idcategoriatratamiento
        } = req.body;

        try {
            const query = `
                CALL Tratamientos.AgregarTratamiento(
                    $1, $2, $3, $4
                )
            `
            const values = [nombretratamiento, descripciontratamiento, preciotratamiento, idcategoriatratamiento];
            await pool.query(query, values);
            res.status(201).json({ message: 'Tratamiento creado exitosamente' });
        } catch (error) {
            console.error("Error al crear el tratamiento:", error);
            res.status(500).json({ error: "Ocurrió un error al crear el tratamiento", detalle: error.message });
        }
    }

}