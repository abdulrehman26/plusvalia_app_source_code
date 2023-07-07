import 'dart:io';
import 'package:flutter/material.dart';

class UserProfilePhotoProvider extends ChangeNotifier {
  File? profilePhoto;
  void updateProfilePhoto({required File photo}) {
    profilePhoto = photo;
    notifyListeners();
  }
}
