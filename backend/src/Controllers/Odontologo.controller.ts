import pool from "../db";


export class OdontologoController {
    static obtenerinformacionodontologo = async (req, res) => {
        const { numdocumento } = req.params;
        try {
            const query = `
                SELECT * FROM Personal.InformacionOdontologo
                WHERE numdocumentoodontolo = $1;
            `;

            const values = await pool.query(query, [numdocumento]);
            if (values.rows.length === 0) {
                return res.status(404).json({ message: 'Odontólogo no encontrado' });
            }

            res.status(200).json(values.rows[0]);
        } catch (error) {
            console.error("Error al buscar el odontólogo:", error);
            res.status(500).json({ error: "Ocurrió un error al buscar el odontólogo", detalle: error.message });
        }
    }

    static updateinformacionodontologo = async (req, res) => {
        const { numdocumento } = req.params;
        const { nombreuno, nombredos, apellidouno, apellidodos, anios, especialidad, numerotelefono } = req.body;

        try {
            const query = `
                CALL Personal.ActualizarInformacionOdontologo(
                    $1, $2, $3, $4, $5, $6, $7, $8
                );
            `;
            await pool.query(query, [numdocumento, nombreuno, nombredos, apellidouno, apellidodos, anios, especialidad, numerotelefono]);

            res.status(200).json({ message: 'Información del odontólogo actualizada exitosamente' });
        } catch (error) {
            console.error("Error al actualizar la información del odontólogo:", error);
            res.status(500).json({ error: "Ocurrió un error al actualizar la información del odontólogo", detalle: error.message });
        }
    }

    static updatehistorialclinicopaciente = async (req, res) => {
        const {
            numdocumentopaciente,
            diagnostico,
            idestadoTratamiento,
            idtratamientos,
            codcita,
            cantidadarecursosusados,
            descripcionrecursos,
            iddiente,
            idestadoDiente,
            resultadotratamiento
        } = req.body;

        try {
            const query = `
            CALL Clinica.ActualizarHistorialClinicoCita(
                $1, $2, $3, $4, $5, $6, $7, $8, $9, $10
            );
        `;

            await pool.query(query, [
                numdocumentopaciente,
                diagnostico,
                idestadoTratamiento,
                idtratamientos,             
                codcita,
                cantidadarecursosusados,    
                descripcionrecursos,       
                iddiente,                   
                idestadoDiente,             
                resultadotratamiento       
            ]);

            res.status(200).json({ message: 'Historial registrado correctamente' });

        } catch (error) {
            console.error("Error al registrar el tratamiento:", error);
            res.status(500).json({ error: "Ocurrió un error al registrar el tratamiento", detalle: error.message });
        }
    }

    static viewcitasasignadas = async (req, res) => {
        const { idodontologo } = req.params;
        try {
            const query = `
                SELECT * FROM Personal.CitasAsignadas($1);
            `;
            const values = await pool.query(query, [idodontologo]);
            if (values.rows.length === 0) {
                res.status(404).json({ message: 'No hay citas asignadas para este odontólogo' });
            }
            res.status(200).json(values.rows);
        } catch (error) {
            console.error("Error al buscar las citas asignadas:", error);
            res.status(500).json({ error: "Ocurrió un error al buscar las citas asignadas", detalle: error.message });
        }
    }

    static createfacturacita = async (req, res) => {
        const { codcita, codmetodopago, numdocumentopaciente} = req.body;

        try {
            const query = `
                CALL Facturacion.AgregarFactura($1, $2, $3);
            `;

            await pool.query(query, [codcita, codmetodopago, numdocumentopaciente]);
            res.status(200).json({ message: 'Factura creada exitosamente' });
        } catch (error) {
            console.error("Error al crear la factura:", error);
            res.status(500).json({ error: "Ocurrió un error al crear la factura", detalle: error.message });
        }
    }

