import { Router } from 'express';
import { UsuariosController } from '../Controllers/Usuarios.controller'

const router = Router();

router.post('/login', UsuariosController.loginUsuarios);
router.post('/create', UsuariosController.createusuarios);
router.put('/update/:idusuario', UsuariosController.updateusuario);

export default router;