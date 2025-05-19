import axios from "axios";
import { useState } from "react";
import { useNavigate } from "react-router-dom";

export default function LoginClinica() {

    const [formData, setFormData] = useState({
        emailusuario: "",
        contraseñausuario: ""
    });
    const [error, setError] = useState("");
    const [loading, setLoading] = useState(false);

    const navigate = useNavigate();

    const handleChange = (e: React.ChangeEvent<HTMLInputElement>) => {
        const { name, value } = e.target;
        setFormData({ ...formData, [name]: value });
    };

    const handleSubmit = async (e : React.FormEvent<HTMLFormElement>) => {
        e.preventDefault();
        setLoading(true);
        setError("");

        try {
            const response = await axios.post("http://localhost:3000/api/login", formData);
            const data = response.data;

            console.log("Respuesta del servidor:", data);
            console.log(data.data.idusuario)

            localStorage.setItem("idrol", data.data.idrol);
            localStorage.setItem("idUsuario", data.data.idusuario);
            localStorage.setItem("cododontologo", data.data.cododontologo);
            localStorage.setItem("numdocumentopaciente", data.data.numdocumentopaciente);
            localStorage.setItem("numdocumentoodontologo", data.data.numdocumentoodontolo);

            if(data.data.idrol === 1 ) {
                navigate("/Homeadministrador");
            }else if (data.data.idrol === 2 ) {
                navigate('/Homeodontologo')
            }else if (data.data.idrol === 3 ){
                navigate("/Homepaciente");
            }

        } catch (error) {
            console.error("Error en el inicio de sesión:", error);
            setError("Error en el inicio de sesión. Verifica tus credenciales.");
        } finally {
            setLoading(false);
        }
    };


    return (
        <div className="w-screen h-screen flex justify-center items-center bg-gray-100">
            <div className="w-full max-w-md p-8 space-y-6 bg-white rounded-lg shadow-lg">
                <h2 className="text-center text-2xl font-bold text-gray-800">Inicio de Sesión</h2>

                {error && <p className="text-center text-red-500">{error}</p>}

                <form onSubmit={handleSubmit} className="space-y-4">

                    <div>
                        <label className="block text-gray-600 font-medium mb-2" htmlFor="email">
                            Correo Electrónico
                        </label>
                        <input
                            type="email"
                            id="emailusuario"
                            name="emailusuario"
                            value={formData.emailusuario}
                            onChange={handleChange}
                            placeholder="Ingresa tu correo"
                            className="w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"
                        />
                    </div>


                    <div>
                        <label className="block text-gray-600 font-medium mb-2" htmlFor="password">
                            Contraseña
                        </label>
                        <input
                            type="password"
                            id="password"
                            name="contraseñausuario"
                            value={formData.contraseñausuario}
                            onChange={handleChange}
                            placeholder="Ingresa tu contraseña"
                            className="w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"
                        />
                    </div>


                    <button
                        type="submit"
                        className="w-full py-2 px-4 bg-blue-600 text-white font-bold rounded-md hover:bg-blue-700 transition duration-300"
                        disabled={loading}
                    >
                        {loading ? "Cargando..." : "Iniciar Sesión"}
                    </button>
                </form>
            </div>
        </div>
    )
}
