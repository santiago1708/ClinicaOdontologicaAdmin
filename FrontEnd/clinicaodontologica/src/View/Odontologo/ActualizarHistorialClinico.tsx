import { useForm, useFieldArray } from "react-hook-form";
import { useEffect, useState } from "react";
import { useNavigate, useParams } from "react-router-dom";

type TratamientoForm = {
    idtratamientos: number | undefined;
    cantidadarecursosusados: number | undefined;
    descripcionrecursos: string;
    iddiente: number | undefined;
    idestadoDiente: number | undefined;
    resultadotratamiento: string;
};

type FormData = {
    numdocumentopaciente: number;
    diagnostico: string;
    idestadoTratamiento: number;
    tratamientos: TratamientoForm[];
};

export default function ActualizarHistorialClinicoForm() {
    const Navigate = useNavigate()
    const { codcita } = useParams();
    const codCitaNum = Number(codcita);
    useEffect(() => {
        console.log(codCitaNum)
    }, [codCitaNum])

    const { register, handleSubmit, control } = useForm<FormData>({
        defaultValues: {
            numdocumentopaciente: 0,
            diagnostico: "",
            idestadoTratamiento: 1,
            tratamientos: [
                {
                    idtratamientos: undefined,
                    cantidadarecursosusados: undefined,
                    descripcionrecursos: "",
                    iddiente: undefined,
                    idestadoDiente: undefined,
                    resultadotratamiento: "",
                },
            ],
        },
    });

    const { fields, append, remove } = useFieldArray({
        control,
        name: "tratamientos",
    });

    const [tratamientosList, setTratamientosList] = useState<any[]>([]);
    const [dientesList, setDientesList] = useState<any[]>([]);

    useEffect(() => {
        fetch("http://localhost:3000/api/listatratamientos")
            .then((res) => res.json())
            .then(setTratamientosList)
            .catch(console.error);

        fetch("http://localhost:3000/api/listadiente")
            .then((res) => res.json())
            .then(setDientesList)
            .catch(console.error);
    }, []);

    const onSubmit = async (data: FormData) => {
        const payload = {
            numdocumentopaciente: data.numdocumentopaciente,
            diagnostico: data.diagnostico,
            idestadoTratamiento: data.idestadoTratamiento,
            codcita: codCitaNum,
            idtratamientos: data.tratamientos.map((t) => t.idtratamientos),
            cantidadarecursosusados: data.tratamientos.map((t) => t.cantidadarecursosusados),
            descripcionrecursos: data.tratamientos.map((t) => t.descripcionrecursos),
            iddiente: data.tratamientos.map((t) => t.iddiente),
            idestadoDiente: data.tratamientos.map((t) => t.idestadoDiente),
            resultadotratamiento: data.tratamientos.map((t) => t.resultadotratamiento),
        };
        console.log(payload);

        try {
            const response = await fetch("http://localhost:3000/api/historialclinicopacienteupdate", {
                method: "PUT",
                headers: { "Content-Type": "application/json" },
                body: JSON.stringify(payload),
            });
            const result = await response.json();
            alert(result.message || "Historial actualizado");
        } catch (error) {
            console.error(error);
            alert("Error al actualizar historial clínico");
        }
    };

    return (
        <form onSubmit={handleSubmit(onSubmit)} className="bg-white p-6 rounded-lg shadow space-y-6 max-w-3xl mx-auto">
            <h2 className="text-xl font-bold text-gray-800">Actualizar Historial Clínico</h2>

            <div>
                <label className="block mb-1 font-medium text-gray-700">Número de documento del paciente</label>
                <input
                    type="number"
                    {...register("numdocumentopaciente", { valueAsNumber: true })}
                    className="w-full border rounded p-2"
                    required
                />
            </div>

            <div>
                <label className="block mb-1 font-medium text-gray-700">Diagnóstico</label>
                <textarea {...register("diagnostico")} className="w-full border rounded p-2" required />
            </div>

            <div>
                <label className="block mb-1 font-medium text-gray-700">Estado general del tratamiento</label>
                <select {...register("idestadoTratamiento", { valueAsNumber: true })} className="w-full border rounded p-2" required>
                    <option value={1}>En progreso</option>
                    <option value={2}>Finalizado</option>
                    <option value={3}>Pendiente</option>
                    <option value={4}>Cancelado</option>
                    <option value={5}>En espera</option>
                </select>
            </div>

            <div className="space-y-4">
                <h3 className="text-lg font-semibold text-gray-700">Tratamientos</h3>

                {fields.map((field, index) => (
                    <div key={field.id} className="border rounded p-4 space-y-2 bg-gray-50">
                        <div className="flex justify-between items-center">
                            <span className="font-medium text-gray-700">Tratamiento #{index + 1}</span>
                            {index > 0 && (
                                <button
                                    type="button"
                                    onClick={() => remove(index)}
                                    className="text-red-500 hover:underline"
                                >
                                    Eliminar
                                </button>
                            )}
                        </div>

                        <select
                            {...register(`tratamientos.${index}.idtratamientos`, { valueAsNumber: true })}
                            className="w-full border rounded p-2"
                            required
                        >
                            <option value="">Seleccione un tratamiento</option>
                            {tratamientosList.map((trat) => (
                                <option key={trat.idtratamiento} value={trat.idtratamiento}>
                                    {trat.nombretratamiento}
                                </option>
                            ))}
                        </select>

                        <input
                            type="number"
                            {...register(`tratamientos.${index}.cantidadarecursosusados`, { valueAsNumber: true })}
                            placeholder="Cantidad de recursos usados"
                            className="w-full border rounded p-2"
                            required
                        />

                        <input
                            type="text"
                            {...register(`tratamientos.${index}.descripcionrecursos`)}
                            placeholder="Descripción de recursos"
                            className="w-full border rounded p-2"
                            required
                        />

                        <select
                            {...register(`tratamientos.${index}.iddiente`, { valueAsNumber: true })}
                            className="w-full border rounded p-2"
                            required
                        >
                            <option value="">Seleccione un diente</option>
                            {dientesList.map((diente) => (
                                <option key={diente.iddiente} value={diente.iddiente}>
                                    Diente #{diente.numerodiente}
                                </option>
                            ))}
                        </select>

                        <select
                            {...register(`tratamientos.${index}.idestadoDiente`, { valueAsNumber: true })}
                            className="w-full border rounded p-2"
                            required
                        >
                            <option value="">Seleccione estado del diente</option>
                            <option value={1}>Saludable</option>
                            <option value={2}>Fracturado</option>
                            <option value={3}>Dañado</option>
                            <option value={4}>Ausente</option>
                            <option value={5}>Impactado</option>
                            <option value={6}>Desgastado</option>
                            <option value={7}>Tratado</option>
                        </select>

                        <textarea
                            {...register(`tratamientos.${index}.resultadotratamiento`)}
                            placeholder="Resultado del tratamiento"
                            className="w-full border rounded p-2"
                            required
                        />
                    </div>
                ))}

                <button
                    type="button"
                    onClick={() => append({
                        idtratamientos: undefined,
                        cantidadarecursosusados: undefined,
                        descripcionrecursos: "",
                        iddiente: undefined,
                        idestadoDiente: undefined,
                        resultadotratamiento: "",
                    })}
                    className="bg-blue-100 hover:bg-blue-200 text-blue-700 font-medium px-4 py-2 rounded"
                >
                    Añadir otro tratamiento
                </button>
            </div>

            <button
                type="submit"
                className="w-full bg-green-600 hover:bg-green-700 text-white font-semibold py-2 px-4 rounded-lg"
                onClick={() => Navigate('/HomeOdontologo')}
            >
                Actualizar historial clínico
            </button>
        </form>
    );
}
