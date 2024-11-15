import 'package:flutter/material.dart';
import 'search_page.dart';
import 'library_page.dart';
import 'login_page.dart';
import 'book_detail_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0; // Default to Home
  final List<Widget> _pages = [
    HomePageContent(), // Home page content
    SearchPage(),      // Search page
    LibraryPage(),     // Library page
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update selected index on tap
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Manga Books"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: IconButton(
              icon: Icon(Icons.logout, size: 30),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
            ),
          ),
        ],
      ),
      body: _pages[_selectedIndex], // Display the selected page
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            label: 'Library',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        backgroundColor: Colors.black,
        onTap: _onItemTapped, // Call the method on tap
      ),
    );
  }
}

class HomePageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black, // Set the background color to black
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Mangas Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Top Mangas",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white), // White color for headings
              ),
            ),
            SizedBox(
              height: 200, // Fixed height for horizontal scroll
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                children: [
                  BookCard(title: "One Piece", author: "Eichiro Oda", imagePath: 'assets/one_piece.jpg'),
                  SizedBox(width: 20),
                  BookCard(title: "Naruto", author: "Kishimoto", imagePath: 'assets/naruto.jpg'),
                  SizedBox(width: 20),
                  BookCard(title: "Jujutsu Kaisen", author: "Gege Akutami", imagePath: 'assets/jjk.jpg'),
                  SizedBox(width: 20),
                  BookCard(title: "Bleach", author: "Noriaki Kubo", imagePath: 'assets/bleach.jpg'),
                  SizedBox(width: 20),
                  BookCard(title: "Dragon Ball", author: "Akira Toriyama", imagePath: 'assets/dragon_ball.jpg'),
                ],
              ),
            ),
            SizedBox(height: 24),

            // Top Adventure Manga Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Top Adventure Manga",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white), // White color for headings
              ),
            ),
            SizedBox(
              height: 200, // Fixed height for horizontal scroll
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                children: [
                  BookCard(title: "One Piece", author: "Eichiro Oda", imagePath: 'assets/one_piece.jpg'),
                  SizedBox(width: 20),
                  BookCard(title: "Naruto", author: "Kishimoto", imagePath: 'assets/naruto.jpg'),
                  SizedBox(width: 20),
                  BookCard(title: "Hunter x Hunter", author: "Yoshihiro Togashi", imagePath: 'assets/hunter_x_hunter.jpg'),
                  SizedBox(width: 20),
                  BookCard(title: "Fairy Tail", author: "Hiro Mashima", imagePath: 'assets/fairy_tail.jpg'),
                ],
              ),
            ),
            SizedBox(height: 24),

            // Top Sports Manga Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Top Sports Manga",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white), // White color for headings
              ),
            ),
            SizedBox(
              height: 200, // Fixed height for horizontal scroll
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                children: [
                  BookCard(title: "Haikyuu!!", author: "Haruichi Furudate", imagePath: 'assets/haik_yuu.jpg'),
                  SizedBox(width: 20),
                  BookCard(title: "Blue Lock", author: "Muneyuki Kaneshiro", imagePath: 'assets/blue_lock.jpg'),
                  SizedBox(width: 20),
                  BookCard(title: "Eyeshield 21", author: "Riichiro", imagePath: 'assets/eye_shield.jpg'),
                  SizedBox(width: 20),
                  BookCard(title: "Kuroko Basket", author: "Tadatoshi Fujimaki", imagePath: 'assets/kur_oko.jpg'),
                  SizedBox(width: 20),
                  BookCard(title: "Slam Dunk", author: "Takehiko Inoue", imagePath: 'assets/slam_dunk.jpg'),
                ],
              ),
            ),
            SizedBox(height: 24),

            // Top RomCom Manga Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Top RomCom Manga",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white), // White color for headings
              ),
            ),
            SizedBox(
              height: 200, // Fixed height for horizontal scroll
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                children: [
                  BookCard(title: "Kaguya-sama", author: "Akasaka", imagePath: 'assets/love_is_war.jpg'),
                  SizedBox(width: 20),
                  BookCard(title: "Horimiya", author: "Hero", imagePath: 'assets/hor_miya.jpg'),
                  SizedBox(width: 20),
                  BookCard(title: "littlemonster", author: "robico", imagePath: 'assets/my_little_monster.jpg'),
                  SizedBox(width: 20),
                  BookCard(title: "Toradora!", author: "Tokemiya", imagePath: 'assets/tora_dora.jpg'),
                  SizedBox(width: 20),
                  BookCard(title: "Nisekoi", author: "Naoshi Komi", imagePath: 'assets/nis_e_koi.jpg'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BookCard extends StatelessWidget {
  final String title;
  final String author;
  final String imagePath;

  const BookCard({Key? key, required this.title, required this.author, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BookDetailPage(title: title, author: author, imagePath: imagePath),
          ),
        );
      },
      child: Container(
        width: 140, // Set the width of the BookCard
        child: Card(
          color: Color(0xFF00B4D8), // Blue background for the cards
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Image.asset(imagePath, fit: BoxFit.cover),
                ),
                SizedBox(height: 8),
                Text(
                  title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                Text(
                  author,
                  style: TextStyle(fontSize: 14, color: Colors.grey[200]),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
