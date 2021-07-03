import 'package:api_integration/getx_lib/Album/model/photo.dart';
import 'package:api_integration/getx_lib/services/photo_service.dart';
import 'package:get/get.dart';

class PhotoController extends GetxController {
  RxBool isLoading = true.obs;
  var photoList = <Photo>[].obs;
  PhotoService photoService = PhotoService();
  @override
  void onInit() {
    getPhotos();
    super.onInit();
  }

  Future getPhotos() async {
    try {
      isLoading(true);
      var data = await photoService.getPhotos();
      print(data);
      photoList.value = data;
      isLoading(false);
      return data;
    } catch (e) {
      rethrow;
    }
  }
}
