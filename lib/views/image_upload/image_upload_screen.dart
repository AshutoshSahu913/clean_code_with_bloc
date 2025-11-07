import 'dart:io';

import 'package:clean_code_with_bloc/bloc/image_picker_bloc/image_picker_bloc.dart';
import 'package:clean_code_with_bloc/config/color/colors.dart';
import 'package:clean_code_with_bloc/views/counter/widgets/RoundedButtonWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImageUploadScreen extends StatefulWidget {
  const ImageUploadScreen({super.key});

  @override
  State<ImageUploadScreen> createState() => _ImageUploadScreenState();
}

class _ImageUploadScreenState extends State<ImageUploadScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appColor,
      appBar: AppBar(
        title: const Text("Image Upload"),
        backgroundColor: AppColors.appColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // BlocBuilder listens to ImagePickerBloc and rebuilds on state changes
            BlocBuilder<ImagePickerBloc, ImagePickerState>(
              builder: (context, state) {
                if (state.file == null) {
                  // No image selected yet
                  return InkWell(
                    onTap: () {
                      // Let’s say tapping on the circle opens camera
                      context.read<ImagePickerBloc>().add(CaptureImage());
                    },
                    child: const CircleAvatar(
                      radius: 100,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.camera_alt, color: AppColors.appColor,size: 40,
                      ),
                    ),
                  );
                } else {
                  // Image selected: show preview
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.file(
                      File(state.file!.path),
                      width: 200,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  );
                }
              },
            ),
            const SizedBox(height: 30),

            // Buttons Row
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RoundedButtonWidget(
                  buttonTxt: 'Pick from Gallery',
                  onPressed: () {
                    context.read<ImagePickerBloc>().add(OpenGallery());
                  },
                ),
                const SizedBox(width: 10),
                RoundedButtonWidget(
                  buttonTxt: 'Open Camera',
                  onPressed: () {
                    context.read<ImagePickerBloc>().add(CaptureImage());
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

