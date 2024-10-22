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
        title: const Text('Gizi Jaga'),
        backgroundColor: Colors.black,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.white),
            onPressed: () {},
          )
        ],
      ),
      body: Container(
        color: const Color.fromARGB(255, 21, 168, 107),
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
        backgroundColor: Colors.black,
        selectedItemColor: Colors.blue[700],
        unselectedItemColor: Colors.white,
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
  num _calorieBudget = 2000;
  final num _initialCalorieBudget = 2000;
  num _proteinBudget = 50;
  final num _initialProteinBudget = 50;
  num _fatBudget = 70;
  final num _initialFatBudget = 70;

  final List<Map<String, dynamic>> _selectedFoods = [];

  final Map<String, dynamic> _nutritionalInfo = {
    // Fruits
    'apel': {'calories': 52, 'protein': 0.3, 'fat': 0.2},
    'pisang': {'calories': 89, 'protein': 1.1, 'fat': 0.3},
    'nasi': {'calories': 130, 'protein': 2.7, 'fat': 0.3},
    'mangga': {'calories': 60, 'protein': 0.8, 'fat': 0.4},
    'jeruk': {'calories': 47, 'protein': 0.9, 'fat': 0.1},
    'anggur': {'calories': 69, 'protein': 0.7, 'fat': 0.2},
    'nanas': {'calories': 50, 'protein': 0.5, 'fat': 0.1},
    'pepaya': {'calories': 43, 'protein': 0.5, 'fat': 0.3},
    'stroberi': {'calories': 32, 'protein': 0.7, 'fat': 0.3},
    'semangka': {'calories': 30, 'protein': 0.6, 'fat': 0.2},
    'kiwi': {'calories': 61, 'protein': 1.1, 'fat': 0.5},
    'alpukat': {'calories': 160, 'protein': 2.0, 'fat': 15.0},
    'pir': {'calories': 57, 'protein': 0.4, 'fat': 0.1},
    'delima': {'calories': 83, 'protein': 1.7, 'fat': 1.2},
    'jambu_biji': {'calories': 68, 'protein': 2.6, 'fat': 1.0},
    'durian': {'calories': 147, 'protein': 1.5, 'fat': 5.0},
    'rambutan': {'calories': 82, 'protein': 0.7, 'fat': 0.2},
    'sirsak': {'calories': 66, 'protein': 1.0, 'fat': 0.3},
    'melon': {'calories': 34, 'protein': 0.8, 'fat': 0.2},
    'buah_naga': {'calories': 60, 'protein': 1.2, 'fat': 0.0},
    'markisa': {'calories': 97, 'protein': 2.2, 'fat': 0.7},

    // Vegetables
    'bayam': {'calories': 23, 'protein': 2.9, 'fat': 0.4},
    'brokoli': {'calories': 34, 'protein': 2.8, 'fat': 0.4},
    'wortel': {'calories': 41, 'protein': 0.9, 'fat': 0.2},
    'kubis': {'calories': 25, 'protein': 1.3, 'fat': 0.1},
    'tomat': {'calories': 18, 'protein': 0.9, 'fat': 0.2},
    'mentimun': {'calories': 15, 'protein': 0.7, 'fat': 0.1},
    'selada': {'calories': 15, 'protein': 1.4, 'fat': 0.2},
    'buncis': {'calories': 31, 'protein': 1.8, 'fat': 0.1},
    'kentang': {'calories': 77, 'protein': 2.0, 'fat': 0.1},
    'jagung': {'calories': 86, 'protein': 3.2, 'fat': 1.2},
    'terong': {'calories': 25, 'protein': 1.0, 'fat': 0.2},
    'kacang_panjang': {'calories': 47, 'protein': 3.0, 'fat': 0.4},
    'labu_siam': {'calories': 19, 'protein': 0.8, 'fat': 0.1},
    'kembang_kol': {'calories': 25, 'protein': 1.9, 'fat': 0.3},
    'kangkung': {'calories': 19, 'protein': 2.6, 'fat': 0.2},
    'okra': {'calories': 33, 'protein': 1.9, 'fat': 0.2},
    'pakcoy': {'calories': 13, 'protein': 1.5, 'fat': 0.2},
    'paprika_merah': {'calories': 31, 'protein': 1.0, 'fat': 0.3},
    'jamur_tiram': {'calories': 22, 'protein': 3.1, 'fat': 0.3},
    'ubi_jalar': {'calories': 86, 'protein': 1.6, 'fat': 0.1},

    // Fast Foods
    'hamburger': {'calories': 295, 'protein': 17.0, 'fat': 13.0},
    'pizza': {'calories': 266, 'protein': 11.0, 'fat': 10.0},
    'kentang_goreng': {'calories': 365, 'protein': 3.4, 'fat': 17.0},
    'nugget': {'calories': 250, 'protein': 14.0, 'fat': 15.0},
    'hot_dog': {'calories': 150, 'protein': 5.0, 'fat': 13.0},
    'fried_rice': {'calories': 350, 'protein': 8.0, 'fat': 12.0},
    'spaghetti': {'calories': 158, 'protein': 5.0, 'fat': 7.0},
    'sushi': {'calories': 200, 'protein': 10.0, 'fat': 5.0},
    'sandwich': {'calories': 220, 'protein': 9.0, 'fat': 8.0},
    'kebab': {'calories': 300, 'protein': 15.0, 'fat': 20.0},
  };

  final List<String> _foodOptions = [
    'apel',
    'pisang',
    'nasi',
    'mangga',
    'jeruk',
    'anggur',
    'nanas',
    'pepaya',
    'stroberi',
    'semangka',
    'kiwi',
    'alpukat',
    'pir',
    'delima',
    'jambu_biji',
    'durian',
    'rambutan',
    'sirsak',
    'melon',
    'buah_naga',
    'markisa',
    'bayam',
    'brokoli',
    'wortel',
    'kubis',
    'tomat',
    'mentimun',
    'selada',
    'buncis',
    'kentang',
    'jagung',
    'terong',
    'kacang_panjang',
    'labu_siam',
    'kembang_kol',
    'kangkung',
    'okra',
    'pakcoy',
    'paprika_merah',
    'jamur_tiram',
    'ubi_jalar',
    'hamburger',
    'pizza',
    'kentang_goreng',
    'nugget',
    'hot_dog',
    'fried_rice',
    'spaghetti',
    'sushi',
    'sandwich',
    'kebab',
  ];

  List<String> _suggestions = [];
  Map<String, dynamic>? _selectedFoodInfo;

  void _checkNutrients() {
    final foodName = _foodController.text.toLowerCase();
    setState(() {
      if (_nutritionalInfo.containsKey(foodName)) {
        _selectedFoodInfo = _nutritionalInfo[foodName];
        _selectedFoods.add({'name': foodName, 'nutrients': _selectedFoodInfo!});
        _foodController.clear();
        _suggestions.clear();
      } else {
        _selectedFoodInfo = null;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Makanan tidak ditemukan dalam database.')),
        );
      }
    });
  }

  void _updateSuggestions(String input) {
    setState(() {
      if (input.isEmpty) {
        _suggestions.clear();
      } else {
        _suggestions =
            _foodOptions.where((food) => food.startsWith(input)).toList();
      }
    });
  }

  void _updateCalorieBudget() {
    setState(() {
      for (var food in _selectedFoods) {
        var nutrients = food['nutrients'];
        _calorieBudget -= nutrients['calories'];
        _proteinBudget -= nutrients['protein'];
        _fatBudget -= nutrients['fat'];
      }
      _selectedFoods.clear(); // Clear selected foods after updating
    });
  }

  Widget buildNutrientCircle(
      String nutrientName, num budget, num initialBudget, String unit) {
    double percentage = (budget / initialBudget).clamp(0.0, 1.0);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: 100,
              height: 100,
              child: CircularProgressIndicator(
                value: percentage,
                strokeWidth: 10,
                backgroundColor: Colors.grey[200],
                valueColor:
                    AlwaysStoppedAnimation<Color>(Colors.blue[700]!),
              ),
            ),
            Text(
              '${nutrientName.capitalize()}:\n${budget.toStringAsFixed(1)} $unit',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    double caloriePercentage =
        (_calorieBudget / _initialCalorieBudget).clamp(0.0, 1.0);

    return SingleChildScrollView(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 29, 200, 197),
              Color.fromARGB(255, 51, 204, 204),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.start,
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
                    //crossAxisAlignment: CrossAxisAlignment.start,
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
                        onChanged: _updateSuggestions,
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
                      // Suggestions List
                      if (_suggestions.isNotEmpty)
                        SizedBox(
                          height: 100,
                          child: ListView.builder(
                            itemCount: _suggestions.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Text(
                                  _suggestions[index],
                                  style: const TextStyle(color: Colors.black),
                                ),
                                onTap: () {
                                  _foodController.text = _suggestions[index];
                                  _checkNutrients();
                                  _suggestions.clear();
                                },
                              );
                            },
                          ),
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
              // Display selected foods
              if (_selectedFoods.isNotEmpty)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Makanan Terpilih:',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    for (var food in _selectedFoods)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${food['name'].toString().capitalize()}',
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Kalori: ${food['nutrients']['calories']} kcal',
                              style: const TextStyle(fontSize: 16),
                            ),
                            Text(
                              'Protein: ${food['nutrients']['protein']} g',
                              style: const TextStyle(fontSize: 16),
                            ),
                            Text(
                              'Lemak: ${food['nutrients']['fat']} g',
                              style: const TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    const SizedBox(height: 20),
                    Center(
                      child: ElevatedButton(
                        onPressed: _updateCalorieBudget,
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
                        child: const Text('Perbarui Anggaran Nutrisi'),
                      ),
                    ),
                  ],
                ),
              const SizedBox(height: 30),
              const Text(
                'Anggaran Nutrisi Harian',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildNutrientCircle('kalori', _calorieBudget,
                      _initialCalorieBudget, 'kcal'),
                  buildNutrientCircle(
                      'protein', _proteinBudget, _initialProteinBudget, 'g'),
                  buildNutrientCircle(
                      'lemak', _fatBudget, _initialFatBudget, 'g'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Extension to capitalize the first letter of a string
extension StringCapitalization on String {
  String capitalize() {
    if (isEmpty) return this;
    return this[0].toUpperCase() + substring(1);
  }
}
