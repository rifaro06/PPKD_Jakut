import 'package:dio/dio.dart';
import '../models/got_model.dart';

class ApiService {
  final Dio _dio;

  ApiService(this._dio);

  Future<List<GotCharacterModel>> getCharacters() async {
    try {
      final response = await _dio.get('/Characters');
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        return data.map((json) => GotCharacterModel.fromJson(json)).toList();
      } else {
        throw Exception('Gagal memuat data dari server');
      }
    } catch (e) {
      rethrow;
    }
  }
}