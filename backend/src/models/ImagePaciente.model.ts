import mongoose from "mongoose";

const imagePacienteSchema = new mongoose.Schema({
    image: {
        type: Buffer,
        required: true
    },
    UserId: {
        type: Number,
        required: true
    },
    MimeType: {
        type: String,
        required: true
    }
});

const ImagePaciente = mongoose.model("ImagePaciente", imagePacienteSchema);
export default ImagePaciente;