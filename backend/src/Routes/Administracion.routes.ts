import { Router } from 'express'
import { AdministracionController } from '../Controllers/Administracion.controller'

const router = Router()

router.post('/generarhorariolaborales', AdministracionController.generardiaslaborales)
router.post('/tratamientonuevo', AdministracionController.createtratamiento)
router.get('/auditoriahistorialclinico', AdministracionController.getallauditoriaHistorialclinico)
router.get('/auditoriacitas', AdministracionController.getallauditoriaCitas)
router.get('/auditoriafacturacion', AdministracionController.getallauditoriafacturacion)
router.post('/crearpaciente', AdministracionController.createpaciente)

export default router;