import { Router } from 'express';
import upload from '../middlewares/upload';
import ImagePaciente from '../models/ImagePaciente.model';
import { ImagePacienteController } from '../Controllers/ImagePaciente.controller';

const router = Router();

router.post('/imagenpaciente/:idusuario', upload.single('image'), async (req, res) => {
    try {
        const { idusuario } = req.params;
        const imageBuffer = req.file.buffer;
        const mimeType = req.file.mimetype;

        const imagePaciente = new ImagePaciente({
            UserId: idusuario,
            image: imageBuffer,
            MimeType: mimeType
        })

        await imagePaciente.save()
        res.status(200).json({ message: 'Imagen guardada correctamente' });
    } catch (error) {
        console.error('Error al subir la imagen:', error);
        res.status(500).json({ error: 'Error al subir la imagen' });
    }
});

router.get('/getimage/:idusuario', ImagePacienteController.getImageByIdUsuario)

export default router;