import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';





// 🌸 Home Page with Floating Button
class Loveletterpage extends StatelessWidget {
  const Loveletterpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title:  Text("My Love ❤️",),
        
        backgroundColor: Colors.pink,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.favorite,
              color: Colors.pink,
              size: 120,
            ),
            const SizedBox(height: 20),
            const Text(
              "Hey my wifey 😘\nClick the button below to read my letter 💌",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, color: Colors.black87),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        child: const Icon(Icons.person, color: Colors.blueGrey),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const LoveLetterPage(),
            ),
          );
        },
      ),
    );
  }
}

// 💌 Love Letter Page
class LoveLetterPage extends StatelessWidget {
  const LoveLetterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title:  Text("A Letter From Me 🤍 ",
         style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),),
        backgroundColor:   Color(0xFF0D1B2A),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueGrey.shade100, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              padding: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blueGrey.withOpacity(0.3),
                    blurRadius: 15,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: const SingleChildScrollView(
                child: Text(
                  "My Love ❤️,\n\n"
                  "I may not always be there beside you to ask how you're feeling,\n"
                  "to understand your mood, or to comfort you at the right moment...\n\n"
                  "So I created this little space for you.\n\n"
                  "Here, instead of me… I’m sending Allah to take care of your heart,\n"
                  "to listen to your feelings, and to guide you when I can’t.\n\n"
                  "But remember one thing…\n"
                  "Soon, I will be there for you — not through a screen, kisses on those cheeks\n"
                  "but right next to you, always.\n\n"
                  "I’m yours… and you belong to me.\n\n"
                  "Love you forever, my wifey ❤️",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    height: 1.6,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}