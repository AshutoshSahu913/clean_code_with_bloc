import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:clean_code_with_bloc/utils/image_picker_utils.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

part 'image_picker_event.dart';
part 'image_picker_state.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerState> {
  final ImagePicker _picker = ImagePicker();
  final ImagePickerUtils imagePickerUtils;

  ImagePickerBloc(this.imagePickerUtils) : super(const ImagePickerState()) {
    on<CaptureImage>(_onCaptureImage);
    on<OpenGallery>(_onOpenGallery);
  }

  Future<void> _onCaptureImage(
    CaptureImage event,
    Emitter<ImagePickerState> emit,
  ) async {
    PermissionStatus status;
    // Handle result
    if (Platform.isAndroid) {
      // For Android 13 (Tiramisu) and above
      if (Platform.version.contains("33") || Platform.version.contains("34")) {
        status = await Permission.photos.request();
      } else {
        // For Android 12 and below
        status = await Permission.storage.request();
      }
    } else {
      // iOS
      status = await Permission.photos.request();
    }

    if (status.isGranted) {
      final XFile? pickedFile = await _picker.pickImage(
        source: ImageSource.camera,
      );
      if (pickedFile != null) {
        emit(state.copyWith(file: pickedFile));
      }
    } else {
      print("Permission not granted");
    }
  }

  Future<void> _onOpenGallery(
    OpenGallery event,
    Emitter<ImagePickerState> emit,
  ) async {
    PermissionStatus status;
    // Handle result
    if (Platform.isAndroid) {
      // For Android 13 (Tiramisu) and above
      if (Platform.version.contains("33") || Platform.version.contains("34")) {
        status = await Permission.photos.request();
      } else {
        // For Android 12 and below
        status = await Permission.storage.request();
      }
    } else {
      // iOS
      status = await Permission.photos.request();
    }
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      emit(state.copyWith(file: pickedFile));
    }
  }
}
