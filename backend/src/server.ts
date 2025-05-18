import express from 'express';
import routerUsuarios from './Routes/Usuarios.routes';
import routerPacientes from './Routes/Paciente.routes';

const app = express();

// Middleware
app.use(express.json());
app.use(express.urlencoded({ extended: false }));   

app.use('/api', routerUsuarios)
app.use('/api', routerPacientes)


export default app;