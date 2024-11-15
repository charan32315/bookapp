// controllers/bookController.js
const Book = require('../models/Book');

// Get all books
exports.getAllBooks = async (req, res) => {
  try {
    const books = await Book.find();
    res.json(books);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

// Create a new book
exports.createBook = async (req, res) => {
  const book = new Book({
    title: req.body.title,
    author: req.body.author,
    imagePath: req.body.imagePath,
  });
  try {
    const newBook = await book.save();
    res.status(201).json(newBook);
  } catch (error) {
    res.status(400).json({ message: error.message });
  }
};
