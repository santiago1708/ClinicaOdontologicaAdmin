import React, { useEffect, useState } from 'react';
import { useNavigate } from 'react-router-dom';
import axios from 'axios';
import NavbarOdontologo from '../../components/navbar/NavBarOdontologo';

interface Cita {
    codcita: number;
    fechahorario: string;
    horahorario: string;
    estadocita: string;
    observaciones: string;
    numeroidentificadorpaciente: number;
}

export default function HomeOdontologo() {
    const [citas, setCitas] = useState<Cita[]>([]);
    const navigate = useNavigate();

    const idodontologo = localStorage.getItem("cododontologo");

    useEffect(() => {
        const fetchCitas = async () => {
            try {
                const response = await axios.get(`http://localhost:3000/api/citasasignadas/${idodontologo}`);
                // Ordenamos por fecha descendente (más reciente primero)
                const sortedCitas = response.data.sort((a: Cita, b: Cita) =>
                    new Date(b.fechahorario).getTime() - new Date(a.fechahorario).getTime()
                );
                setCitas(sortedCitas);
            } catch (error) {
                console.error('Error al obtener las citas:', error);
            }
        };

        fetchCitas();
    }, [idodontologo]);

    return (
        <>
            <NavbarOdontologo />
            <div className="p-6">
                <h1 className="text-2xl font-bold mb-6">Citas Asignadas</h1>
                {citas.length === 0 ? (
                    <p>No hay citas asignadas.</p>
                ) : (
                    <div className="grid gap-4 md:grid-cols-2">
                        {citas.map((cita) => (
                            <div key={cita.codcita} className="border rounded-xl shadow-md p-4 bg-white">
                                <p><strong>Código Cita:</strong> {cita.codcita}</p>
                                <p><strong>ID Paciente:</strong> {cita.numeroidentificadorpaciente}</p>
                                <p><strong>Fecha:</strong> {new Date(cita.fechahorario).toLocaleDateString()}</p>
                                <p><strong>Hora:</strong> {cita.horahorario.slice(0, 5)}</p>
                                <p><strong>Estado:</strong> {cita.estadocita}</p>
                                <p><strong>Observaciones:</strong> {cita.observaciones}</p>

                                <div className="mt-4 flex gap-3">
                                    <button
                                        onClick={() => navigate(`/odontologo/factura/${cita.codcita}`)}
                                        className="bg-green-600 text-white px-4 py-2 rounded hover:bg-green-700 transition"
                                    >
                                        Agregar Factura
                                    </button>
                                    <button
                                        onClick={() => navigate(`/odontologo/historial/${cita.codcita}`)}
                                        className="bg-blue-600 text-white px-4 py-2 rounded hover:bg-blue-700 transition"
                                    >
                                        Actualizar Historial
                                    </button>
                                </div>
                            </div>
                        ))}
                    </div>
                )}
            </div>
        </>
    );
}
