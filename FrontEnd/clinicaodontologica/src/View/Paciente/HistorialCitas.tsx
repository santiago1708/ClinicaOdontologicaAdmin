import { useEffect, useState } from "react";
import axios from "axios";
import { useNavigate } from "react-router-dom";
import { AgendarCitaForm } from "./AgendarCita";
import NavbarPaciente from "../../components/navbar/NavBarPaciente";

interface Cita {
    numdocumentopaciente: number;
    nombre_completo: string;
    fechahorario: string;
    horahorario: string;
    codcita: number;
    observaciones: string;
    estadocita: string;
    duracion: string;
    "Tratamiento/s": string;
}

export default function HistorialCitas() {
    const [citas, setCitas] = useState<Cita[]>([]);
    const [loading, setLoading] = useState(true);
    const [error, setError] = useState("");
    const [showForm, setShowForm] = useState(false);

    const numdocumento = localStorage.getItem("numdocumentopaciente");
    const navigate = useNavigate();

    const fetchCitas = async () => {
        try {
            if (!numdocumento) {
                setError("Número de documento no encontrado.");
                setLoading(false);
                return;
            }

            const response = await axios.get(`http://localhost:3000/api/historialcitas/${numdocumento}`);
            setCitas(response.data);
        } catch (err) {
            setError("Error al cargar historial de citas.");
        } finally {
            setLoading(false);
        }
    };

    useEffect(() => {
        fetchCitas();
    }, [numdocumento]);


    const actualizarEstado = async (codcita: number, nuevoEstado: string) => {
        try {
            await axios.put("http://localhost:3000/api/actualizarestadocita", {
                codcita,
                estadocita: nuevoEstado,
            });
            // Recargar historial luego de actualizar estado
            fetchCitas();
        } catch (err) {
            console.error("Error al actualizar el estado:", err);
            alert("Hubo un error al cambiar el estado de la cita.");
        }
    };

    return (
        <>
            <NavbarPaciente />
            <div className="p-6 min-h-screen bg-gray-50">
                <h2 className="text-3xl font-bold text-center mb-6">Historial de Citas</h2>

                <button
                    onClick={() => setShowForm(true)}
                    className="mb-6 px-4 py-2 bg-blue-600 text-white rounded hover:bg-blue-700"
                >
                    Agendar Nueva Cita
                </button>

                {showForm && (
                    <AgendarCitaForm
                        onClose={() => setShowForm(false)}
                        numdocumento={numdocumento!}
                        onSuccess={() => navigate("/historialcitaspaciente")}
                    />
                )}

                {loading && <p className="text-center text-blue-600 animate-pulse">Cargando historial...</p>}
                {error && <p className="text-center text-red-600">{error}</p>}

                {!loading && !error && citas.length > 0 && (
                    <div className="overflow-x-auto">
                        <table className="min-w-full bg-white border rounded-lg shadow">
                            <thead className="bg-green-600 text-white">
                                <tr>
                                    <th className="py-2 px-4">Fecha</th>
                                    <th className="py-2 px-4">Hora</th>
                                    <th className="py-2 px-4">Cita ID</th>
                                    <th className="py-2 px-4">Observaciones</th>
                                    <th className="py-2 px-4">Estado</th>
                                    <th className="py-2 px-4">Duración</th>
                                    <th className="py-2 px-4">Tratamientos</th>
                                    <th className="py-2 px-4">Acciones</th>
                                </tr>
                            </thead>
                            <tbody>
                                {citas.map((cita) => (
                                    <tr key={cita.codcita} className="border-t text-center">
                                        <td className="py-2 px-4">{new Date(cita.fechahorario).toLocaleDateString()}</td>
                                        <td className="py-2 px-4">{cita.horahorario}</td>
                                        <td className="py-2 px-4">{cita.codcita}</td>
                                        <td className="py-2 px-4">{cita.observaciones}</td>
                                        <td
                                            className={`py-2 px-4 font-semibold ${cita.estadocita === 'Pendiente'
                                                    ? 'text-yellow-600'
                                                    : cita.estadocita === 'Confirmada'
                                                        ? 'text-green-600'
                                                        : cita.estadocita === 'Cancelada'
                                                            ? 'text-red-600'
                                                            : 'text-gray-600'
                                                }`}
                                        >
                                            {cita.estadocita}
                                        </td>
                                        <td className="py-2 px-4">{cita.duracion}</td>
                                        <td className="py-2 px-4">{cita["Tratamiento/s"]}</td>
                                        <td className="py-2 px-4 space-x-2">
                                            <button
                                                onClick={() => actualizarEstado(cita.codcita, "Cancelada")}
                                                className="bg-red-500 text-white px-3 py-1 rounded hover:bg-red-600"
                                            >
                                                Cancelar
                                            </button>
                                            <button
                                                onClick={() => actualizarEstado(cita.codcita, "Confirmada")}
                                                className="bg-green-500 text-white px-3 py-1 rounded hover:bg-green-600"
                                            >
                                                Confirmar
                                            </button>
                                        </td>
                                    </tr>
                                ))}
                            </tbody>
                        </table>
                    </div>
                )}

                {!loading && !error && citas.length === 0 && (
                    <p className="text-center text-gray-500">No se encontraron citas para este paciente.</p>
                )}
            </div>
        </>
    );
}
