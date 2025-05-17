import express from 'express';
import routerUsuarios from './Routes/Usuarios.routes';

const app = express();

// Middleware
app.use(express.json());
app.use(express.urlencoded({ extended: false }));   

app.use('/api', routerUsuarios)


export default app;