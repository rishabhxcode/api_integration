import 'package:api_integration/getx_lib/Album/model/photo.dart';
import 'package:dio/dio.dart';

class PhotoService {
  Dio dioHttp = Dio();
  Future<List<Photo>> getPhotos() async {
    try {
      var response = await dioHttp
          .get('http://jsonplaceholder.typicode.com/photos?albumId=1');
      print(response.data);
      if (response.statusCode == 200) {
        return List.generate(response.data.length,
            (index) => Photo.fromJson(response.data[index]));
      }
    } on DioError {
      rethrow;
    }
    throw Exception('something went wrong');
  }
}
