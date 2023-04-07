import 'dart:async';

import 'package:image_picker/image_picker.dart';

class ImageUpload {
  final _imageController = StreamController<XFile>();
  Stream<XFile> get imageStream => _imageController.stream;

  void pickImage(ImageSource source) async {
    try {
      final ImagePicker picker = ImagePicker();
      final pickedFile = await picker.pickImage(
        source: source,
        imageQuality: 50,
      );

      if (pickedFile == null) return;
      final XFile file = XFile(pickedFile.path);

      _imageController.sink.add(file);
    } catch (e) {
      return;
    }
  }

  void dispose() {
    _imageController.close();
  }
}
