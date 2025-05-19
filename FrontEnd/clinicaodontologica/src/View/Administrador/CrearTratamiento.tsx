import { useState } from "react";
import NavBarAdministrador from "../../components/navbar/NavBarAdministrador";

const categorias = [
    { id: 1, nombre: "Ortodoncia" },
    { id: 2, nombre: "Cirugía" },
    { id: 3, nombre: "Endodoncia" },
    { id: 4, nombre: "Implantes" },
    { id: 5, nombre: "Estética dental" },
    { id: 6, nombre: "Restaurativo" },
    { id: 7, nombre: "Preventivo" },
];

export default function CrearTratamiento() {
    const [formData, setFormData] = useState({
        nombretratamiento: "",
        descripciontratamiento: "",
        preciotratamiento: "",
        idcategoriatratamiento: "",
    });

    const [mensaje, setMensaje] = useState("");
    const [error, setError] = useState("");

    const handleChange = (
        e: React.ChangeEvent<
            HTMLInputElement | HTMLTextAreaElement | HTMLSelectElement
        >
    ) => {
        const { name, value } = e.target;
        setFormData((prev) => ({ ...prev, [name]: value }));
    };

    const handleSubmit = async (e: React.FormEvent) => {
        e.preventDefault();
        setMensaje("");
        setError("");

        if (
            !formData.nombretratamiento.trim() ||
            !formData.descripciontratamiento.trim() ||
            !formData.preciotratamiento ||
            !formData.idcategoriatratamiento
        ) {
            setError("Por favor completa todos los campos.");
            return;
        }

        try {
            const res = await fetch(
                "http://localhost:3000/api/administrador/tratamientonuevo",
                {
                    method: "POST",
                    headers: {
                        "Content-Type": "application/json",
                    },
                    body: JSON.stringify({
                        nombretratamiento: formData.nombretratamiento.trim(),
                        descripciontratamiento: formData.descripciontratamiento.trim(),
                        preciotratamiento: Number(formData.preciotratamiento),
                        idcategoriatratamiento: Number(formData.idcategoriatratamiento),
                    }),
                }
            );

            if (res.ok) {
                const data = await res.json();
                setMensaje(data.message || "Tratamiento creado exitosamente");
                setFormData({
                    nombretratamiento: "",
                    descripciontratamiento: "",
                    preciotratamiento: "",
                    idcategoriatratamiento: "",
                });
            } else {
                const err = await res.json();
                setError(err.error || "Error al crear el tratamiento");
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
                    Crear Nuevo Tratamiento
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
                    {/* Nombre Tratamiento */}
                    <div className="flex flex-col">
                        <label
                            htmlFor="nombretratamiento"
                            className="mb-1 font-medium text-gray-700"
                        >
                            Nombre del Tratamiento *
                        </label>
                        <input
                            id="nombretratamiento"
                            name="nombretratamiento"
                            type="text"
                            placeholder="Ej. Endodoncia"
                            value={formData.nombretratamiento}
                            onChange={handleChange}
                            required
                            className="border border-gray-300 rounded px-3 py-2 focus:outline-none focus:ring-2 focus:ring-blue-500"
                        />
                    </div>

                    {/* Descripción Tratamiento */}
                    <div className="flex flex-col">
                        <label
                            htmlFor="descripciontratamiento"
                            className="mb-1 font-medium text-gray-700"
                        >
                            Descripción *
                        </label>
                        <textarea
                            id="descripciontratamiento"
                            name="descripciontratamiento"
                            placeholder="Procedimiento para tratar infecciones dentro del diente..."
                            value={formData.descripciontratamiento}
                            onChange={handleChange}
                            required
                            rows={4}
                            className="border border-gray-300 rounded px-3 py-2 resize-none focus:outline-none focus:ring-2 focus:ring-blue-500"
                        />
                    </div>

                    {/* Precio Tratamiento */}
                    <div className="flex flex-col">
                        <label
                            htmlFor="preciotratamiento"
                            className="mb-1 font-medium text-gray-700"
                        >
                            Precio (COP) *
                        </label>
                        <input
                            id="preciotratamiento"
                            name="preciotratamiento"
                            type="number"
                            min="0"
                            placeholder="Ej. 150000"
                            value={formData.preciotratamiento}
                            onChange={handleChange}
                            required
                            className="border border-gray-300 rounded px-3 py-2 focus:outline-none focus:ring-2 focus:ring-blue-500"
                        />
                    </div>

                    {/* Select Categoría Tratamiento */}
                    <div className="flex flex-col">
                        <label
                            htmlFor="idcategoriatratamiento"
                            className="mb-1 font-medium text-gray-700"
                        >
                            Categoría Tratamiento *
                        </label>
                        <select
                            id="idcategoriatratamiento"
                            name="idcategoriatratamiento"
                            value={formData.idcategoriatratamiento}
                            onChange={handleChange}
                            required
                            className="border border-gray-300 rounded px-3 py-2 focus:outline-none focus:ring-2 focus:ring-blue-500"
                        >
                            <option value="">Selecciona una categoría</option>
                            {categorias.map((cat) => (
                                <option key={cat.id} value={cat.id}>
                                    {cat.nombre}
                                </option>
                            ))}
                        </select>
                    </div>

                    <div className="flex justify-center">
                        <button
                            type="submit"
                            className="bg-blue-600 text-white px-8 py-3 rounded hover:bg-blue-700 transition"
                        >
                            Crear Tratamiento
                        </button>
                    </div>
                </form>
            </main>
        </>
    );
}
