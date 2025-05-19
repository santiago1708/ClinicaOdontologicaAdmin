import { Router } from "express";
import {OdontologoController} from '../Controllers/Odontologo.controller'


const router = Router();

router.get('/odontologo/:numdocumento', OdontologoController.obtenerinformacionodontologo)
router.put('/updateodontologo/:numdocumento', OdontologoController.updateinformacionodontologo)
router.put('/historialclinicopacienteupdate', OdontologoController.updatehistorialclinicopaciente)
router.get('/citasasignadas/:idodontologo', OdontologoController.viewcitasasignadas)
router.post('/agregarfactura', OdontologoController.createfacturacita)
router.post('/facturaspacienteid' , OdontologoController.viewfacturasporidpaciente)
router.post('/facturasidcita' , OdontologoController.viewfacturasporidcita)
router.post('/citaporidpaciente' , OdontologoController.viewcitaporidpaciente)
router.post('/historialporid' , OdontologoController.viewhistorialclinicoidpaciente)
router.get('/historialdienteporid/:numdocumentopaciente' , OdontologoController.viewhistorialclinicodienteidpaciente)
router.get('/listadiente', OdontologoController.viewdientes)
router.get('/listatratamientos', OdontologoController.viewtratamientos)


export default router;