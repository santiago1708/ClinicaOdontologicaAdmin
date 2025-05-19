import { useState } from "react";
import NavBarAdministrador from "../../components/navbar/NavBarAdministrador";

export default function HomeAdministrador() {
    const [formData, setFormData] = useState({
        numdocumentopaciente: "",
        nombreuno: "",
        nombredos: "",
        apellidouno: "",
        apellidodos: "",
        fechanacimiento: "",
        pesopaciente: "",
        alturapaciente: "",
        numerotelefono: "",
        tipoafiliacion: "",
        contraseñausuario: "",
        emailusuario: "",
    });

    const [mensaje, setMensaje] = useState("");
    const [error, setError] = useState("");

    const handleChange = (
        e: React.ChangeEvent<HTMLInputElement | HTMLSelectElement>
    ) => {
        const { name, value } = e.target;
        setFormData((prev) => ({ ...prev, [name]: value }));
    };

    const handleSubmit = async (e: React.FormEvent) => {
        e.preventDefault();
        setMensaje("");
        setError("");

        try {
            const res = await fetch(
                "http://localhost:3000/api/administrador/crearpaciente",
                {
                    method: "POST",
                    headers: {
                        "Content-Type": "application/json",
                    },
                    body: JSON.stringify({
                        numdocumentopaciente: Number(formData.numdocumentopaciente),
                        nombreuno: formData.nombreuno,
                        nombredos: formData.nombredos,
                        apellidouno: formData.apellidouno,
                        apellidodos: formData.apellidodos,
                        fechanacimiento: formData.fechanacimiento,
                        pesopaciente: Number(formData.pesopaciente),
                        alturapaciente: Number(formData.alturapaciente),
                        numerotelefono: Number(formData.numerotelefono),
                        tipoafiliacion: Number(formData.tipoafiliacion),
                        contraseñausuario: formData.contraseñausuario,
                        emailusuario: formData.emailusuario,
                    }),
                }
            );

            if (res.ok) {
                const data = await res.json();
                setMensaje(data.message || "Paciente creado exitosamente");
                setFormData({
                    numdocumentopaciente: "",
                    nombreuno: "",
                    nombredos: "",
                    apellidouno: "",
                    apellidodos: "",
                    fechanacimiento: "",
                    pesopaciente: "",
                    alturapaciente: "",
                    numerotelefono: "",
                    tipoafiliacion: "",
                    contraseñausuario: "",
                    emailusuario: "",
                });
            } else {
                const err = await res.json();
                setError(err.error || "Error desconocido");
            }
        } catch (error) {
            setError("Error de conexión al backend");
        }
    };

    return (
        <>
            <NavBarAdministrador />

            <main className="max-w-4xl mx-auto p-6 bg-white rounded-lg shadow-md mt-6">
                <h1 className="text-3xl font-semibold mb-6 text-center text-blue-700">
                    Crear Paciente
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

                <form onSubmit={handleSubmit} className="grid grid-cols-1 md:grid-cols-2 gap-6">
                    {/* Número Documento Paciente */}
                    <div className="flex flex-col">
                        <label
                            htmlFor="numdocumentopaciente"
                            className="mb-1 font-medium text-gray-700"
                        >
                            Número Documento Paciente *
                        </label>
                        <input
                            id="numdocumentopaciente"
                            name="numdocumentopaciente"
                            type="number"
                            placeholder="Ej. 12345678"
                            value={formData.numdocumentopaciente}
                            onChange={handleChange}
                            required
                            className="border border-gray-300 rounded px-3 py-2 focus:outline-none focus:ring-2 focus:ring-blue-500"
                        />
                    </div>

                    {/* Primer Nombre */}
                    <div className="flex flex-col">
                        <label htmlFor="nombreuno" className="mb-1 font-medium text-gray-700">
                            Primer Nombre *
                        </label>
                        <input
                            id="nombreuno"
                            name="nombreuno"
                            type="text"
                            placeholder="Ej. Juan"
                            value={formData.nombreuno}
                            onChange={handleChange}
                            required
                            className="border border-gray-300 rounded px-3 py-2 focus:outline-none focus:ring-2 focus:ring-blue-500"
                        />
                    </div>

                    {/* Segundo Nombre */}
                    <div className="flex flex-col">
                        <label htmlFor="nombredos" className="mb-1 font-medium text-gray-700">
                            Segundo Nombre
                        </label>
                        <input
                            id="nombredos"
                            name="nombredos"
                            type="text"
                            placeholder="Ej. Carlos"
                            value={formData.nombredos}
                            onChange={handleChange}
                            className="border border-gray-300 rounded px-3 py-2 focus:outline-none focus:ring-2 focus:ring-blue-500"
                        />
                    </div>

                    {/* Primer Apellido */}
                    <div className="flex flex-col">
                        <label
                            htmlFor="apellidouno"
                            className="mb-1 font-medium text-gray-700"
                        >
                            Primer Apellido *
                        </label>
                        <input
                            id="apellidouno"
                            name="apellidouno"
                            type="text"
                            placeholder="Ej. Pérez"
                            value={formData.apellidouno}
                            onChange={handleChange}
                            required
                            className="border border-gray-300 rounded px-3 py-2 focus:outline-none focus:ring-2 focus:ring-blue-500"
                        />
                    </div>

                    {/* Segundo Apellido */}
                    <div className="flex flex-col">
                        <label
                            htmlFor="apellidodos"
                            className="mb-1 font-medium text-gray-700"
                        >
                            Segundo Apellido
                        </label>
                        <input
                            id="apellidodos"
                            name="apellidodos"
                            type="text"
                            placeholder="Ej. Gómez"
                            value={formData.apellidodos}
                            onChange={handleChange}
                            className="border border-gray-300 rounded px-3 py-2 focus:outline-none focus:ring-2 focus:ring-blue-500"
                        />
                    </div>

                    {/* Fecha Nacimiento */}
                    <div className="flex flex-col">
                        <label
                            htmlFor="fechanacimiento"
                            className="mb-1 font-medium text-gray-700"
                        >
                            Fecha de Nacimiento *
                        </label>
                        <input
                            id="fechanacimiento"
                            name="fechanacimiento"
                            type="date"
                            value={formData.fechanacimiento}
                            onChange={handleChange}
                            required
                            className="border border-gray-300 rounded px-3 py-2 focus:outline-none focus:ring-2 focus:ring-blue-500"
                        />
                    </div>

                    {/* Peso (kg) */}
                    <div className="flex flex-col">
                        <label htmlFor="pesopaciente" className="mb-1 font-medium text-gray-700">
                            Peso (kg) *
                        </label>
                        <input
                            id="pesopaciente"
                            name="pesopaciente"
                            type="number"
                            min="0"
                            placeholder="Ej. 75"
                            value={formData.pesopaciente}
                            onChange={handleChange}
                            required
                            className="border border-gray-300 rounded px-3 py-2 focus:outline-none focus:ring-2 focus:ring-blue-500"
                        />
                    </div>

                    {/* Altura (m) */}
                    <div className="flex flex-col">
                        <label htmlFor="alturapaciente" className="mb-1 font-medium text-gray-700">
                            Altura (m) *
                        </label>
                        <input
                            id="alturapaciente"
                            name="alturapaciente"
                            type="number"
                            step="0.01"
                            min="0"
                            placeholder="Ej. 1.75"
                            value={formData.alturapaciente}
                            onChange={handleChange}
                            required
                            className="border border-gray-300 rounded px-3 py-2 focus:outline-none focus:ring-2 focus:ring-blue-500"
                        />
                    </div>

                    {/* Número Teléfono */}
                    <div className="flex flex-col">
                        <label htmlFor="numerotelefono" className="mb-1 font-medium text-gray-700">
                            Número de Teléfono *
                        </label>
                        <input
                            id="numerotelefono"
                            name="numerotelefono"
                            type="number"
                            placeholder="Ej. 3001234567"
                            value={formData.numerotelefono}
                            onChange={handleChange}
                            required
                            className="border border-gray-300 rounded px-3 py-2 focus:outline-none focus:ring-2 focus:ring-blue-500"
                        />
                    </div>

                    {/* Tipo Afiliación */}
                    <div className="flex flex-col">
                        <label htmlFor="tipoafiliacion" className="mb-1 font-medium text-gray-700">
                            Tipo de Afiliación *
                        </label>
                        <select
                            id="tipoafiliacion"
                            name="tipoafiliacion"
                            value={formData.tipoafiliacion}
                            onChange={handleChange}
                            required
                            className="border border-gray-300 rounded px-3 py-2 bg-white focus:outline-none focus:ring-2 focus:ring-blue-500"
                        >
                            <option value="">Seleccione una opción</option>
                            <option value="1">Contributivo</option>
                            <option value="2">Subsidiado</option>
                            <option value="3">Particular</option>
                        </select>
                    </div>

                    {/* Contraseña */}
                    <div className="flex flex-col">
                        <label
                            htmlFor="contraseñausuario"
                            className="mb-1 font-medium text-gray-700"
                        >
                            Contraseña *
                        </label>
                        <input
                            id="contraseñausuario"
                            name="contraseñausuario"
                            type="password"
                            placeholder="********"
                            value={formData.contraseñausuario}
                            onChange={handleChange}
                            required
                            className="border border-gray-300 rounded px-3 py-2 focus:outline-none focus:ring-2 focus:ring-blue-500"
                        />
                    </div>

                    {/* Email */}
                    <div className="flex flex-col">
                        <label htmlFor="emailusuario" className="mb-1 font-medium text-gray-700">
                            Email *
                        </label>
                        <input
                            id="emailusuario"
                            name="emailusuario"
                            type="email"
                            placeholder="correo@ejemplo.com"
                            value={formData.emailusuario}
                            onChange={handleChange}
                            required
                            className="border border-gray-300 rounded px-3 py-2 focus:outline-none focus:ring-2 focus:ring-blue-500"
                        />
                    </div>

                    {/* Submit Button */}
                    <div className="md:col-span-2 flex justify-center">
                        <button
                            type="submit"
                            className="bg-blue-600 text-white px-8 py-3 rounded hover:bg-blue-700 transition"
                        >
                            Crear Paciente
                        </button>
                    </div>
                </form>
            </main>
        </>
    )
};