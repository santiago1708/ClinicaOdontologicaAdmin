import { Menu, X } from "lucide-react";
import { useState } from "react";
import { Link } from "react-router-dom";

export default function NavBarAdministrador() {

    const [isOpen, setIsOpen] = useState(false);

    const toggleMenu = () => setIsOpen(!isOpen);

    return (
        <nav className="bg-white shadow-md dark:bg-gray-900 dark:text-white">
            <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
                <div className="flex justify-between h-16 items-center">
                    {/* Logo */}
                    <div className="flex items-center">
                        <Link to="/" className="text-2xl font-bold text-blue-600 dark:text-blue-400">
                            Clínica Odontologica
                        </Link>
                    </div>

                    {/* Botones grandes */}
                    <div className="hidden md:flex space-x-6 items-center">
                        <Link to="/Homeadministrador" className="hover:text-blue-600 transition">Administrar Pacientes</Link>
                        <Link to="/administrartratamientos" className="hover:text-blue-600 transition">Administrar Tratamientos</Link>
                        <Link to="/diaslaborales" className="hover:text-blue-600 transition">Días Laborales</Link>
                        <Link to="/auditorias" className="hover:text-blue-600 transition">Auditorías</Link>
                        <Link to="/login" className="block hover:text-red-600">Salir</Link>
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
                    <Link to="/Homeadministrador" className="block hover:text-blue-600">Administrar Pacientes</Link>
                    <Link to="/administrartratamientos" className="block hover:text-blue-600">Administrar Tratamientos</Link>
                    <Link to="/diaslaborales" className="block hover:text-blue-600">Días Laborales</Link>
                    <Link to="/auditorias" className="block hover:text-blue-600">Auditorías</Link>
                    <Link to="/login" className="block hover:text-blue-600">Salir</Link>
                </div>
            )}
        </nav>
    )
}
