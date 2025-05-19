import { useState } from "react";
import NavBarAdministrador from "../../components/navbar/NavBarAdministrador";

export default function DiasLaborales() {
    const [formData, setFormData] = useState({
        fechainicio: "",
        fechafin: "",
        horahorario: "",
        numcododontolog: "",
    });

    const [mensaje, setMensaje] = useState("");
    const [error, setError] = useState("");

    const handleChange = (
        e: React.ChangeEvent<HTMLInputElement>
    ) => {
        const { name, value } = e.target;
        setFormData((prev) => ({ ...prev, [name]: value }));
    };

    const handleSubmit = async (e: React.FormEvent) => {
        e.preventDefault();
        setMensaje("");
        setError("");

        // Validación básica
        if (
            !formData.fechainicio ||
            !formData.fechafin ||
            !formData.horahorario ||
            !formData.numcododontolog
        ) {
            setError("Por favor completa todos los campos.");
            return;
        }

        try {
            const res = await fetch(
                "http://localhost:3000/api/administrador/generarhorariolaborales",
                {
                    method: "POST",
                    headers: {
                        "Content-Type": "application/json",
                    },
                    body: JSON.stringify({
                        fechainicio: formData.fechainicio,
                        fechafin: formData.fechafin,
                        horahorario: formData.horahorario,
                        numcododontolog: Number(formData.numcododontolog),
                    }),
                }
            );

            if (res.ok) {
                const data = await res.json();
                setMensaje(data.message || "Días laborales generados exitosamente");
                setFormData({
                    fechainicio: "",
                    fechafin: "",
                    horahorario: "",
                    numcododontolog: "",
                });
            } else {
                const err = await res.json();
                setError(err.error || "Error al generar días laborales");
            }
        } catch (err) {
            setError("Error de conexión al backend");
        }
    };

    return (
        <>
            <NavBarAdministrador />
            <main className="max-w-3xl mx-auto p-6 bg-white rounded-lg shadow-md mt-6">
                <h1 className="text-3xl font-semibold mb-6 text-center text-blue-700">
                    Generar Días Laborales
                </h1>

                {mensaje && (
                    <div className="mb-4 p-3 bg-green-100 text-green-700 rounded border border-green-300">
                        {mensaje}
                    </div>
                )}
                {error && (
                    <div className="mb-4 p-3 bg-red-100 text-red-700 rounded border border-red-300">
                        {error}
                    </div>
                )}

                <form onSubmit={handleSubmit} className="space-y-6">
                    <div className="flex flex-col">
                        <label
                            htmlFor="fechainicio"
                            className="mb-1 font-medium text-gray-700"
                        >
                            Fecha Inicio *
                        </label>
                        <input
                            type="date"
                            id="fechainicio"
                            name="fechainicio"
                            value={formData.fechainicio}
                            onChange={handleChange}
                            required
                            className="border border-gray-300 rounded px-3 py-2 focus:outline-none focus:ring-2 focus:ring-blue-500"
                        />
                    </div>

                    <div className="flex flex-col">
                        <label
                            htmlFor="fechafin"
                            className="mb-1 font-medium text-gray-700"
                        >
                            Fecha Fin *
                        </label>
                        <input
                            type="date"
                            id="fechafin"
                            name="fechafin"
                            value={formData.fechafin}
                            onChange={handleChange}
                            required
                            className="border border-gray-300 rounded px-3 py-2 focus:outline-none focus:ring-2 focus:ring-blue-500"
                        />
                    </div>

                    <div className="flex flex-col">
                        <label
                            htmlFor="horahorario"
                            className="mb-1 font-medium text-gray-700"
                        >
                            Hora Horario *
                        </label>
                        <input
                            type="time"
                            id="horahorario"
                            name="horahorario"
                            value={formData.horahorario}
                            onChange={handleChange}
                            required
                            className="border border-gray-300 rounded px-3 py-2 focus:outline-none focus:ring-2 focus:ring-blue-500"
                        />
                    </div>

                    <div className="flex flex-col">
                        <label
                            htmlFor="numcododontolog"
                            className="mb-1 font-medium text-gray-700"
                        >
                            Código Odontólogo *
                        </label>
                        <input
                            type="number"
                            id="numcododontolog"
                            name="numcododontolog"
                            min="1"
                            placeholder="Ej. 2"
                            value={formData.numcododontolog}
                            onChange={handleChange}
                            required
                            className="border border-gray-300 rounded px-3 py-2 focus:outline-none focus:ring-2 focus:ring-blue-500"
                        />
                    </div>

                    <div className="flex justify-center">
                        <button
                            type="submit"
                            className="bg-blue-600 text-white px-8 py-3 rounded hover:bg-blue-700 transition"
                        >
                            Generar Horarios
                        </button>
                    </div>
                </form>
            </main>
        </>
    );
}
