import 'package:flutter/material.dart';
import 'book_card.dart';

class AdventureMangaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Adventure Manga")),
      body: SingleChildScrollView( // Allows scrolling of the entire body
        child: Padding(
          padding: const EdgeInsets.all(8.0), // Optional padding
          child: Column(
            children: [
              BookCard(
                title: "One Piece",
                author: "Eiichiro Oda",
                imagePath: "assets/one_piece.jpg",
              ),
              SizedBox(height: 16), // Add some spacing between cards
              BookCard(
                title: "Naruto",
                author: "Masashi Kishimoto",
                imagePath: "assets/naruto.jpg",
              ),
              SizedBox(height: 16),
              BookCard(
                title: "Fairy Tail",
                author: "Hiro Mashima",
                imagePath: "assets/fairy_tail.jpg",
              ),
              SizedBox(height: 16),
              BookCard(
                title: "Hunter x Hunter",
                author: "Yoshihiro Togashi",
                imagePath: "assets/hunter_x_hunter.jpg",
              ),
              // Add more BookCards as needed
            ],
          ),
        ),
      ),
    );
  }
}
