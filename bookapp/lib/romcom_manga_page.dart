import 'package:flutter/material.dart';
import 'book_card.dart'; // Make sure to import the BookCard

class RomComMangaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RomCom Manga'),
      ),
      body: SingleChildScrollView( // Allows scrolling if the content exceeds the screen height
        child: Center( // Center the Column horizontally
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              BookCard(
                title: 'Horimiya',
                author: 'Hero',
                imagePath: 'assets/hor_miya.jpg',
              ),
              BookCard(
                title: 'Kaguya-sama: Love Is War',
                author: 'Aka Akasaka',
                imagePath: 'assets/love_is_war.jpg',
              ),
              BookCard(
                title: 'Little Monster',
                author: 'Inio Asano',
                imagePath: 'assets/my_little_monster.jpg',
              ),
              BookCard(
                title: 'Toradora!',
                author: 'Yuyuko Tokemiya',
                imagePath: 'assets/tora_dora.jpg',
              ),
              BookCard(
                title: 'Nisekoi',
                author: 'Naoshi Komi',
                imagePath: 'assets/nis_e_koi.jpg',
              ),
              // Add more BookCard instances as needed
            ],
          ),
        ),
      ),
    );
  }
}
