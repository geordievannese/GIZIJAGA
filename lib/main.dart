import 'package:flutter/material.dart';

void main() {
  runApp(const GiziJagaApp());
}

class GiziJagaApp extends StatelessWidget {
  const GiziJagaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gizi Jaga',
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: 'Roboto',
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    Center(child: Text('Konsultasi Dokter')),
    Center(child: Text('Pusat Bantuan')),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,  // Set background color to black
        title: const Text(
          'Gizi Jaga',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,  // Ensure text is visible on black background
            shadows: [
              Shadow(
                offset: Offset(-2.0, 2.0), // Shadow for 3D effect
                blurRadius: 4.0,
                color: Color.fromARGB(128, 0, 0, 0), // Black shadow color
              ),
              Shadow(
                offset: Offset(2.0, -2.0), // Additional shadow for more depth
                blurRadius: 4.0,
                color: Color.fromARGB(128, 0, 0, 0), // Black shadow color
              ),
            ],
          ),
        ),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.white), // Icon color
            onPressed: () {},
          )
        ],
      ),
      body: Container(
        color: const Color.fromARGB(255, 21, 168, 107),  // Set body background color to black
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.white),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_hospital, color: Colors.white),
            label: 'Konsultasi',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.help_outline, color: Colors.white),
            label: 'Bantuan',
          ),
        ],
        currentIndex: _selectedIndex,
        backgroundColor: Colors.black,  // Set bottom navigation bar background to black
        selectedItemColor: Colors.blue[700],  // Selected item color
        unselectedItemColor: Colors.white,  // Unselected items should remain visible
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final _foodController = TextEditingController();

  final Map<String, dynamic> _nutritionalInfo = {
    'apel': {'calories': 52, 'protein': 0.3, 'fat': 0.2},
    'pisang': {'calories': 89, 'protein': 1.1, 'fat': 0.3},
    'nasi': {'calories': 130, 'protein': 2.7, 'fat': 0.3},
    'mangga': {'calories': 60, 'protein': 0.8, 'fat': 0.2},
    'jeruk': {'calories': 47, 'protein': 0.9, 'fat': 0.1},
  };

  Map<String, dynamic>? _selectedFoodInfo;

  void _checkNutrients() {
    final food = _foodController.text.toLowerCase();
    setState(() {
      if (_nutritionalInfo.containsKey(food)) {
        _selectedFoodInfo = _nutritionalInfo[food];
      } else {
        _selectedFoodInfo = null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 29, 200, 197), // Top part of the gradient set to black
              Color.fromARGB(255, 51, 204, 204), // Cool cyan gradient at the bottom
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 16),
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Masukkan makanan yang kamu makan hari ini:',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        controller: _foodController,
                        decoration: InputDecoration(
                          labelText: 'Nama Makanan',
                          hintText: 'Contoh: apel, pisang, nasi',
                          labelStyle: const TextStyle(color: Colors.black),
                          hintStyle: const TextStyle(color: Colors.black),
                          filled: true,
                          fillColor: Colors.grey[200],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        style: const TextStyle(color: Colors.black),
                      ),
                      const SizedBox(height: 20),
                      Center(
                        child: ElevatedButton.icon(
                          onPressed: _checkNutrients,
                          icon: const Icon(Icons.search),
                          label: const Text('Cek Nutrisi'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue[700],
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 12,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
              _selectedFoodInfo != null
                  ? Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Kalori: ${_selectedFoodInfo!['calories']} kcal',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            'Protein: ${_selectedFoodInfo!['protein']} g',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            'Lemak: ${_selectedFoodInfo!['fat']} g',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    )
                  : const Center(
                      child: Text(
                        'Makanan tidak ditemukan',
                        style: TextStyle(
                          color: Colors.redAccent,
                          fontSize: 18,
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _foodController.dispose();
    super.dispose();
  }
}
