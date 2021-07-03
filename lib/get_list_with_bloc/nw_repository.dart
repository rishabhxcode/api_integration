import 'package:api_integration/get_list_with_bloc/model.dart';
import 'package:dio/dio.dart';

const GET_POSTS = 'https://jsonplaceholder.typicode.com/posts?userId={page}';

class NwRepository {
  Dio dio = Dio();
  Future<List<Post>> getPosts(int page) async {
    try {
      var response = await dio.get(GET_POSTS.replaceFirst('{page}', '$page'));
      if (response.statusCode == 200) {
        return List.generate(response.data.length,
            (index) => Post.fromJson(response.data[index]));
      }
    } on DioError catch (e) {
      print(e);
      rethrow;
    }
    throw Exception('something went wrong!');
  }
}
