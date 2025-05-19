import { useState } from "react";
import axios from "axios";
import NavbarOdontologo from "../../components/navbar/NavBarOdontologo";

export default function BuscarFactura() {
    const [numdocumentopaciente, setNumdocumentopaciente] = useState("");
    const [idcita, setIdcita] = useState("");
    const [facturas, setFacturas] = useState<any[]>([]);
    const [mensaje, setMensaje] = useState("");

    const buscarPorPaciente = async () => {
        try {
            const response = await axios.post("http://localhost:3000/api/facturaspacienteid", {
                numdocumentopaciente,
            });
            setFacturas(response.data);
            setMensaje("");
        } catch (error: any) {
            setFacturas([]);
            setMensaje(error.response?.data?.message || "Error al buscar facturas por paciente.");
        }
    };


    const buscarPorCita = async () => {
        try {
            const response = await axios.post("http://localhost:3000/api/facturasidcita", {
                idcita,
            });
            setFacturas(response.data);
            setMensaje("");
        } catch (error: any) {
            setFacturas([]);
            setMensaje(error.response?.data?.message || "Error al buscar facturas por cita.");
        }
    };

    return (
        <>
            <NavbarOdontologo />
            <main className="max-w-4xl mx-auto p-6 bg-white rounded-lg shadow-md mt-8">
                <h2 className="text-3xl font-bold mb-6 text-center text-blue-700">Buscar Factura</h2>

                <section className="grid grid-cols-1 md:grid-cols-2 gap-6 mb-8">
                    <div>
                        <label className="block mb-2 font-semibold text-gray-700">
                            Número de Documento del Paciente:
                        </label>
                        <input
                            type="text"
                            value={numdocumentopaciente}
                            onChange={(e) => setNumdocumentopaciente(e.target.value)}
                            className="w-full px-4 py-2 border border-gray-300 rounded focus:outline-none focus:ring-2 focus:ring-blue-500"
                            placeholder="Ej. 12345678"
                        />
                        <button
                            onClick={buscarPorPaciente}
                            className="mt-3 w-full bg-blue-600 text-white py-2 rounded hover:bg-blue-700 transition"
                        >
                            Buscar por Paciente
                        </button>
                    </div>

                    <div>
                        <label className="block mb-2 font-semibold text-gray-700">ID de Cita:</label>
                        <input
                            type="text"
                            value={idcita}
                            onChange={(e) => setIdcita(e.target.value)}
                            className="w-full px-4 py-2 border border-gray-300 rounded focus:outline-none focus:ring-2 focus:ring-green-500"
                            placeholder="Ej. 98765"
                        />
                        <button
                            onClick={buscarPorCita}
                            className="mt-3 w-full bg-green-600 text-white py-2 rounded hover:bg-green-700 transition"
                        >
                            Buscar por Cita
                        </button>
                    </div>
                </section>

                {mensaje && (
                    <p className="text-center text-red-600 font-semibold mb-6 animate-pulse">{mensaje}</p>
                )}

                {facturas.length > 0 && (
                    <section>
                        <h3 className="text-2xl font-semibold mb-4 text-gray-800">Facturas encontradas</h3>
                        <div className="overflow-x-auto border rounded shadow">
                            <table className="min-w-full bg-white">
                                <thead className="bg-blue-600 text-white">
                                    <tr>
                                        <th className="py-3 px-6 text-left">ID Cita</th>
                                        <th className="py-3 px-6 text-left">Paciente</th>
                                        <th className="py-3 px-6 text-left">Fecha Facturación</th>
                                        <th className="py-3 px-6 text-left">Monto Total</th>
                                        <th className="py-3 px-6 text-left">Método de Pago</th>
                                        <th className="py-3 px-6 text-left">Tratamientos</th>
                                        <th className="py-3 px-6 text-left">Motivo Descuento</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    {facturas.map((factura, index) => (
                                        <tr
                                            key={index}
                                            className={index % 2 === 0 ? "bg-gray-50" : "bg-white"}
                                        >
                                            <td className="py-3 px-6 whitespace-nowrap">{factura.codcita}</td>
                                            <td className="py-3 px-6 whitespace-nowrap">{factura.nombre_completo}</td>
                                            <td className="py-3 px-6 whitespace-nowrap">
                                                {factura.fechafacturacion ? new Date(factura.fechafacturacion).toLocaleDateString() : "N/A"}
                                            </td>
                                            <td className="py-3 px-6 whitespace-nowrap">
                                                ${parseFloat(factura.montototal).toFixed(2)}
                                            </td>
                                            <td className="py-3 px-6 whitespace-nowrap">{factura.metodopago}</td>
                                            <td className="py-3 px-6 whitespace-nowrap">{factura.tratamientos}</td>
                                            <td className="py-3 px-6 whitespace-nowrap">{factura.motivodescuento}</td>
                                        </tr>
                                    ))}
                                </tbody>
                            </table>
                        </div>
                    </section>
                )}

            </main>
        </>
    );
}
