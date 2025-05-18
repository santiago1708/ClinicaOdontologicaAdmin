import NavbarPaciente from "../../components/navbar/NavBarPaciente";
import { useEffect, useState } from "react";
import axios from "axios";

interface DienteData {
    numdocumentopaciente: string;
    nombre_completo: string;
    "NumeroDiente/s": string;  // adaptamos el nombre a una clave válida
    tipodiente: string;
    "EstadoDiente/s": string;
    fecharegistro: string;
}

export default function HistorialClinicoDiente() {
    const [dientes, setDientes] = useState<DienteData[]>([]);
    const [loading, setLoading] = useState(true);
    const [error, setError] = useState("");

    const numdocumento = localStorage.getItem("numdocumentopaciente");

    useEffect(() => {
        const fetchDientes = async () => {
            if (!numdocumento) {
                setError("No se encontró el número de documento del paciente.");
                setLoading(false);
                return;
            }
            try {
                const response = await axios.get(
                    `http://localhost:3000/api/historialclinicodiente/${numdocumento}`
                );
                console.log("Datos recibidos:", response.data);
                setDientes(response.data);

            } catch (err) {
                console.error("Error al obtener el historial de dientes:", err);
                setError("No se pudo obtener el historial clínico de dientes.");
            } finally {
                setLoading(false);
            }
        };

        fetchDientes();
    }, [numdocumento]);

    return (
        <>
            <NavbarPaciente />
            <div className="p-6 bg-gray-50 min-h-screen">
                {loading && (
                    <p className="text-center text-blue-600 mt-20 animate-pulse font-semibold text-lg">
                        Cargando historial clínico de dientes...
                    </p>
                )}
                {error && (
                    <p className="text-center text-red-500 mt-20 font-semibold text-lg">{error}</p>
                )}

                {!loading && !error && dientes.length > 0 && (
                    <div className="max-w-4xl mx-auto mt-12 bg-white shadow-xl rounded-xl p-8 border border-gray-200">
                        <h2 className="text-3xl font-extrabold text-gray-900 border-b pb-4 mb-6">
                            Historial Clínico de los Dientes
                        </h2>

                        <table className="w-full table-auto border-collapse border border-gray-300">
                            <thead>
                                <tr className="bg-gray-100">
                                    <th className="border border-gray-300 px-4 py-2">Número Diente</th>
                                    <th className="border border-gray-300 px-4 py-2">Tipo de Diente</th>
                                    <th className="border border-gray-300 px-4 py-2">Estado</th>
                                    <th className="border border-gray-300 px-4 py-2">Fecha de Registro</th>
                                </tr>
                            </thead>
                            <tbody>
                                {dientes.map((diente, idx) => (
                                    <tr key={idx} className="even:bg-gray-50">
                                        <td className="border border-gray-300 px-4 py-2">{diente["NumeroDiente/s"] || diente["NumeroDiente/s"]}</td>
                                        <td className="border border-gray-300 px-4 py-2">{diente.tipodiente}</td>
                                        <td className="border border-gray-300 px-4 py-2">{diente["EstadoDiente/s"] }</td>
                                        <td className="border border-gray-300 px-4 py-2">{new Date(diente.fecharegistro).toLocaleDateString()}</td>
                                    </tr>
                                ))}
                            </tbody>
                        </table>
                    </div>
                )}

                {!loading && !error && dientes.length === 0 && (
                    <p className="text-center text-gray-700 mt-20 font-semibold text-lg">
                        No hay historial clínico de dientes para mostrar.
                    </p>
                )}
            </div>
        </>
    );
}
