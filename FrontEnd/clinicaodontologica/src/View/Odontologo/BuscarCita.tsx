import { useState } from "react";
import axios from "axios";
import NavbarOdontologo from "../../components/navbar/NavBarOdontologo";

export default function BuscarCita() {
    const [numdocumentopaciente, setNumdocumentopaciente] = useState("");
    const [citas, setCitas] = useState<any[]>([]);
    const [mensaje, setMensaje] = useState("");

    const buscarPorPaciente = async () => {
        try {
            const response = await axios.post("http://localhost:3000/api/citaporidpaciente", {
                numdocumentopaciente,
            });
            setCitas(response.data);
            setMensaje("");
        } catch (error: any) {
            setCitas([]);
            setMensaje(error.response?.data?.message || "Error al buscar citas por paciente.");
        }
    };

    return (
        <>
            <NavbarOdontologo />
            <main className="max-w-4xl mx-auto p-6 bg-white rounded-lg shadow-md mt-8">
                <h2 className="text-3xl font-bold mb-6 text-center text-blue-700">Buscar Cita por Paciente</h2>

                <section className="mb-8 max-w-md mx-auto">
                    <label className="block mb-2 font-semibold text-gray-700">
                        Número de Documento del Paciente:
                    </label>
                    <input
                        type="text"
                        value={numdocumentopaciente}
                        onChange={(e) => setNumdocumentopaciente(e.target.value)}
                        className="w-full px-4 py-2 border border-gray-300 rounded focus:outline-none focus:ring-2 focus:ring-blue-500"
                        placeholder="Ej. 12345678"
                    />
                    <button
                        onClick={buscarPorPaciente}
                        className="mt-3 w-full bg-blue-600 text-white py-2 rounded hover:bg-blue-700 transition"
                    >
                        Buscar Citas
                    </button>
                </section>

                {mensaje && (
                    <p className="text-center text-red-600 font-semibold mb-6 animate-pulse">{mensaje}</p>
                )}

                {citas.length > 0 && (
                    <section>
                        <h3 className="text-2xl font-semibold mb-4 text-gray-800">Citas encontradas</h3>
                        <div className="overflow-x-auto border rounded shadow">
                            <table className="min-w-full bg-white">
                                <thead className="bg-blue-600 text-white">
                                    <tr>
                                        <th className="py-3 px-6 text-left">ID Cita</th>
                                        <th className="py-3 px-6 text-left">Paciente</th>
                                        <th className="py-3 px-6 text-left">Fecha</th>
                                        <th className="py-3 px-6 text-left">Hora</th>
                                        <th className="py-3 px-6 text-left">Observaciones</th>
                                        <th className="py-3 px-6 text-left">Estado</th>
                                        <th className="py-3 px-6 text-left">Duración</th>
                                        <th className="py-3 px-6 text-left">Tratamientos</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    {citas.map((cita, index) => (
                                        <tr key={index} className={index % 2 === 0 ? "bg-gray-50" : "bg-white"}>
                                            <td className="py-3 px-6 whitespace-nowrap">{cita.p_codcita}</td>
                                            <td className="py-3 px-6 whitespace-nowrap">{cita.p_nombrecompleto}</td>
                                            <td className="py-3 px-6 whitespace-nowrap">
                                                {cita.p_fechahorario ? new Date(cita.p_fechahorario).toLocaleDateString() : "N/A"}
                                            </td>
                                            <td className="py-3 px-6 whitespace-nowrap">{cita.p_horahorario}</td>
                                            <td className="py-3 px-6 whitespace-nowrap">{cita.p_observaciones}</td>
                                            <td className="py-3 px-6 whitespace-nowrap">{cita.p_estadocita}</td>
                                            <td className="py-3 px-6 whitespace-nowrap">{cita.p_duracion}</td>
                                            <td className="py-3 px-6 whitespace-nowrap">{cita.p_nombretratamiento}</td>
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
