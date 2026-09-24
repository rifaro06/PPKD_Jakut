import 'package:flutter/material.dart';
import '../models/got_model.dart';
import '../services/got_api_service.dart';
import '../services/got_dio_client.dart';
import 'got_detail_screen.dart';

class GotScreen extends StatefulWidget {
  const GotScreen({super.key});

  @override
  State<GotScreen> createState() => _GotScreenState();
}

class _GotScreenState extends State<GotScreen> {
  late final GotApiService _apiService;
  late Future<List<GotCharacterModel>> _charactersFuture;

  List<GotCharacterModel> _allCharacters = [];
  List<GotCharacterModel> _filteredCharacters = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final dio = createGotDioClient();
    _apiService = GotApiService(dio);
    _loadCharacters();
  }

  void _loadCharacters() {
    _charactersFuture = _apiService.fetchGotCharacters();
    _charactersFuture.then((data) {
      setState(() {
        _allCharacters = data;
        _filteredCharacters = data;
      });
    });
  }

  void _refreshData() {
    _searchController.clear();
    setState(() {
      _loadCharacters();
    });
  }

  void _filterCharacters(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredCharacters = _allCharacters;
      } else {
        _filteredCharacters = _allCharacters.where((character) {
          final nameMatches = character.fullName
              .toLowerCase()
              .contains(query.toLowerCase());
          final titleMatches = character.title
              .toLowerCase()
              .contains(query.toLowerCase());
          return nameMatches || titleMatches;
        }).toList();
      }
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Game of Thrones', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black87,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: _searchController,
              onChanged: _filterCharacters,
              decoration: InputDecoration(
                hintText: 'Cari nama atau gelar...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: _searchController.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          _searchController.clear();
                          _filterCharacters('');
                        },
                      )
                    : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 0),
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder<List<GotCharacterModel>>(
              future: _charactersFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (snapshot.hasError) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.wifi_off, size: 64, color: Colors.grey),
                          const SizedBox(height: 16),
                          Text(
                            'Gagal memuat data:\n${snapshot.error}',
                            textAlign: TextAlign.center,
                            style: const TextStyle(color: Colors.grey),
                          ),
                          const SizedBox(height: 16),
                          ElevatedButton(
                            onPressed: _refreshData,
                            child: const Text('Coba Lagi'),
                          ),
                        ],
                      ),
                    ),
                  );
                }

                if (_filteredCharacters.isEmpty) {
                  return const Center(
                    child: Text('Karakter tidak ditemukan.'),
                  );
                }

                return RefreshIndicator(
                  onRefresh: () async => _refreshData(),
                  child: ListView.builder(
                    itemCount: _filteredCharacters.length,
                    itemBuilder: (context, index) {
                      final character = _filteredCharacters[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        elevation: 2,
                        child: ListTile(
                          contentPadding: const EdgeInsets.all(8),
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              character.imageUrl,
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) =>
                                  const Icon(Icons.person, size: 50),
                            ),
                          ),
                          title: Text(
                            character.fullName,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(character.title),
                          trailing: const Icon(Icons.chevron_right),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => GotDetailScreen(
                                  character: character,
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
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