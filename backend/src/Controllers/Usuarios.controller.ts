import pool from "../db";

export class UsuariosController {
    static loginUsuarios = async (req, res) => {
        const { emailusuario, contraseñausuario } = req.body;

        try {
            const query = `SELECT * FROM seguridad.iniciarSesion($1, $2)`;
            const values = await pool.query(query, [emailusuario, contraseñausuario]);

            if (values.rows.length === 0) {
                return res.status(401).json({ message: 'Credenciales inválidas' });
            }

            return res.status(200).json({
                message: 'Login exitoso',
                data: values.rows[0],
            });

        } catch (error) {
            console.error('Error al iniciar sesión:', error);
            return res.status(500).json({ message: 'Error al iniciar sesión' });
        }
    }

    static createusuarios = async (req, res) => {
        const {contraseñausuario, emailusuario, rolusuario} = req.body;
        try {
            const query = `
                CALL seguridad.crearUsuario(
                    p_contrasenaUsuario := $1, 
                    p_emailUsuario := $2, 
                    p_idRol := $3
                );
            `;

            await pool.query(query, [contraseñausuario, emailusuario, rolusuario]);

            res.status(200).json({Message: 'Usuario creado exitosamente'});
        } catch (error) {
            console.error('Error al crear el usuario:', error);
            return res.status(500).json({ message: 'Error al crear el usuario' });
        }
    }

    static updateusuario = async (req,res) => {
        const {idusuario} = req.params;
        const {nuevacontraseña} = req.body;
        
        try {
            const query = `
                CALL Seguridad.editarUsuario(
                    pidUsuario := $1,
                    pnuevaContrasena := $2
                );
            `;
            await pool.query(query, [idusuario, nuevacontraseña]);
            res.status(200).json({Message: 'Usuario actualizado exitosamente'});

        } catch (error) {
            console.log('Error al modificar el usuario:', error);
            res.status(500).json({error: 'Ocurrio un error al modificar el usuario'})
        }
    }
}

