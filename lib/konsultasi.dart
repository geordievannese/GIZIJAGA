import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';

class KonsultasiDokterPage extends StatefulWidget {
  const KonsultasiDokterPage({super.key});

  @override
  KonsultasiDokterPageState createState() => KonsultasiDokterPageState();
}

class KonsultasiDokterPageState extends State<KonsultasiDokterPage> {
  List<Map<String, String>> doctors = [];
  List<Map<String, String>> filteredDoctors = [];
  TextEditingController searchController = TextEditingController();

  String animatedPlaceholder = '';
  final String placeholderText = 'Search by Doctor\'s Name';
  Timer? typingTimer;
  bool userTyping = false;

  @override
  void initState() {
    super.initState();
    doctors = _generateDoctors();
    filteredDoctors = doctors;
    _startTypingAnimation();
  }

  @override
  void dispose() {
    typingTimer?.cancel(); 
    searchController.dispose();
    super.dispose();
  }

  List<Map<String, String>> _generateDoctors() {
    final random = Random();
    List<String> names = ['Liv', 'Bryan Gervais', 'Jane', 'Izzy', 'Made', 'Nayaka', 'Jhonny', 'Cue', 'Cuewe', 'Lin'];

    // Shuffle the list to randomize the order and take unique names.
    names.shuffle();

    // Ensure that we do not exceed the number of names available.
    return List.generate(names.length, (index) {
      return {
        'name': names[index], 
        'age': (20 + random.nextInt(20)).toString(),
        'specialty': 'Nutritionist',
        'rate': (50 + random.nextInt(150)).toString(),
        'practiceHours': '${10} AM - ${5 + random.nextInt(4)} PM'
      };
    });
  }

  void _startTypingAnimation() {
    typingTimer = Timer.periodic(const Duration(milliseconds: 100), (Timer timer) {
      if (userTyping) {
        timer.cancel();
      } else if (animatedPlaceholder.length < placeholderText.length) {
        setState(() {
          animatedPlaceholder += placeholderText[animatedPlaceholder.length];
        });
      } else {
        setState(() {
          animatedPlaceholder = '';
        });
      }
    });
  }

void _filterDoctors(String query) {
  setState(() {
    userTyping = query.isNotEmpty;
    if (query.isEmpty) {
      // Reset to all doctors when the input is cleared
      filteredDoctors = doctors;
      
      // Restart typing animation if no input
      if (typingTimer == null || !typingTimer!.isActive) {
        _startTypingAnimation();
      }
    } else {
      // Filter based on query and stop typing animation
      filteredDoctors = doctors
          .where((doctor) => doctor['name']!.toLowerCase().contains(query.toLowerCase()))
          .toList();
      
      // Stop the typing animation
      typingTimer?.cancel();
    }
  });
}


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color.fromARGB(255, 21, 168, 107),
                    Color.fromARGB(255, 56, 239, 125),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: TextField(
                controller: searchController,
                onChanged: _filterDoctors,
                decoration: InputDecoration(
                  hintText: animatedPlaceholder,
                  hintStyle: const TextStyle(color: Colors.white70),
                  border: InputBorder.none,
                  prefixIcon: const Icon(Icons.search, color: Colors.white),
                  contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                ),
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: filteredDoctors.length,
            itemBuilder: (context, index) {
              final doctor = filteredDoctors[index];

              // Modern and cool card design
              return Card(
                elevation: 8,
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Colors.greenAccent, Colors.tealAccent],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const CircleAvatar(
                        backgroundColor: Colors.teal,
                        radius: 30,
                        child: Icon(
                          Icons.person,
                          color: Colors.black,
                          size: 35,
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'dr. ${doctor['name']}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20, // Increased font size
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              'Age: ${doctor['age']}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16, // Increased font size
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              'Specialty: ${doctor['specialty']}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16, // Increased font size
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              'Rate: \$${doctor['rate']}/hour',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16, // Increased font size
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text(
                            'Hours:',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16, // Increased font size
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            doctor['practiceHours']!,
                            style: const TextStyle(
                              fontSize: 16, // Increased font size
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
