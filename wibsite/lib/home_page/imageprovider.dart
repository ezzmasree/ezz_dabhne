import 'dart:typed_data';
import 'package:flutter/material.dart';

class ImageProviderModel with ChangeNotifier {
  Uint8List? _imageBytes;

  Uint8List? get imageBytes => _imageBytes;

  void setImage(Uint8List bytes) {
    _imageBytes = bytes;
    notifyListeners();
  }
}