import 'package:flutter/material.dart';
import 'book_card.dart'; // Make sure to import the BookCard

class SportsMangaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sports Manga'),
      ),
      body: SingleChildScrollView( // Allows scrolling if the content exceeds the screen height
        child: Center( // Center the Column horizontally
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              BookCard(
                title: 'Haikyuu!!',
                author: 'Haruichi Furudate',
                imagePath: 'assets/haik_yuu.jpg',
              ),
              BookCard(
                title: 'Blue Lock',
                author: 'Muneyuki Kaneshiro',
                imagePath: 'assets/blue_lock.jpg',
              ),
              BookCard(
                title: 'Kuroko’s Basketball',
                author: 'Tadatoshi Fujimaki',
                imagePath: 'assets/kur_oko.jpg',
              ),
              BookCard(
                title: 'Slam Dunk',
                author: 'Takehiko Inoue',
                imagePath: 'assets/slam_dunk.jpg',
              ),
              BookCard(
                title: 'Eyeshield 21',
                author: 'Riichiro Inagaki',
                imagePath: 'assets/eye_shield.jpg',
              ),
              // Add more BookCard instances as needed
            ],
          ),
        ),
      ),
    );
  }
}
