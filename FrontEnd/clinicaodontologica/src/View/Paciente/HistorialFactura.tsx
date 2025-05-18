import { useEffect, useState } from "react";
import axios from "axios";
import NavbarPaciente from "../../components/navbar/NavBarPaciente";

interface Factura {
    codcita: number;
    motivodescuento: string;
    tratamientos: string;
    montototal: string;
    fechafacturacion: string;
    metodopago: string;
    numdocumentopaciente: number;
    nombre_completo: string;
    estadopago: string;
}

export default function HistorialFactura() {
    const [facturas, setFacturas] = useState<Factura[]>([]);
    const [loading, setLoading] = useState(true);
    const [error, setError] = useState("");

    const numdocumento = localStorage.getItem("numdocumentopaciente");

    useEffect(() => {
        const fetchFacturas = async () => {
            try {
                if (!numdocumento) {
                    setError("Número de documento no encontrado en sesión.");
                    setLoading(false);
                    return;
                }

                const response = await axios.get(`http://localhost:3000/api/facturas/${numdocumento}`);
                setFacturas(response.data);
            } catch (err) {
                console.error("Error al cargar facturas:", err);
                setError("No se pudieron cargar las facturas.");
            } finally {
                setLoading(false);
            }
        };

        fetchFacturas();
    }, [numdocumento]);

    return (
        <>
            <NavbarPaciente />
            <div className="p-6 min-h-screen bg-gray-50">
                <h2 className="text-3xl font-bold text-center mb-6">Historial de Facturación</h2>

                {loading && <p className="text-center text-blue-600 animate-pulse">Cargando facturas...</p>}
                {error && <p className="text-center text-red-600">{error}</p>}

                {!loading && !error && facturas.length > 0 && (
                    <div className="overflow-x-auto">
                        <table className="min-w-full bg-white border rounded-lg shadow">
                            <thead className="bg-blue-600 text-white">
                                <tr>
                                    <th className="py-2 px-4">Fecha</th>
                                    <th className="py-2 px-4">Código de Cita</th>
                                    <th className="py-2 px-4">Tratamientos</th>
                                    <th className="py-2 px-4">Monto Total</th>
                                    <th className="py-2 px-4">Método de Pago</th>
                                    <th className="py-2 px-4">Estado de Pago</th>
                                </tr>
                            </thead>
                            <tbody>
                                {facturas.map((factura) => (
                                    <tr key={factura.codcita} className="border-t text-center">
                                        <td className="py-2 px-4">{new Date(factura.fechafacturacion).toLocaleDateString()}</td>
                                        <td className="py-2 px-4">{factura.codcita}</td>
                                        <td className="py-2 px-4">{factura.tratamientos}</td>
                                        <td className="py-2 px-4">${factura.montototal}</td>
                                        <td className="py-2 px-4">{factura.metodopago}</td>
                                        <td className={`py-2 px-4 font-semibold ${factura.estadopago === 'Pagado' ? 'text-green-600' : 'text-red-500'}`}>
                                            {factura.estadopago}
                                        </td>
                                    </tr>
                                ))}
                            </tbody>
                        </table>
                    </div>
                )}

                {!loading && !error && facturas.length === 0 && (
                    <p className="text-center text-gray-500">No se encontraron facturas para este paciente.</p>
                )}
            </div>
        </>
    );
}
