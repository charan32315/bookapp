// routes/bookRoutes.js
const express = require('express');
const router = express.Router();
const bookController = require('./controllers/bookController');

// Route to get all books
router.get('/', bookController.getAllBooks);

// Route to add a new book
router.post('/', bookController.createBook);

module.exports = router;
