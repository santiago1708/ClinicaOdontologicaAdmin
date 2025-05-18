import { useState } from "react";
import { Link } from "react-router-dom";
import { Menu, X } from "lucide-react";

export default function NavbarPaciente() {
    const [isOpen, setIsOpen] = useState(false);

    const toggleMenu = () => setIsOpen(!isOpen);

    return (
        <nav className="bg-white shadow-md dark:bg-gray-900 dark:text-white">
            <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
                <div className="flex justify-between items-center h-16">
                    {/* Logo o título */}
                    <Link to="/" className="text-2xl font-bold text-blue-600 dark:text-blue-400">
                        Clínica Odontologica
                    </Link>

                    {/* Botones escritorio */}
                    <div className="hidden md:flex space-x-6">
                        <Link to="/HomePaciente" className="hover:text-blue-600 transition">Inicio</Link>
                        <Link to="/informacionpaciente" className="hover:text-blue-600 transition">Información Personal</Link>
                        <Link to="/facturas" className="hover:text-blue-600 transition">Historial Factura</Link>
                        <Link to="/historialcitaspaciente" className="hover:text-blue-600 transition">Historial Citas</Link>
                        <Link to="/login" className="hover:text-red-600 transition">Salir</Link>
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
                    <Link to="/" className="block hover:text-blue-600">Inicio</Link>
                    <Link to="/informacion" className="block hover:text-blue-600">Información Personal</Link>
                    <Link to="/facturas" className="block hover:text-blue-600">Historial Factura</Link>
                    <Link to="/citas" className="block hover:text-blue-600">Historial Citas</Link>
                </div>
            )}
        </nav>
    );
}
