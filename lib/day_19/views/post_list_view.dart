import 'package:flutter/material.dart';
import 'package:tugas/day_19/models/post_models.dart';
import 'package:tugas/day_19/services/api_services.dart';
import 'package:tugas/day_19/services/dio_client.dart';

class PostListScreenDay32 extends StatefulWidget {
  const PostListScreenDay32({super.key});

  @override
  State<PostListScreenDay32> createState() => _PostListScreenDay32State();
}

class _PostListScreenDay32State extends State<PostListScreenDay32> {
  late final ApiService _apiService;
  late Future<List<PostModels>> _postsFuture;

  @override
  void initState() {
    super.initState();

    final dio = createDioClient();
    _apiService = ApiService(dio);
    _postsFuture = _apiService.getAllPosts();
  }

  void _refreshPosts() {
    setState(() {
      _postsFuture = _apiService.getAllPosts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'API',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: FutureBuilder<List<PostModels>>(
        future: _postsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.wifi_off,
                      size: 64,
                      color: Colors.grey,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Gagal memuat data:\n${snapshot.error}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: _refreshPosts,
                      child: const Text('Coba Lagi'),
                    ),
                  ],
                ),
              ),
            );
          }

          final posts = snapshot.data ?? const <PostModels>[];

          if (posts.isEmpty) {
            return const Center(
              child: Text('Tidak ada data post.'),
            );
          }

          return ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context, index) {
              final post = posts[index];

              return Card(
                margin: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    child: Text(
                      '${post.id}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  title: Text(
                    post.title ?? '',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  subtitle: Text(
                    post.body ?? '',
                    maxLines: 2,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}