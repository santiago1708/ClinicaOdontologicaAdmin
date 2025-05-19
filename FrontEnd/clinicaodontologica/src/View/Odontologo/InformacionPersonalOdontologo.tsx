import { useEffect, useState } from "react";
import axios from "axios";
import { FaIdCard, FaUserAlt, FaPhone, FaEnvelope, FaBriefcase } from "react-icons/fa";
import { useNavigate } from "react-router-dom";
import NavbarOdontologo from "../../components/navbar/NavBarOdontologo";

interface InfoOdontologoData {
    numdocumentoodontolo: number | string;
    nombre_completo: string;
    telefono: string;
    correo: string;
    especialidad: string;
}

export default function InformacionPersonalOdontologo() {
    const [infoOdontologo, setInfoOdontologo] = useState<InfoOdontologoData | null>(null);
    const [imagenOdontologo, setImagenOdontologo] = useState<string | null>(null);
    const [loading, setLoading] = useState(true);
    const [error, setError] = useState("");
    const navigate = useNavigate();

    const numdocumento = localStorage.getItem("numdocumentoodontologo");
    const idusuario = localStorage.getItem("idUsuario");

    useEffect(() => {
        const fetchData = async () => {
            try {
                if (!numdocumento || !idusuario) {
                    setError("Faltan datos de sesión (documento o usuario).");
                    return;
                }

                const response = await axios.get(`http://localhost:3000/api/odontologo/${numdocumento}`);
                setInfoOdontologo(response.data);

                try {
                    const imageResponse = await axios.get(`http://localhost:3000/api/paciente/getimage/${idusuario}`);
                    setImagenOdontologo(imageResponse.data.image);
                } catch (imgErr: any) {
                    console.warn("Imagen no encontrada o error:", imgErr.response?.data?.message || imgErr.message);
                    setImagenOdontologo(null);
                }

            } catch (err) {
                console.error("Error al obtener datos del odontólogo:", err);
                setError("No se pudo obtener la información del odontólogo.");
            } finally {
                setLoading(false);
            }
        };

        fetchData();
    }, [numdocumento, idusuario]);

    const handleEditarClick = () => {
        navigate("/editarinfoodontologo");
    };

    return (
        <>
            <NavbarOdontologo />
            <div className="p-6 bg-gray-50 min-h-screen">
                {loading && (
                    <p className="text-center text-blue-600 mt-20 animate-pulse font-semibold text-lg">
                        Cargando información del odontólogo...
                    </p>
                )}

                {error && (
                    <p className="text-center text-red-500 mt-20 font-semibold text-lg">{error}</p>
                )}

                {!loading && !error && infoOdontologo && (
                    <div className="max-w-4xl mx-auto mt-12 bg-white shadow-xl rounded-xl p-8 space-y-8 border border-gray-200">
                        <h2 className="text-3xl font-extrabold text-gray-900 border-b pb-4 mb-6">
                            Información Personal del Odontólogo
                        </h2>

                        {/* Imagen del odontólogo */}
                        {imagenOdontologo ? (
                            <div className="flex justify-center">
                                <img
                                    src={imagenOdontologo}
                                    alt="Imagen del Odontólogo"
                                    className="w-40 h-40 object-cover rounded-full shadow-md border"
                                />
                            </div>
                        ) : (
                            <div className="flex justify-center">
                                <div className="w-40 h-40 rounded-full bg-gray-200 flex items-center justify-center text-gray-500 shadow-inner text-sm">
                                    Sin imagen
                                </div>
                            </div>
                        )}

                        {/* Información del odontólogo */}
                        <div className="grid grid-cols-1 sm:grid-cols-2 gap-8 text-gray-800 text-lg">
                            <InfoItem icon={<FaIdCard />} label="Documento" value={infoOdontologo.numdocumentoodontolo} />
                            <InfoItem icon={<FaUserAlt />} label="Nombre Completo" value={infoOdontologo.nombre_completo} />
                            <InfoItem icon={<FaPhone />} label="Teléfono" value={infoOdontologo.telefono} />
                            <InfoItem icon={<FaEnvelope />} label="Correo" value={infoOdontologo.correo} />
                            <InfoItem icon={<FaBriefcase />} label="Especialidad" value={infoOdontologo.especialidad} />
                        </div>

                        {/* Botón editar */}
                        <div className="text-center pt-6">
                            <button
                                onClick={handleEditarClick}
                                className="px-6 py-2 bg-blue-600 text-white font-semibold rounded hover:bg-blue-700 transition"
                            >
                                Editar Información
                            </button>
                        </div>
                    </div>
                )}
            </div>
        </>
    );
}

function InfoItem({ icon, label, value }: { icon: JSX.Element, label: string, value: string | number }) {
    return (
        <div className="flex items-center space-x-3">
            <div className="text-2xl text-blue-500">{icon}</div>
            <span><span className="font-semibold">{label}:</span> {value}</span>
        </div>
    );
}
