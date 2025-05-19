import { Router } from "express";
import { PacienteController } from '../Controllers/Paciente.controller'

const router = Router();

router.get('/paciente/:numdocumento', PacienteController.obtenerinformacionpaciente)
router.put('/updatepaciente/:numdocumento', PacienteController.updateinformacionpaciente)
router.get('/historialclinico/:numdocumento', PacienteController.viewhistorialclinico)
router.get('/historialclinicodiente/:numdocumento', PacienteController.viewhistorialclinicodiente)
router.get('/facturas/:numdocumento', PacienteController.viewfacturacionesconmonto)
router.get('/historialcitas/:numdocumento', PacienteController.viewhistorialcitas)
router.post('/agendarcita', PacienteController.agendarcita)
router.put('/actualizarestadocita', PacienteController.updateestadocita)

export default router;