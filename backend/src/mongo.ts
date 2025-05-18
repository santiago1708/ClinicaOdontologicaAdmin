import mongoose from 'mongoose';

const mongourl = 'mongodb://localhost:27017/ImageStorage';

mongoose.connect(mongourl)
.then(() => console.log('MongoDB connected'))
.catch(err => console.log('MongoDB connection error:', err));

export default mongoose;