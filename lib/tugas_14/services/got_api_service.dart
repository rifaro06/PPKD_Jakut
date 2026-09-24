import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../models/got_model.dart';

part 'got_api_service.g.dart';

@RestApi(baseUrl: 'https://thronesapi.com/api/v2')
abstract class GotApiService {
  factory GotApiService(Dio dio, {String baseUrl}) = _GotApiService;

  @GET('/Characters')
  Future<List<GotCharacterModel>> fetchGotCharacters();
}