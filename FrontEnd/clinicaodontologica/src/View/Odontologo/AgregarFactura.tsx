// AgregarFacturaForm.tsx
import { useForm } from "react-hook-form";
import { useNavigate, useParams } from "react-router-dom";

export default function AgregarFactura() {
    const { register, handleSubmit } = useForm();
    const { codcita } = useParams();
    const Navigation = useNavigate();

    const onSubmit = async (data: any) => {
        try {
            const response = await fetch('http://localhost:3000/api/agregarfactura', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({ ...data, codcita }),
            });
            const result = await response.json();
            alert(result.message || 'Factura creada');
        } catch (error) {
            console.error(error);
            alert("Error al crear factura");
        }
    };

    return (
        <form onSubmit={handleSubmit(onSubmit)} className="bg-white p-6 rounded-lg shadow-md space-y-4 max-w-lg mx-auto">
            <h2 className="text-xl font-semibold text-gray-700">Agregar Factura</h2>

            <div>
                <label className="block mb-1 text-sm font-medium text-gray-700">Método de pago</label>
                <select {...register("codmetodopago")} className="w-full border border-gray-300 rounded-lg p-2 focus:ring focus:ring-blue-200">
                    <option value={1}>Efectivo</option>
                    <option value={2}>Tarjeta de crédito</option>
                    <option value={3}>Transferencia bancaria</option>
                </select>
            </div>

            <div>
                <label className="block mb-1 text-sm font-medium text-gray-700">Número de documento del paciente</label>
                <input
                    {...register("numdocumentopaciente")}
                    className="w-full border border-gray-300 rounded-lg p-2 focus:ring focus:ring-blue-200"
                    required
                />
            </div>

            <button
                type="submit"
                className="w-full bg-blue-600 hover:bg-blue-700 text-white font-semibold py-2 px-4 rounded-lg transition"
                onClick={() => Navigation('/HomeOdontologo')}
            >
                Crear factura
            </button>
        </form>
    );
}
