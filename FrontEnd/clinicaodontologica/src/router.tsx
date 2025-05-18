import { BrowserRouter, Routes, Route } from 'react-router-dom';
import LoginClinica from './Login/LoginClinica';
import HomeAdministrador from './View/Administrador/HomeAdministrador';
import HomeOdontologo from './View/Odontologo/HomeOdontologo';
import HomePaciente from './View/Paciente/HomePaciente';
import InformacionPersonalPa from './View/Paciente/InformacionPersonalPa';
import EditarInformacionPaciente from './View/Paciente/EditarInformacionPaciente';

export default function Router() {

    return (
        <BrowserRouter>
            <Routes>
                <Route path="/login" element={<LoginClinica />} />
                <Route path='/Homeadministrador' element={<HomeAdministrador />} />
                <Route path='/Homeodontologo' element={<HomeOdontologo />} />
                <Route path='/Homepaciente' element={<HomePaciente />} />
                <Route path="/informacionpaciente" element={ <InformacionPersonalPa /> }/>
                <Route path='/paciente/editarinformacion' element={<EditarInformacionPaciente />}/>
            </Routes>
        </BrowserRouter>
    )
}