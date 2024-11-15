const express = require('express');
const mongoose = require('mongoose');
const authRoutes = require('./routes/authRoutes');
const cors = require('cors');

const app = express();
const port = 3000;

// Middleware
app.use(cors());
app.use(express.json()); // Correct way to parse incoming JSON requests

// Routes
app.use('/auth', authRoutes);

// MongoDB connection
const uri = 'mongodb+srv://charan:cherry123@books.ot4dm.mongodb.net/?retryWrites=true&w=majority&appName=books';
mongoose.connect(uri, { useNewUrlParser: true, useUnifiedTopology: true })
  .then(() => {
    console.log('Connected to MongoDB');
  })
  .catch((error) => {
    console.error('Error connecting to MongoDB:', error);
  });

// Express server setup
app.get('/', (req, res) => {
  res.send('Hello World!');
});

app.listen(port, () => {
  console.log(`Server running on port ${port}`);
});
