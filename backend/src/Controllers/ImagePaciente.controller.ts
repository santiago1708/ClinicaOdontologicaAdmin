import ImagePaciente from "../models/ImagePaciente.model";

export class ImagePacienteController {
    static getImageByIdUsuario = async (req: any, res: any) => {
        try {
            const { idusuario } = req.params;
            const image = await ImagePaciente.findOne({ UserId: parseInt(idusuario) });
            if (!image) {
                return res.status(404).json({ message: "No se encontró la imagen" });
            }
            const base64Image = `data:${image.MimeType};base64,${image.image.toString('base64')}`;
            res.status(200).json({ image: base64Image });
        } catch (error) {
            console.error("Error al obtener la imagen:", error);
            res.status(500).json({ error: 'Error al obtener la imagen' });
        }
    }

}