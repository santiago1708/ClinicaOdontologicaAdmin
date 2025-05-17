import express from 'express';
import router from './Routes/Usuarios.routes';

const app = express();

// Middleware
app.use(express.json());
app.use(express.urlencoded({ extended: false }));   

app.use('/api', router)


export default app;