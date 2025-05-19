import { useEffect, useState } from "react";
import { useParams } from "react-router-dom";
import axios from "axios";
import NavbarOdontologo from "../../components/navbar/NavBarOdontologo";

export default function HistorialDientes() {
    const { numdocumentopaciente } = useParams<{ numdocumentopaciente: string }>();
    const [historialDientes, setHistorialDientes] = useState<any[]>([]);
    const [mensaje, setMensaje] = useState("");

    useEffect(() => {
        const fetchHistorialDientes = async () => {
            try {
                const response = await axios.get(`http://localhost:3000/api/historialdienteporid/${numdocumentopaciente}`);
                setHistorialDientes(response.data);
                setMensaje("");
            } catch (error: any) {
                setHistorialDientes([]);
                setMensaje(error.response?.data?.message || "Error al buscar historial clínico del diente.");
            }
        };

        if (numdocumentopaciente) {
            fetchHistorialDientes();
        }
    }, [numdocumentopaciente]);

    return (
        <>
            <NavbarOdontologo />
            <main className="max-w-3xl mx-auto p-6 bg-white rounded-lg shadow-md mt-8">
                <h2 className="text-3xl font-bold mb-6 text-center text-green-700">Historial Clínico por Diente</h2>

                {mensaje && (
                    <p className="text-center text-red-600 font-semibold mb-6 animate-pulse">{mensaje}</p>
                )}

                {historialDientes.length > 0 ? (
                    <div className="overflow-x-auto border rounded shadow">
                        <table className="min-w-full bg-white">
                            <thead className="bg-green-600 text-white">
                                <tr>
                                    <th className="py-3 px-6 text-left">Número Documento</th>
                                    <th className="py-3 px-6 text-left">Paciente</th>
                                    <th className="py-3 px-6 text-left">Número Diente(s)</th>
                                    <th className="py-3 px-6 text-left">Tipo Diente</th>
                                    <th className="py-3 px-6 text-left">Estado Diente</th>
                                    <th className="py-3 px-6 text-left">Fecha Registro</th>
                                </tr>
                            </thead>
                            <tbody>
                                {historialDientes.map((item, index) => (
                                    <tr key={index} className={index % 2 === 0 ? "bg-gray-50" : "bg-white"}>
                                        <td className="py-3 px-6 whitespace-nowrap">{item.numdocumentopaciente}</td>
                                        <td className="py-3 px-6 whitespace-nowrap">{item.nombre_completo}</td>
                                        <td className="py-3 px-6 whitespace-nowrap">{item["NumeroDiente/s"]}</td>
                                        <td className="py-3 px-6 whitespace-nowrap">{item.tipodiente}</td>
                                        <td className="py-3 px-6 whitespace-nowrap">{item["EstadoDiente/s"]}</td>
                                        <td className="py-3 px-6 whitespace-nowrap">
                                            {new Date(item.fecharegistro).toLocaleDateString()}
                                        </td>
                                    </tr>
                                ))}
                            </tbody>
                        </table>
                    </div>
                ) : (
                    !mensaje && <p className="text-center text-gray-600">No hay historial clínico de dientes para este paciente.</p>
                )}
            </main>
        </>
    );
}