    static viewfacturasporidpaciente = async (req, res) => {
        const { numdocumentopaciente } = req.body;

        try {
            const query = `
                SELECT * FROM Facturacion.ObtenerFacturacionPorNumDoc($1);
            `
            const values = await pool.query(query, [numdocumentopaciente]);
            if (values.rows.length === 0) {
                res.status(404).json({ message: 'No hay facturas para este paciente' });
            }
            res.status(200).json(values.rows);
        } catch (error) {
            console.error("Error al buscar las facturas:", error);
            res.status(500).json({ error: "Ocurrió un error al buscar las facturas", detalle: error.message });
        }
    }

    static viewfacturasporidcita = async (req, res) => {
        const { idcita } = req.body;

        try {
            const query = `
                SELECT * FROM Facturacion.ObtenerFacturacionPorCita($1);
            `
            const values = await pool.query(query, [idcita]);
            if (values.rows.length === 0) {
                res.status(404).json({ message: 'No hay facturas para este paciente' });
            }
            res.status(200).json(values.rows);
        } catch (error) {
            console.error("Error al buscar las facturas:", error);
            res.status(500).json({ error: "Ocurrió un error al buscar las facturas", detalle: error.message });
        }
    }

    static viewcitaporidpaciente = async (req, res) => {
        const { numdocumentopaciente } = req.body;

        try {
            const query = `
                SELECT * FROM Clinica.ObtenerCitasPorNumDoc($1);
            `
            const values = await pool.query(query, [numdocumentopaciente]);
            if (values.rows.length === 0) {
                res.status(404).json({ message: 'No hay facturas para este paciente' });
            }
            res.status(200).json(values.rows);
        } catch (error) {
            console.error("Error al buscar la cita:", error);
            res.status(500).json({ error: "Ocurrió un error al buscar la cita", detalle: error.message });
        }
    }

    static viewhistorialclinicoidpaciente = async (req, res) => {
        const { numdocumentopaciente } = req.body;

        try {
            const query = `
                SELECT * FROM Clinica.obtenerHistorialClinico($1);
            `
            const values = await pool.query(query, [numdocumentopaciente]);
            if (values.rows.length === 0) {
                res.status(404).json({ message: 'No hay facturas para este paciente' });
            }
            res.status(200).json(values.rows);
        } catch (error) {
            console.error("Error al buscar el historial clinico:", error);
            res.status(500).json({ error: "Ocurrió un error al buscar el historial clinico", detalle: error.message });
        }
    }

    static viewhistorialclinicodienteidpaciente = async (req, res) => {
        const { numdocumentopaciente } = req.params;

        try {
            const query = `
            SELECT * FROM Clinica.historialclinicopacientediente where numdocumentopaciente = $1;`;
            const values = await pool.query(query, [numdocumentopaciente]);
            if (values.rows.length === 0) {
                return res.status(404).json({ message: 'Historial clínico del diente no encontrado' });
            }
            res.status(200).json(values.rows);
        } catch (error) {
            console.error("Error buscar el historial clinico del diente:", error);
            res.status(500).json({ error: "Ocurrió un error al buscar el historial clinico del diente" });
        }
    }

    static viewtratamientos = async (req, res) => {
        try {
            const query = `
                SELECT idtratamiento, nombretratamiento FROM tratamientos.tratamiento;
            `;
            const values = await pool.query(query);
            res.status(200).json(values.rows);
        } catch (error) {
            console.error("Error al buscar los tratamientos:", error);
            res.status(500).json({ error: "Ocurrió un error al buscar los tratamientos"});
        }
    }

    static viewdientes = async (req, res) => {
        try {
            const query = `
                SELECT iddiente, numerodiente FROM Clinica.diente;
            `;
            const values = await pool.query(query);
            res.status(200).json(values.rows);
        } catch (error) {
            console.error("Error al buscar los dientes:", error);
            res.status(500).json({ error: "Ocurrió un error al buscar los dientes"});
        }
    }

}