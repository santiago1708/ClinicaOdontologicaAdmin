import { useState } from "react";
import axios from "axios";
import NavbarOdontologo from "../../components/navbar/NavBarOdontologo";
import { useNavigate } from "react-router-dom";

export default function BuscarHistorialClinico() {
    const [numdocumentopaciente, setNumdocumentopaciente] = useState("");
    const [historiales, setHistoriales] = useState<any[]>([]);
    const [mensaje, setMensaje] = useState("");
    const navigate = useNavigate()

    const buscarHistorial = async () => {
        try {
            const response = await axios.post("http://localhost:3000/api/historialporid", {
                numdocumentopaciente,
            });
            setHistoriales(response.data);
            setMensaje("");
        } catch (error: any) {
            setHistoriales([]);
            setMensaje(error.response?.data?.message || "Error al buscar historial clínico.");
        }
    };

    // Función para abrir en otra pestaña el historial dental
    const abrirHistorialDiente = (numDoc: string | number) => {
        // Abrir nueva pestaña con la url y pasar numdocumentopaciente como parámetro
        navigate(`/historialdientes/${numDoc}`);
    };

    return (
        <>
            <NavbarOdontologo />
            <main className="max-w-4xl mx-auto p-6 bg-white rounded-lg shadow-md mt-8">
                <h2 className="text-3xl font-bold mb-6 text-center text-blue-700">Buscar Historial Clínico</h2>

                <div className="mb-6">
                    <label className="block mb-2 font-semibold text-gray-700">Número de Documento del Paciente:</label>
                    <input
                        type="text"
                        value={numdocumentopaciente}
                        onChange={(e) => setNumdocumentopaciente(e.target.value)}
                        placeholder="Ej. 107"
                        className="w-full px-4 py-2 border border-gray-300 rounded focus:outline-none focus:ring-2 focus:ring-blue-500"
                    />
                    <button
                        onClick={buscarHistorial}
                        className="mt-3 w-full bg-blue-600 text-white py-2 rounded hover:bg-blue-700 transition"
                    >
                        Buscar Historial
                    </button>
                </div>

                {mensaje && (
                    <p className="text-center text-red-600 font-semibold mb-6 animate-pulse">{mensaje}</p>
                )}

                {historiales.length > 0 && (
                    <section>
                        <h3 className="text-2xl font-semibold mb-4 text-gray-800">Historial Clínico</h3>
                        <div className="overflow-x-auto border rounded shadow">
                            <table className="min-w-full bg-white">
                                <thead className="bg-blue-600 text-white">
                                    <tr>
                                        <th className="py-3 px-6 text-left">Número Documento</th>
                                        <th className="py-3 px-6 text-left">Paciente</th>
                                        <th className="py-3 px-6 text-left">Altura</th>
                                        <th className="py-3 px-6 text-left">Tratamiento</th>
                                        <th className="py-3 px-6 text-left">Diagnóstico</th>
                                        <th className="py-3 px-6 text-left">Estado Tratamiento</th>
                                        <th className="py-3 px-6 text-left">Fecha Registro</th>
                                        <th className="py-3 px-6 text-center">Detalle Dientes</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    {historiales.map((item, index) => (
                                        <tr key={index} className={index % 2 === 0 ? "bg-gray-50" : "bg-white"}>
                                            <td className="py-3 px-6 whitespace-nowrap">{item.numdocumentopaciente}</td>
                                            <td className="py-3 px-6 whitespace-nowrap">{item.nombre_completo}</td>
                                            <td className="py-3 px-6 whitespace-nowrap">{item.alturapaciente}</td>
                                            <td className="py-3 px-6 whitespace-nowrap">{item.tratamientorealizado}</td>
                                            <td className="py-3 px-6 whitespace-nowrap">{item.diagnostico}</td>
                                            <td className="py-3 px-6 whitespace-nowrap">{item.estadotratamiento}</td>
                                            <td className="py-3 px-6 whitespace-nowrap">
                                                {new Date(item.fecharegistro).toLocaleDateString()}
                                            </td>
                                            <td className="py-3 px-6 text-center">
                                                <button
                                                    onClick={() => abrirHistorialDiente(item.numdocumentopaciente)}
                                                    className="bg-green-600 text-white px-3 py-1 rounded hover:bg-green-700 transition"
                                                >
                                                    Ver Detalle Dientes
                                                </button>
                                            </td>
                                        </tr>
                                    ))}
                                </tbody>
                            </table>
                        </div>
                    </section>
                )}
            </main>
        </>
    );
}
