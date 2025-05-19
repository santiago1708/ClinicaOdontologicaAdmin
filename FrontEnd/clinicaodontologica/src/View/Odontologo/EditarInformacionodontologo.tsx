import React, { useEffect, useState } from "react";
import axios from "axios";
import { useNavigate } from "react-router-dom";
import NavbarOdontologo from "../../components/navbar/NavBarOdontologo";

export default function EditarInformacionOdontologo() {
    const [formData, setFormData] = useState({
        nombreuno: "",
        nombredos: "",
        apellidouno: "",
        apellidodos: "",
        anios: "",
        especialidad: "",
        numerotelefono: "",
    });

    const [imagen, setImagen] = useState<File | null>(null);
    const [mensaje, setMensaje] = useState("");
    const navigate = useNavigate();
    const numdocumento = localStorage.getItem("numdocumentoodontologo");
    const idusuario = localStorage.getItem("idUsuario");

    useEffect(() => {
        const fetchData = async () => {
            try {
                if (!numdocumento) return;
                const res = await axios.get(`http://localhost:3000/api/odontologo/${numdocumento}`);
                const [nombreuno, nombredos, apellidouno, apellidodos] = res.data.nombre_completo.split(" ");
                setFormData({
                    nombreuno: nombreuno || "",
                    nombredos: nombredos || "",
                    apellidouno: apellidouno || "",
                    apellidodos: apellidodos || "",
                    anios: res.data.anios_experiencia,
                    especialidad: res.data.especialidad,
                    numerotelefono: res.data.numero_telefonico,
                });
            } catch (error) {
                console.error("Error al cargar datos del odontólogo", error);
            }
        };

        fetchData();
    }, [numdocumento]);

    const handleChange = (e: React.ChangeEvent<HTMLInputElement>) => {
        const { name, value } = e.target;
        setFormData(prev => ({ ...prev, [name]: value }));
    };

    const handleImageChange = (e: React.ChangeEvent<HTMLInputElement>) => {
        if (e.target.files && e.target.files[0]) {
            setImagen(e.target.files[0]);
        }
    };

    const handleSubmit = async (e: React.FormEvent) => {
        e.preventDefault();
        if (!numdocumento) return;

        try {
            // Actualizar información del odontólogo
            await axios.put(`http://localhost:3000/api/updateodontologo/${numdocumento}`, formData);

            // Subir imagen si hay
            if (imagen) {
                const formDataImage = new FormData();
                formDataImage.append("image", imagen);
                await axios.post(`http://localhost:3000/api/paciente/imagenpaciente/${idusuario}`, formDataImage, {
                    headers: { "Content-Type": "multipart/form-data" },
                });
            }

            setMensaje("Información actualizada correctamente.");
            setTimeout(() => navigate("/informacionodontologo"), 2000);
        } catch (error) {
            console.error("Error al actualizar la información", error);
            setMensaje("Ocurrió un error al actualizar los datos.");
        }
    };

    return (
        <>
            <NavbarOdontologo />
            <div className="min-h-screen flex items-center justify-center bg-gray-100 p-4">
                <form
                    onSubmit={handleSubmit}
                    className="bg-white shadow-md rounded-xl p-8 max-w-xl w-full space-y-6"
                >
                    <h2 className="text-2xl font-bold text-gray-800 text-center mb-4">
                        Editar Información Odontólogo
                    </h2>

                    {mensaje && <p className="text-center text-blue-600 font-semibold">{mensaje}</p>}

                    <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
                        <input
                            type="text"
                            name="nombreuno"
                            value={formData.nombreuno}
                            onChange={handleChange}
                            placeholder="Primer Nombre"
                            className="input"
                        />
                        <input
                            type="text"
                            name="nombredos"
                            value={formData.nombredos}
                            onChange={handleChange}
                            placeholder="Segundo Nombre"
                            className="input"
                        />
                        <input
                            type="text"
                            name="apellidouno"
                            value={formData.apellidouno}
                            onChange={handleChange}
                            placeholder="Primer Apellido"
                            className="input"
                        />
                        <input
                            type="text"
                            name="apellidodos"
                            value={formData.apellidodos}
                            onChange={handleChange}
                            placeholder="Segundo Apellido"
                            className="input"
                        />
                        <input
                            type="text"
                            name="anios"
                            value={formData.anios}
                            onChange={handleChange}
                            placeholder="Años de experiencia"
                            className="input"
                        />
                        <input
                            type="text"
                            name="especialidad"
                            value={formData.especialidad}
                            onChange={handleChange}
                            placeholder="Especialidad"
                            className="input"
                        />
                        <input
                            type="text"
                            name="numerotelefono"
                            value={formData.numerotelefono}
                            onChange={handleChange}
                            placeholder="Teléfono"
                            className="input"
                        />
                    </div>

                    <div>
                        <label className="block text-sm font-medium text-gray-700">
                            Imagen del odontólogo (opcional):
                        </label>
                        <input
                            type="file"
                            accept="image/*"
                            onChange={handleImageChange}
                            className="mt-1 block w-full text-sm text-gray-500 file:mr-4 file:py-2 file:px-4
                            file:rounded-full file:border-0 file:text-sm file:font-semibold
                            file:bg-blue-50 file:text-blue-700 hover:file:bg-blue-100"
                        />
                    </div>

                    <button
                        type="submit"
                        className="w-full bg-blue-600 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded transition"
                    >
                        Guardar Cambios
                    </button>
                </form>
            </div>
        </>
    );
}
