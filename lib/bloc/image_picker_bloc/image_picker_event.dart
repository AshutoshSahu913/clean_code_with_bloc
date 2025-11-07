part of 'image_picker_bloc.dart';

abstract class ImagePickerEvent extends Equatable {
  const ImagePickerEvent();

  @override
  List<Object?> get props => [];
}

class CaptureImage extends ImagePickerEvent {}

class OpenGallery extends ImagePickerEvent {}
