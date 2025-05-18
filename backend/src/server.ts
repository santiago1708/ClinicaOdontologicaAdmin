import express from 'express';
import cors from 'cors';
import morgan from 'morgan'
import './mongo'
import routerUsuarios from './Routes/Usuarios.routes';
import routerPacientes from './Routes/Paciente.routes';
import routerOdontologos from './Routes/Odontologo.routes';
import routerAdministracion from './Routes/Administracion.routes';
import routerImagePaciente from './Routes/ImagePaciente.routes';

const app = express();

// Middleware
app.use(cors());
app.use(morgan('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));   

app.use('/api', routerUsuarios)
app.use('/api', routerPacientes)
app.use('/api', routerOdontologos)
app.use('/api/administrador', routerAdministracion)
app.use('/api/paciente', routerImagePaciente)


export default app;