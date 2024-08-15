import 'package:dio/dio.dart';

class ApiService {
  final Dio dio = Dio();

  Future<Response> post(
      {required body,
      required String url,
       String? token,
      String? contentType,
      Map<String, String>? headers,
      }) async {
    var response = await dio.post(
      url,
      data: body,
      options: token != null ? Options(
        contentType:  Headers.formUrlEncodedContentType,
        headers: headers ??  {
          'Authorization': 'Bearer $token',
        },
      ) : null,
    );
    return response;
  }
}
