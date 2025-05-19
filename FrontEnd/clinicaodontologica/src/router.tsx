import { BrowserRouter, Routes, Route } from 'react-router-dom';
import LoginClinica from './Login/LoginClinica';
import HomeAdministrador from './View/Administrador/HomeAdministrador';
import HomeOdontologo from './View/Odontologo/HomeOdontologo';
import HomePaciente from './View/Paciente/HomePaciente';
import InformacionPersonalPa from './View/Paciente/InformacionPersonalPa';
import EditarInformacionPaciente from './View/Paciente/EditarInformacionPaciente';
import Historialclinicodiente from './View/Paciente/Historialclinicodiente';
import HistorialFactura from './View/Paciente/HistorialFactura';
import HistorialCitas from './View/Paciente/HistorialCitas';
import AgregarFactura from './View/Odontologo/AgregarFactura';
import ActualizarHistorialClinico from './View/Odontologo/ActualizarHistorialClinico';
import InformacionPersonalOdontologo from './View/Odontologo/InformacionPersonalOdontologo';
import EditarInformacionodontologo from './View/Odontologo/EditarInformacionodontologo';
import BuscarFactura from './View/Odontologo/BuscarFactura';
import BuscarCita from './View/Odontologo/BuscarCita';
import BuscarHistorialClinico from './View/Odontologo/BuscarHistorialClinico';
import HistorialDientes from './View/Odontologo/HistorialDientes';
import CrearTratamiento from './View/Administrador/CrearTratamiento';
import DiasLaborales from './View/Administrador/DiasLaborales';
import Auditorias from './View/Administrador/Auditorias';

export default function Router() {

    return (
        <BrowserRouter>
            <Routes>
                <Route path="/login" element={<LoginClinica />} />
                <Route path='/Homeodontologo' element={<HomeOdontologo />} />
                <Route path='/Informacionodontologo' element={<InformacionPersonalOdontologo />} />
                <Route path='/Homepaciente' element={<HomePaciente />} />
                <Route path='/Homeadministrador' element={<HomeAdministrador />} />
                <Route path="/informacionpaciente" element={<InformacionPersonalPa />} />
                <Route path='/paciente/editarinformacion' element={<EditarInformacionPaciente />} />
                <Route path='/Homepaciente/historialclinicodiente' element={<Historialclinicodiente />} />
                <Route path='/facturas' element={<HistorialFactura />} />
                <Route path='/historialcitaspaciente' element={<HistorialCitas />} />
                <Route path="/odontologo/factura/:codcita" element={<AgregarFactura />} />
                <Route path="/odontologo/historial/:codcita" element={<ActualizarHistorialClinico />} />
                <Route path='/editarinfoodontologo' element={<EditarInformacionodontologo />}/>
                <Route path='/buscarfacturapaciente' element={<BuscarFactura />}/>
                <Route path='/buscarcitapaciente' element={<BuscarCita />}/>
                <Route path='/buscarhistorialclinicopaciente' element={<BuscarHistorialClinico />}/>
                <Route path='/historialdientes/:numdocumentopaciente' element={<HistorialDientes />}/>
                <Route path='/administrartratamientos' element={<CrearTratamiento />}/>
                <Route path='/diaslaborales' element={<DiasLaborales />}/>
                <Route path='/auditorias' element={<Auditorias />}/>
            </Routes>
        </BrowserRouter>
    )
}