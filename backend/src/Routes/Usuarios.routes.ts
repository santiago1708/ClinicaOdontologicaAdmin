import { Router } from 'express'
import { loginUsuarios } from '../Controllers/Usuarios.controller'

const router = Router();


router.post('/login', loginUsuarios);

export default router;