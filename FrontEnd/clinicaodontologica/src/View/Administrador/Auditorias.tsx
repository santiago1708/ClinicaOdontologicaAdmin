import { useEffect, useState } from "react";
import NavBarAdministrador from "../../components/navbar/NavBarAdministrador";

type AuditoriaHistorialClinico = {
    id: number;
    /* agrega aquí las propiedades que tenga tu auditoria.historialclinicoauditoria */
    [key: string]: any;
};
type AuditoriaCitas = {
    id: number;
    /* propiedades de auditoria.citaauditoria */
    [key: string]: any;
};
type AuditoriaFacturacion = {
    id: number;
    /* propiedades de auditoria.facturacionauditoria */
    [key: string]: any;
};

export default function Auditorias() {
    const [historialClinico, setHistorialClinico] = useState<AuditoriaHistorialClinico[]>([]);
    const [citas, setCitas] = useState<AuditoriaCitas[]>([]);
    const [facturacion, setFacturacion] = useState<AuditoriaFacturacion[]>([]);

    const [error, setError] = useState<string>("");

    useEffect(() => {
        async function fetchAuditorias() {
            setError("");

            try {
                const [resHistorial, resCitas, resFacturacion] = await Promise.all([
                    fetch("http://localhost:3000/api/administrador/auditoriahistorialclinico"),
                    fetch("http://localhost:3000/api/administrador/auditoriacitas"),
                    fetch("http://localhost:3000/api/administrador/auditoriafacturacion"),
                ]);

                if (!resHistorial.ok) {
                    const err = await resHistorial.json();
                    throw new Error(err.message || "Error al obtener auditoría historial clínico");
                }
                if (!resCitas.ok) {
                    const err = await resCitas.json();
                    throw new Error(err.message || "Error al obtener auditoría citas");
                }
                if (!resFacturacion.ok) {
                    const err = await resFacturacion.json();
                    throw new Error(err.message || "Error al obtener auditoría facturación");
                }

                const dataHistorial = await resHistorial.json();
                const dataCitas = await resCitas.json();
                const dataFacturacion = await resFacturacion.json();

                setHistorialClinico(dataHistorial);
                setCitas(dataCitas);
                setFacturacion(dataFacturacion);
            } catch (err: any) {
                setError(err.message || "Error al cargar datos de auditoría");
            }
        }

        fetchAuditorias();
    }, []);

    return (
        <>
            <NavBarAdministrador />
            <main className="max-w-7xl mx-auto p-6">
                <h1 className="text-3xl font-semibold mb-6 text-center text-blue-700">
                    Auditorías del Sistema
                </h1>

                {error && (
                    <div className="mb-4 p-3 bg-red-100 text-red-700 rounded border border-red-300">
                        {error}
                    </div>
                )}

                <section className="mb-10">
                    <h2 className="text-2xl font-semibold mb-4">Historial Clínico</h2>
                    {historialClinico.length === 0 ? (
                        <p>No hay registros de auditoría del historial clínico.</p>
                    ) : (
                        <div className="overflow-x-auto">
                            <table className="min-w-full border border-gray-300">
                                <thead className="bg-gray-100">
                                    <tr>
                                        {Object.keys(historialClinico[0]).map((key) => (
                                            <th key={key} className="border px-3 py-1 text-left text-sm font-medium text-gray-700">
                                                {key}
                                            </th>
                                        ))}
                                    </tr>
                                </thead>
                                <tbody>
                                    {historialClinico.map((row, i) => (
                                        <tr key={i} className={i % 2 === 0 ? "bg-white" : "bg-gray-50"}>
                                            {Object.values(row).map((val, j) => (
                                                <td key={j} className="border px-3 py-1 text-sm">
                                                    {String(val)}
                                                </td>
                                            ))}
                                        </tr>
                                    ))}
                                </tbody>
                            </table>
                        </div>
                    )}
                </section>

                <section className="mb-10">
                    <h2 className="text-2xl font-semibold mb-4">Citas</h2>
                    {citas.length === 0 ? (
                        <p>No hay registros de auditoría de citas.</p>
                    ) : (
                        <div className="overflow-x-auto">
                            <table className="min-w-full border border-gray-300">
                                <thead className="bg-gray-100">
                                    <tr>
                                        {Object.keys(citas[0]).map((key) => (
                                            <th key={key} className="border px-3 py-1 text-left text-sm font-medium text-gray-700">
                                                {key}
                                            </th>
                                        ))}
                                    </tr>
                                </thead>
                                <tbody>
                                    {citas.map((row, i) => (
                                        <tr key={i} className={i % 2 === 0 ? "bg-white" : "bg-gray-50"}>
                                            {Object.values(row).map((val, j) => (
                                                <td key={j} className="border px-3 py-1 text-sm">
                                                    {String(val)}
                                                </td>
                                            ))}
                                        </tr>
                                    ))}
                                </tbody>
                            </table>
                        </div>
                    )}
                </section>

                <section className="mb-10">
                    <h2 className="text-2xl font-semibold mb-4">Facturación</h2>
                    {facturacion.length === 0 ? (
                        <p>No hay registros de auditoría de facturación.</p>
                    ) : (
                        <div className="overflow-x-auto">
                            <table className="min-w-full border border-gray-300">
                                <thead className="bg-gray-100">
                                    <tr>
                                        {Object.keys(facturacion[0]).map((key) => (
                                            <th key={key} className="border px-3 py-1 text-left text-sm font-medium text-gray-700">
                                                {key}
                                            </th>
                                        ))}
                                    </tr>
                                </thead>
                                <tbody>
                                    {facturacion.map((row, i) => (
                                        <tr key={i} className={i % 2 === 0 ? "bg-white" : "bg-gray-50"}>
                                            {Object.values(row).map((val, j) => (
                                                <td key={j} className="border px-3 py-1 text-sm">
                                                    {String(val)}
                                                </td>
                                            ))}
                                        </tr>
                                    ))}
                                </tbody>
                            </table>
                        </div>
                    )}
                </section>
            </main>
        </>
    );
}
