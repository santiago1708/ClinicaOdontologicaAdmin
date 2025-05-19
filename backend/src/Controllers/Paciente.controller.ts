import pool from "../db";

export class PacienteController {
    static obtenerinformacionpaciente = async (req, res) => {
        const { numdocumento } = req.params;
        try {
            const query = `
                SELECT * FROM Pacientes.InformacionPaciente
                WHERE numdocumentopaciente = $1;
            `;

            const values = await pool.query(query, [numdocumento]);
            if (values.rows.length === 0) {
                return res.status(404).json({ message: 'Paciente no encontrado' });
            }

            res.status(200).json(values.rows[0]);
        } catch (error) {
            console.error("Error al buscar el paciente:", error);
            res.status(500).json({ error: "Ocurrió un error al buscar el paciente" });
        }
    }

    static updateinformacionpaciente = async (req, res) => {
        const { numdocumento } = req.params;
        const documentoint = parseInt(numdocumento, 10);
        const { nombreuno, nombredos, apellidouno, apellidodos, alturapaciente, numerotelefono, pesopaciente } = req.body

        try {
            const query = `
                CALL Pacientes.actualizarinformacionpaciente(
                    $1, $2, $3, $4, $5, $6, $7, $8
                );
            `;

            await pool.query(query, [documentoint, nombreuno, nombredos, apellidouno, apellidodos, alturapaciente, numerotelefono, pesopaciente]);

            res.status(200).json({ Message: 'Paciente actualizado exitosamente' });

        } catch (error) {
            console.error("Error al editar el paciente:", error);
            res.status(500).json({ error: "Ocurrió un error al editar el paciente",
            detalle: error.message });
        }
    }

    static viewhistorialclinico = async (req, res) => {
        const { numdocumento } = req.params;

        try {
            const query = `
                SELECT * FROM Clinica.HistorialClinicoVista WHERE numdocumentopaciente = $1;
            `;

            const values = await pool.query(query, [numdocumento]);
            if (values.rows.length === 0) {
                return res.status(404).json({ message: 'Historial clínico no encontrado' });
            }
            res.status(200).json(values.rows[0]);
            
        } catch (error) {
            console.error("Error buscar el historial clinico:", error);
            res.status(500).json({ error: "Ocurrió un error al buscar el historial clinico" });
        }
    }

    static viewhistorialclinicodiente = async (req, res) => {
        const { numdocumento } = req.params;
        try {
            const query = `
            SELECT * FROM Clinica.historialclinicopacientediente where numdocumentopaciente = $1;`;
            const values = await pool.query(query, [numdocumento]);
            if (values.rows.length === 0) {
                return res.status(404).json({ message: 'Historial clínico del diente no encontrado' });
            }
            res.status(200).json(values.rows);
        } catch (error) {
            console.error("Error buscar el historial clinico del diente:", error);
            res.status(500).json({ error: "Ocurrió un error al buscar el historial clinico del diente" });
        }
    }

    static viewfacturacionesconmonto = async (req, res) => {
        const { numdocumento } = req.params;
        try {
            const query = `
             SELECT * FROM Facturacion.FacturacionesConMonto where numdocumentopaciente = $1;`;
            const values = await pool.query(query, [numdocumento]);
            if (values.rows.length === 0) {
                return res.status(404).json({ message: 'Facturaciones con monto no encontrado' });
            }
            res.status(200).json(values.rows);
        } catch (error) {
            console.error("Error buscar al busca las facturas:", error);
            res.status(500).json({ error: "Ocurrió un error al buscar las facturas" });
        }
    }

    static viewhistorialcitas = async (req, res) => {
        const { numdocumento } = req.params;
        try {
            const query = `
                SELECT * FROM Clinica.TodaslasCitas where numdocumentopaciente = $1;
            `;
            const values = await pool.query(query, [numdocumento]);
            if (values.rows.length === 0) {
                return res.status(404).json({ message: 'Historial de citas no encontrado' });
            }
            res.status(200).json(values.rows);
        } catch (error) {
            console.error("Error buscar el historial de citas:", error);
            res.status(500).json({ error: "Ocurrió un error al buscar el historial de citas" });
        }
    }

    static agendarcita = async (req, res) => {
        const { fecha, hora, observacion, duracion, numdocumento} = req.body;
        try {
            const query = `
                CALL Clinica.agendarcita(
                    $1, $2, $3, $4, $5
                );
            `;
            const values = await pool.query(query, [fecha, hora, observacion, duracion, numdocumento]);

            res.status(200).json({ message: 'Cita agendada exitosamente', data: values.rows[0] });
        } catch (error) {
            console.error("Error al agendar la cita:", error);
            res.status(500).json({
            error: "Ocurrió un error al agendar la cita",
            detalle: error.message
            });
        }
    }

    static updateestadocita = async (req, res) => {
        const { codcita, estadocita} = req.body

        try {
            const query = `
                CALL Clinica.ActualizarEstadoAsistenciaCita($1, $2);
            `;
            const values = await pool.query(query, [codcita, estadocita]);
            res.status(200).json({ message: 'Asistencia cancelada exitosamente', data: values.rows[0]})
        } catch (error) {
            console.error("Error al agendar cambiar el estado:", error);
            res.status(500).json({
            error: "Ocurrió un error al cambiar el estado",
            detalle: error.message
            });
        }
    }
}