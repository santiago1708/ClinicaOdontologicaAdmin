import NavbarPaciente from "../../components/navbar/NavBarPaciente";
import { useEffect, useState } from "react";
import axios from "axios";
import { useNavigate } from "react-router-dom";
import {
    FaIdCard, FaUserAlt, FaRulerVertical, FaPhone, FaWeight,
    FaBirthdayCake, FaFileMedical, FaPercent
} from "react-icons/fa";

interface InfoPacienteData {
    numdocumentopaciente: number | string;
    nombre_completo: string;
    altura_del_paciente: string;
    numero_telefonico_del_paciente: string;
    peso_del_paciente: number | string;
    fecha_nacimiento_del_paciente: string;
    afiliacion_del_paciente: string;
    porcentaje_cobertura: string;
}

export default function InformacionPersonalPa() {
    const [infoPaciente, setInfoPaciente] = useState<InfoPacienteData | null>(null);
    const [imagenPaciente, setImagenPaciente] = useState<string | null>(null);
    const [loading, setLoading] = useState(true);
    const [error, setError] = useState("");
    const navigate = useNavigate();

    const numdocumento = localStorage.getItem("numdocumentopaciente");
    const idusuario = localStorage.getItem("idusuario");

    useEffect(() => {
        const fetchData = async () => {
            try {
                if (!numdocumento || !idusuario) {
                    setError("Faltan datos de sesión (documento o usuario).");
                    return;
                }

                console.log("Documento:", numdocumento);
                console.log("ID Usuario:", idusuario);

                // Traer datos personales
                const response = await axios.get(`http://localhost:3000/api/paciente/${numdocumento}`);
                setInfoPaciente(response.data);

                // Traer imagen (manejar si no existe)
                try {
                    const imageResponse = await axios.get(`http://localhost:3000/api/paciente/getimage/${idusuario}`);
                    setImagenPaciente(imageResponse.data.image);
                } catch (imgErr) {
                    console.warn("Imagen no encontrada o error:", imgErr.response?.data?.message || imgErr.message);
                    setImagenPaciente(null);
                }

            } catch (err) {
                console.error("Error general:", err);
                setError("No se pudo obtener la información del paciente.");
            } finally {
                setLoading(false);
            }
        };

        fetchData();
    }, [numdocumento, idusuario]);

    const handleEditarClick = () => {
        navigate("/paciente/editarinformacion");
    };

    return (
        <>
            <NavbarPaciente />
            <div className="p-6 bg-gray-50 min-h-screen">
                {loading && (
                    <p className="text-center text-blue-600 mt-20 animate-pulse font-semibold text-lg">
                        Cargando información del paciente...
                    </p>
                )}

                {error && (
                    <p className="text-center text-red-500 mt-20 font-semibold text-lg">{error}</p>
                )}

                {!loading && !error && infoPaciente && (
                    <div className="max-w-4xl mx-auto mt-12 bg-white shadow-xl rounded-xl p-8 space-y-8 border border-gray-200">
                        <h2 className="text-3xl font-extrabold text-gray-900 border-b pb-4 mb-6">
                            Información Personal del Paciente
                        </h2>

                        {/* Imagen del paciente */}
                        {imagenPaciente ? (
                            <div className="flex justify-center">
                                <img
                                    src={imagenPaciente}
                                    alt="Imagen del Paciente"
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

                        {/* Información del paciente */}
                        <div className="grid grid-cols-1 sm:grid-cols-2 gap-8 text-gray-800 text-lg">
                            <InfoItem icon={<FaIdCard />} label="Documento" value={infoPaciente.numdocumentopaciente} />
                            <InfoItem icon={<FaUserAlt />} label="Nombre Completo" value={infoPaciente.nombre_completo} />
                            <InfoItem icon={<FaRulerVertical />} label="Altura" value={`${infoPaciente.altura_del_paciente} m`} />
                            <InfoItem icon={<FaPhone />} label="Teléfono" value={infoPaciente.numero_telefonico_del_paciente} />
                            <InfoItem icon={<FaWeight />} label="Peso" value={`${infoPaciente.peso_del_paciente} kg`} />
                            <InfoItem icon={<FaBirthdayCake />} label="Nacimiento" value={new Date(infoPaciente.fecha_nacimiento_del_paciente).toLocaleDateString()} />
                            <InfoItem icon={<FaFileMedical />} label="Afiliación" value={infoPaciente.afiliacion_del_paciente} />
                            <InfoItem icon={<FaPercent />} label="Cobertura" value={infoPaciente.porcentaje_cobertura} />
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
