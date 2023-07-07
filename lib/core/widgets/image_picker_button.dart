import 'dart:io';
import 'package:flutter/material.dart';
import 'package:plusvalia/core/theme/app_colors.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerButton extends StatelessWidget {
  const ImagePickerButton({
    super.key,
    this.image,
    required this.onImagePicked,
  });

  final File? image;
  final Function(File image) onImagePicked;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        ImagePicker _picker = ImagePicker();
        try {
          final XFile? image =
              await _picker.pickImage(source: ImageSource.gallery);
          if (image != null) {
            onImagePicked(File(image.path));
          }
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              padding: EdgeInsets.all(10.0),
              backgroundColor: AppColors.red,
              content: Text(
                'Fail to pick image, review app permission',
                style: TextStyle(
                  color: AppColors.whiteSolid,
                ),
              ),
            ),
          );
        }
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 120,
            width: 120,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.gainsBoro,
            ),
            child: image == null
                ? Center(
                    child: Icon(
                      Icons.camera_alt,
                      size: 30.0,
                      color: AppColors.independence,
                    ),
                  )
                : CircleAvatar(
                    backgroundColor: Colors.transparent,
                    backgroundImage: FileImage(image!),
                  ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 98, left: 68),
            child: CircleAvatar(
              radius: 15,
              backgroundColor: AppColors.black,
              child: Center(
                child: Icon(
                  Icons.edit,
                  color: AppColors.whiteSolid,
                  size: 20,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
