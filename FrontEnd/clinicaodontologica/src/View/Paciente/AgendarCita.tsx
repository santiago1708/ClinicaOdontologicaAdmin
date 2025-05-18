import axios from "axios";
import { useState } from "react";

interface AgendarCitaFormProps {
    onClose: () => void;
    numdocumento: string;
    onSuccess: () => void;
}

export function AgendarCitaForm({ onClose, numdocumento, onSuccess }: AgendarCitaFormProps) {
    const [fecha, setFecha] = useState("");
    const [hora, setHora] = useState("");
    const [observacion, setObservacion] = useState("");
    const [duracion, setDuracion] = useState("");
    const [loading, setLoading] = useState(false);
    const [error, setError] = useState("");

    const handleSubmit = async (e: React.FormEvent) => {
        e.preventDefault();
        setError("");
        if (!fecha || !hora || !duracion) {
            setError("Por favor llena todos los campos requeridos.");
            return;
        }
        setLoading(true);
        try {
            await axios.post("http://localhost:3000/api/agendarcita", {
                fecha,
                hora,
                observacion,
                duracion,
                numdocumento,
            });
            onSuccess();
            onClose();
        } catch (err: any) {
            setError("Error al agendar la cita.");
        } finally {
            setLoading(false);
        }
    };

    return (
        <div className="fixed inset-0 bg-black bg-opacity-40 flex items-center justify-center z-50">
            <div className="bg-white rounded-lg p-6 w-full max-w-md shadow-lg">
                <h3 className="text-2xl mb-4 font-semibold">Agendar Nueva Cita</h3>

                {error && <p className="text-red-600 mb-3">{error}</p>}

                <form onSubmit={handleSubmit} className="space-y-4">
                    <div>
                        <label className="block mb-1 font-medium" htmlFor="fecha">Fecha</label>
                        <input
                            type="date"
                            id="fecha"
                            value={fecha}
                            onChange={(e) => setFecha(e.target.value)}
                            className="w-full border px-3 py-2 rounded"
                            required
                        />
                    </div>

                    <div>
                        <label className="block mb-1 font-medium" htmlFor="hora">Hora</label>
                        <input
                            type="time"
                            id="hora"
                            value={hora}
                            onChange={(e) => setHora(e.target.value)}
                            className="w-full border px-3 py-2 rounded"
                            required
                        />
                    </div>

                    <div>
                        <label className="block mb-1 font-medium" htmlFor="observacion">Observación</label>
                        <textarea
                            id="observacion"
                            value={observacion}
                            onChange={(e) => setObservacion(e.target.value)}
                            className="w-full border px-3 py-2 rounded"
                            rows={3}
                            placeholder="Opcional"
                        />
                    </div>

                    <div>
                        <label className="block mb-1 font-medium" htmlFor="duracion">Duración</label>
                        <select
                            id="duracion"
                            value={duracion}
                            onChange={(e) => setDuracion(e.target.value)}
                            className="w-full border px-3 py-2 rounded"
                            required
                        >
                            <option value="">Selecciona duración</option>
                            <option value="30 minutos">30 minutos</option>
                            <option value="1 hora">1 hora</option>
                        </select>
                    </div>

                    <div className="flex justify-end gap-2">
                        <button
                            type="button"
                            onClick={onClose}
                            className="px-4 py-2 bg-gray-300 rounded hover:bg-gray-400"
                            disabled={loading}
                        >
                            Cancelar
                        </button>
                        <button
                            type="submit"
                            className="px-4 py-2 bg-green-600 text-white rounded hover:bg-green-700"
                            disabled={loading}
                        >
                            {loading ? "Agendando..." : "Agendar"}
                        </button>
                    </div>
                </form>
            </div>
        </div>
    );
}