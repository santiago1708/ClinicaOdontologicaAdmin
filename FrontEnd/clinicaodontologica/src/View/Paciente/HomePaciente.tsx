import NavbarPaciente from "../../components/navbar/NavBarPaciente";
import { limpiarCaracteresEspeciales } from '../../functions/Limpiarcaracterespecial'
import { useEffect, useState } from "react";
import axios from "axios";

// Importa iconos de react-icons
import { FaIdCard, FaUserAlt, FaRulerVertical, FaTooth, FaNotesMedical, FaHeartbeat, FaCalendarAlt } from "react-icons/fa";
import { useNavigate } from "react-router-dom";

interface HistorialClinicoData {
    numdocumentopaciente: string;
    nombre_completo: string;
    alturapaciente: string;
    "Tratamiento/s": string;  
    diagnosticohistorialclinico: string;
    estadotratamiento: string;
    fecharegistro: string;
}


export default function HomePaciente() {
    const [historial, setHistorial] = useState<HistorialClinicoData | null>(null);
    const [loading, setLoading] = useState(true);
    const [error, setError] = useState("");

    const navigate = useNavigate();
    const numdocumento = localStorage.getItem("numdocumentopaciente");

    useEffect(() => {
        const fetchHistorial = async () => {
            try {
                const response = await axios.get(
                    `http://localhost:3000/api/historialclinico/${numdocumento}`
                );
                setHistorial(response.data);
            } catch (err) {
                console.error("Error al obtener el historial:", err);
                setError("No se pudo obtener el historial clínico.");
            } finally {
                setLoading(false);
            }
        };

        if (numdocumento) {
            fetchHistorial();
        } else {
            setError("No se encontró el número de documento del paciente.");
            setLoading(false);
        }
    }, [numdocumento]);

    return (
        <>
            <NavbarPaciente />

            <div className="p-6 bg-gray-50 min-h-screen">
                {loading && (
                    <p className="text-center text-blue-600 mt-20 animate-pulse font-semibold text-lg">
                        Cargando historial clínico...
                    </p>
                )}
                {error && (
                    <p className="text-center text-red-500 mt-20 font-semibold text-lg">{error}</p>
                )}

                {!loading && !error && historial && (
                    <>
                        <div className="max-w-4xl mx-auto mt-12 bg-white shadow-xl rounded-xl p-8 space-y-8 border border-gray-200">
                            <h2 className="text-3xl font-extrabold text-gray-900 border-b pb-4 mb-6">
                                Historial Clínico del Paciente
                            </h2>

                            <div className="grid grid-cols-1 sm:grid-cols-2 gap-8 text-gray-800 text-lg">
                                <div className="flex items-center space-x-3">
                                    <FaIdCard className="text-blue-500 text-2xl" />
                                    <span>
                                        <span className="font-semibold">Documento:</span> {historial.numdocumentopaciente}
                                    </span>
                                </div>

                                <div className="flex items-center space-x-3">
                                    <FaUserAlt className="text-green-500 text-2xl" />
                                    <span>
                                        <span className="font-semibold">Nombre Completo:</span> {limpiarCaracteresEspeciales(historial.nombre_completo)}
                                    </span>
                                </div>

                                <div className="flex items-center space-x-3">
                                    <FaRulerVertical className="text-purple-500 text-2xl" />
                                    <span>
                                        <span className="font-semibold">Altura:</span> {historial.alturapaciente} cm
                                    </span>
                                </div>

                                <div className="flex items-center space-x-3">
                                    <FaTooth className="text-yellow-500 text-2xl" />
                                    <span>
                                        <span className="font-semibold">Tratamientos:</span> {historial["Tratamiento/s"]}
                                    </span>
                                </div>

                                <div className="flex items-center space-x-3">
                                    <FaNotesMedical className="text-pink-500 text-2xl" />
                                    <span>
                                        <span className="font-semibold">Diagnóstico:</span> {historial.diagnosticohistorialclinico}
                                    </span>
                                </div>

                                <div className="flex items-center space-x-3">
                                    <FaHeartbeat className="text-red-500 text-2xl" />
                                    <span>
                                        <span className="font-semibold">Estado del Tratamiento:</span> {historial.estadotratamiento}
                                    </span>
                                </div>

                                <div className="flex items-center space-x-3 sm:col-span-2">
                                    <FaCalendarAlt className="text-indigo-500 text-2xl" />
                                    <span>
                                        <span className="font-semibold">Fecha de Registro:</span>{" "}
                                        {new Date(historial.fecharegistro).toLocaleDateString()}
                                    </span>
                                </div>
                            </div>
                        </div>
                        <div className="max-w-4xl mx-auto mt-6 flex justify-end">
                            <button
                                onClick={() => navigate('/Homepaciente/historialclinicodiente')}
                                className="bg-blue-600 hover:bg-blue-700 text-white font-semibold py-2 px-4 rounded shadow"
                            >
                                Historial Clínico de los Dientes
                            </button>
                        </div>
                    </>
                )}
            </div>
        </>
    );
}
