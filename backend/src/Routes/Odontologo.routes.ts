import { Router } from "express";
import {OdontologoController} from '../Controllers/Odontologo.controller'


const router = Router();

router.get('/odontologo/:numdocumento', OdontologoController.obtenerinformacionodontologo)
router.put('/updateodontologo/:numdocumento', OdontologoController.updateinformacionodontologo)
router.put('/historialclinicopacienteupdate', OdontologoController.updatehistorialclinicopaciente)
router.get('/citasasignadas/:idodontologo', OdontologoController.viewcitasasignadas)
router.post('/agregarfactura', OdontologoController.createfacturacita)
router.get('/facturaspacienteid' , OdontologoController.viewfacturasporidpaciente)
router.get('/facturasidcita' , OdontologoController.viewfacturasporidcita)
router.get('/citaporidpaciente' , OdontologoController.viewcitaporidpaciente)
router.get('/historialporid' , OdontologoController.viewhistorialclinicoidpaciente)
router.get('/historialdienteporid' , OdontologoController.viewhistorialclinicodienteidpaciente)


export default router;