import 'package:flutter/material.dart';
import 'book_detail_page.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController _searchController = TextEditingController();

  // Comprehensive books list
  List<Map<String, String>> books = [
    {"title": "One Piece", "author": "Eichiro Oda", "imagePath": "assets/one_piece.jpg"},
    {"title": "Naruto", "author": "Kishimoto", "imagePath": "assets/naruto.jpg"},
    {"title": "Jujutsu Kaisen", "author": "Gege Akutami", "imagePath": "assets/jjk.jpg"},
    {"title": "Bleach", "author": "Noriaki Kubo", "imagePath": "assets/bleach.jpg"},
    {"title": "Dragon Ball", "author": "Akira Toriyama", "imagePath": "assets/dragon_ball.jpg"},
    {"title": "Hunter x Hunter", "author": "Yoshihiro Togashi", "imagePath": "assets/hunter_x_hunter.jpg"},
    {"title": "Fairy Tail", "author": "Hiro Mashima", "imagePath": "assets/fairy_tail.jpg"},
    {"title": "Haikyuu!!", "author": "Haruichi Furudate", "imagePath": "assets/haik_yuu.jpg"},
    {"title": "Blue Lock", "author": "Muneyuki Kaneshiro", "imagePath": "assets/blue_lock.jpg"},
    {"title": "Eyeshield 21", "author": "Riichiro", "imagePath": "assets/eye_shield.jpg"},
    {"title": "Kuroko Basket", "author": "Tadatoshi Fujimaki", "imagePath": "assets/kur_oko.jpg"},
    {"title": "Slam Dunk", "author": "Takehiko Inoue", "imagePath": "assets/slam_dunk.jpg"},
    {"title": "Kaguya-sama", "author": "Akasaka", "imagePath": "assets/love_is_war.jpg"},
    {"title": "Horimiya", "author": "Hero", "imagePath": "assets/hor_miya.jpg"},
    {"title": "Little Monster", "author": "Robico", "imagePath": "assets/my_little_monster.jpg"},
    {"title": "Toradora!", "author": "Yuyuko Tokemiya", "imagePath": "assets/tora_dora.jpg"},
    {"title": "Nisekoi", "author": "Naoshi Komi", "imagePath": "assets/nis_e_koi.jpg"},
    // Add more books as necessary
  ];

  List<Map<String, String>> _searchResults = [];

  void _searchBooks(String query) {
    if (query.isEmpty) {
      _searchResults = [];
    } else {
      _searchResults = books
          .where((book) => book["title"]!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    setState(() {}); // Update the UI
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search Books"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              onChanged: _searchBooks,
              decoration: InputDecoration(
                labelText: "Search for a book",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: _searchResults.isEmpty
                ? Center(child: Text("No results found"))
                : ListView.builder(
              itemCount: _searchResults.length,
              itemBuilder: (context, index) {
                final book = _searchResults[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BookDetailPage(
                          title: book["title"]!,
                          author: book["author"]!,
                          imagePath: book["imagePath"]!,
                        ),
                      ),
                    );
                  },
                  child: ListTile(
                    title: Text(book["title"]!),
                    subtitle: Text(book["author"]!),
                    leading: Image.asset(
                      book["imagePath"]!,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
