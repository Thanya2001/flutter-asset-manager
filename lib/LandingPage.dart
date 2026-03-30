import 'dart:math';
import 'package:asset_management_app/LoveletterPage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class EmotionPage extends StatefulWidget {
  const EmotionPage({super.key});

  @override
  State<EmotionPage> createState() => _EmotionPageState();
}

class _EmotionPageState extends State<EmotionPage> {
  final Random random = Random();
  String? lastMessageKey;

  Map<String, List<int>> shuffledIndexes = {};
  Map<String, int> currentIndex = {};

  Map<String, List<Map<String, String>>> emotions = {
    "sad": [
      {
        "arabic": "لَا تَقْنَطُوا مِن رَّحْمَةِ اللَّهِ",
        "english": "Do not despair of Allah’s mercy (39:53)",
        "reply":
            "I see the heaviness in your heart… the sadness you hide from everyone. But I know every tear you never showed. Hold on… My mercy is greater than your pain, and I will bring light back into your life."
      },
      {
        "arabic": "وَاللَّهُ غَفُورٌ رَّحِيمٌ",
        "english": "Allah is Forgiving and Merciful",
        "reply":
            "Even in your sadness, I am near you. You may feel alone, but you are never unseen. Let your heart rest… this pain will pass."
      }
    ],
    "lonely": [
      {
        "arabic": "وَهُوَ مَعَكُمْ أَيْنَ مَا كُنتُمْ",
        "english": "He is with you wherever you are (57:4)",
        "reply":
            "You feel alone… but I have never left you. Even in your silent nights, I am beside you. Talk to Me… I am always listening."
      },
      {
        "arabic": "إِنَّ اللَّهَ قَرِيبٌ",
        "english": "Indeed, Allah is near",
        "reply":
            "When people don’t understand you, remember I do. I am closer to you than anyone else."
      }
    ],
    "angry": [
      {
        "arabic": "إِنَّ اللَّهَ مَعَ الصَّابِرِينَ",
        "english": "Allah is with the patient",
        "reply":
            "I know your anger… it comes from pain. Be patient, I see your struggle and I will give you peace."
      },
      {
        "arabic": "وَاللَّهُ يُحِبُّ الصَّابِرِينَ",
        "english": "Allah loves the patient",
        "reply":
            "Control your anger gently… I am watching your patience and will reward you with calmness."
      }
    ],
    "fear": [
      {
        "arabic": "لَا تَخَفْ إِنَّ اللَّهَ مَعَنَا",
        "english": "Do not fear, Allah is with us",
        "reply":
            "Do not be afraid… I am with you in everything. Nothing can harm you without My will."
      },
      {
        "arabic": "حَسْبُنَا اللَّهُ",
        "english": "Allah is sufficient for us",
        "reply":
            "Trust Me with your fears… I am protecting you even when you don’t see it."
      }
    ],
    "overwhelmed": [
      {
        "arabic": "لَا يُكَلِّفُ اللَّهُ نَفْسًا إِلَّا وُسْعَهَا",
        "english": "Allah does not burden a soul beyond it can bear",
        "reply":
            "You feel overwhelmed… but I know your strength. You will get through this, I am with you."
      },
      {
        "arabic": "فَإِنَّ مَعَ الْعُسْرِ يُسْرًا",
        "english": "With hardship comes ease",
        "reply":
            "This moment is heavy… but ease is already on its way. Hold on."
      }
    ],
    "confused": [
      {
        "arabic": "وَمَن يَتَوَكَّلْ عَلَى اللَّهِ",
        "english": "Whoever relies on Allah",
        "reply":
            "You feel lost… but trust Me. You don’t need all answers now. I will guide you."
      },
      {
        "arabic": "رَّبِّ زِدْنِي عِلْمًا",
        "english": "Increase me in knowledge",
        "reply":
            "It’s okay to not know everything. Ask Me… I will show you the way."
      }
    ],
    "empty": [
      {
        "arabic": "أَلَا بِذِكْرِ اللَّهِ",
        "english": "In remembrance of Allah hearts find rest",
        "reply":
            "That emptiness… your heart is calling Me. Come back… I will fill it with peace."
      },
      {
        "arabic": "اللَّهُ نُورُ السَّمَاوَاتِ",
        "english": "Allah is the Light",
        "reply":
            "Even in darkness… I am your light. Don’t lose hope."
      }
    ],
    "happy": [
      {
        "arabic": "لَئِن شَكَرْتُمْ",
        "english": "If you are grateful, I will increase you",
        "reply":
            "Your happiness is a blessing… stay grateful and I will give you more."
      },
      {
        "arabic": "فَبِأَيِّ آلَاءِ رَبِّكُمَا",
        "english": "Which blessings will you deny?",
        "reply":
            "Enjoy this moment… it is a gift from Me."
      }
    ],
    "missing": [
      {
        "arabic": "وَعَسَىٰ أَن تَكْرَهُوا شَيْئًا",
        "english": "Perhaps you dislike something",
        "reply":
            "You miss them deeply… but sometimes I remove people to protect you."
      },
      {
        "arabic": "إِنَّ مَعَ الْعُسْرِ يُسْرًا",
        "english": "With hardship comes ease",
        "reply":
            "This pain of missing someone will soften… I am preparing something better."
      }
    ],
    "depressed": [
      {
        "arabic": "لَا تَحْزَنْ",
        "english": "Do not be sad",
        "reply":
            "I see your darkness… even when you feel empty, I am still holding you."
      },
      {
        "arabic": "اللَّهُ لَطِيفٌ",
        "english": "Allah is Gentle",
        "reply":
            "I am gentle with your healing… take your time, I am with you."
      }
    ],
    "love": [
      {
        "arabic": "وَجَعَلَ بَيْنَكُم مَّوَدَّةً",
        "english": "He placed love between you",
        "reply":
            "That love is from Me… keep it pure and I will guide it beautifully."
      },
      {
        "arabic": "إِنَّ اللَّهَ يُحِبُّ",
        "english": "Allah loves",
        "reply":
            "Love sincerely… but never lose yourself. Keep Me first."
      }
    ],
  };

