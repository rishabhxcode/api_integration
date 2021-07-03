import 'package:api_integration/getx_lib/Album/controller/photo_controller.dart';
import 'package:api_integration/getx_lib/Album/model/photo.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:get/instance_manager.dart';

class PhotoListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('List')),
      body: PhotoListView(),
    );
  }
}

// ignore: must_be_immutable
class PhotoListView extends GetView<PhotoController> {
  PhotoController photoController = Get.put(PhotoController());
  Widget build(BuildContext context) {
    return Obx(() {
      if (photoController.isLoading.value) {
        return Center(child: CircularProgressIndicator());
      }
      return ListView.builder(
          itemCount: photoController.photoList.length,
          itemBuilder: (context, index) {
            return PhotoListItem(
              photo: photoController.photoList[index],
            );
          });
    });
  }
}

class PhotoListItem extends StatelessWidget {
  final Photo photo;

  const PhotoListItem({Key? key, required this.photo}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Text('${photo.title}'),
          Divider(height: 10),
          Text('${photo.thumbnailUrl}')
        ],
      ),
    );
  }
}
