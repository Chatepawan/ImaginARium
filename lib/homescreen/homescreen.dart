import 'package:flutter/material.dart';
import 'package:flutter_cube/flutter_cube.dart';

class HomeScreenPage extends StatefulWidget {
  const HomeScreenPage({Key? key}) : super(key: key);

  @override
  State<HomeScreenPage> createState() => _HomeScreenPageState();
}

class _HomeScreenPageState extends State<HomeScreenPage> {
  final TextEditingController _searchController = TextEditingController();
  String? _currentModel;

  final Map<String, String> _modelMap = {
    'Car': 'assets/models/car.obj',
    'Apple': 'assets/models/apple.obj',
    'Aeroplane': 'assets/models/aeroplane.obj',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff270E7C),
        title: Center(
          child: const Text(
            'ImaginARium',
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            const SizedBox(height: 20),
            _buildSearchBar(),
            const SizedBox(height: 20),
            _buildModelButtons(),
            const SizedBox(height: 20),
            Expanded(
              child: _currentModel == null
                  ? const Center(
                child: Text(
                  'Select a model or use the search bar.',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              )
                  : FutureBuilder<Widget>(
                future: _load3DModel(_currentModel!),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return const Center(
                      child: Text(
                        'Error loading model. Try again.',
                        style: TextStyle(color: Colors.red),
                      ),
                    );
                  } else {
                    return snapshot.data!;
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        const CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage('assets/images/img.png'), // Add an avatar image in assets
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Learning Just a Click Away!',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xff270E7C),
              ),
            ),
            Text(
              'Explore interactive 3D models.',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSearchBar() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: TextField(
        controller: _searchController,
        decoration: InputDecoration(
          hintText: 'Search for 3D models (e.g., car, apple)',
          contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide.none,
          ),
          suffixIcon: IconButton(
            icon: const Icon(Icons.search, color: Color(0xff744EE5)),
            onPressed: () {
              setState(() {
                _currentModel = _searchController.text.trim().toLowerCase();
              });
            },
          ),
        ),
      ),
    );
  }

  Widget _buildModelButtons() {
    return Wrap(
      spacing: 8.0,
      runSpacing: 8.0,
      children: _modelMap.entries.map((entry) {
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: _currentModel == entry.key.toLowerCase()
                ? Colors.deepPurple
                : const Color(0xff744EE5),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onPressed: () {
            setState(() {
              _currentModel = entry.key.toLowerCase();
            });
          },
          child: Text(
            entry.key,
            style: const TextStyle(fontSize: 16, color: Colors.white),
          ),
        );
      }).toList(),
    );
  }

  Future<Widget> _load3DModel(String modelName) async {
    final modelPath = _modelMap.entries
        .firstWhere((entry) => entry.key.toLowerCase() == modelName)
        .value;

    return Cube(
      onSceneCreated: (Scene scene) {
        scene.world.add(Object(fileName: modelPath));
        scene.camera.zoom = 10;
      },
    );
  }
}
