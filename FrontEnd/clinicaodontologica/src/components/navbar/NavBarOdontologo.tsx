import { useState } from "react";
import { Link, useNavigate } from "react-router-dom";
import { Menu, X } from "lucide-react";

export default function NavbarOdontologo() {
    const [isOpen, setIsOpen] = useState(false);
    const navigate = useNavigate();

    const toggleMenu = () => setIsOpen(!isOpen);

    const handleLogout = () => {
        console.log("Cerrando sesión...");
        navigate("/login");
    };

    return (
        <nav className="bg-white shadow-md dark:bg-gray-900 dark:text-white">
            <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
                <div className="flex justify-between items-center h-16">
                    {/* Título o logo */}
                    <Link
                        to="/odontologo/inicio"
                        className="text-2xl font-bold text-blue-600 dark:text-blue-400"
                    >
                        Panel Odontólogo
                    </Link>

                    {/* Navegación escritorio */}
                    <div className="hidden md:flex space-x-6">
                        <Link to="/HomeOdontologo" className="hover:text-blue-600 transition">Inicio</Link>
                        <Link to="/Informacionodontologo" className="hover:text-blue-600 transition">Información Personal</Link>
                        <Link to="/buscarfacturapaciente" className="hover:text-blue-600 transition">Buscar Factura</Link>
                        <Link to="/buscarcitapaciente" className="hover:text-blue-600 transition">Buscar Cita</Link>
                        <Link to="/buscarhistorialclinicopaciente" className="hover:text-blue-600 transition">Historial Clínico Paciente</Link>
                        <button
                            onClick={handleLogout}
                            className="hover:text-red-600 transition"
                        >
                            Salir
                        </button>
                    </div>

                    {/* Botón hamburguesa */}
                    <div className="md:hidden">
                        <button onClick={toggleMenu} className="text-gray-700 dark:text-white">
                            {isOpen ? <X size={28} /> : <Menu size={28} />}
                        </button>
                    </div>
                </div>
            </div>

            {/* Menú móvil */}
            {isOpen && (
                <div className="md:hidden px-4 pb-4 space-y-2 bg-white dark:bg-gray-900">
                    <Link to="/HomeOdontologo" className="block hover:text-blue-600">Inicio</Link>
                    <Link to="/Informacionodontologo" className="block hover:text-blue-600">Información Personal</Link>
                    <Link to="/buscarfacturapaciente" className="block hover:text-blue-600">Buscar Factura</Link>
                    <Link to="/buscarcitapaciente" className="block hover:text-blue-600">Buscar Cita</Link>
                    <Link to="/buscarhistorialclinicopaciente" className="block hover:text-blue-600">Historial Clínico Paciente</Link>
                    <button
                        onClick={handleLogout}
                        className="block text-left w-full hover:text-red-600"
                    >
                        Salir
                    </button>
                </div>
            )}
        </nav>
    );
}