  Map<String, String>? selectedMessage;

  void showMessage(String emotion) {
    final list = emotions[emotion]!;

    int randomIndex;
    String newKey;

    do {
      randomIndex = random.nextInt(list.length);
      newKey = "$emotion-$randomIndex";
    } while (newKey == lastMessageKey && list.length > 1);

    lastMessageKey = newKey;

    setState(() {
      selectedMessage = list[randomIndex];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      //   backgroundColor: Color(0xFF1B263B),
      //   title: Text(
      //     "How are you feeling now 🤍",
      //     style: GoogleFonts.poppins(
      //       color: Colors.white70,
      //       fontWeight: FontWeight.bold,
      //       fontSize: 20,
      //     ),
      //   ),
      // ),
      backgroundColor: Color(0xFF1B263B),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0B3D91), Color(0xFF1B263B)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Stack(
          children: [
            // 🌙 Subtle stars and crescent decorations
            Positioned(
              top: 50,
              right: 30,
              child: Icon(Icons.star, color: Colors.white54, size: 20),
            ),
            Positioned(
              top: 100,
              left: 50,
              child: Icon(Icons.star, color: Colors.white38, size: 15),
            ),
            Positioned(
              top: 120,
              right: 70,
              child: Icon(Icons.brightness_3, color: Colors.white30, size: 25),
            ),
 Column(
              children: [
                SizedBox(height: 60),
                Text(
                  "How are you feeling now 🤍",
                  style: GoogleFonts.poppins(
                    color: Colors.white70,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
          SizedBox(height: 30),
          Expanded(
            child: GridView.count(
              crossAxisCount: 3,
              children: [
                // Emotion Cards
                ...emotions.keys.map((emotion) {
                  return GestureDetector(
                    onTap: () => showMessage(emotion),
                    child: Card(
                      color: Colors.white,
                      margin: const EdgeInsets.all(8),
                      child: Center(
                        child: Text(
                          emotion.toUpperCase(),
                          style: GoogleFonts.poppins(
                            color: const Color.fromARGB(255, 36, 38, 45),
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  );
                }).toList(),

                // NEW: Letter for You Card
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoveLetterPage(),
                      ),
                    );
                  },
                  child: Card(
                    color: Colors.redAccent,
                    margin: const EdgeInsets.all(8),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.mail, color: Colors.white, size: 30),
                          SizedBox(height: 5),
                          Text(
                            "Letter for You",
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          if (selectedMessage != null)
            Container(
              padding: const EdgeInsets.all(16),
              color: Colors.black54,
              child: Column(
                children: [
                  Text(
                    selectedMessage?["arabic"] ?? "",
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    selectedMessage?["english"] ?? "",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    selectedMessage?["reply"] ?? "",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
        ],
      ),
      
    ])));
  }
}