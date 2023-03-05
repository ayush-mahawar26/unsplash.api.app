abstract class ImageState {}

class ImageInitalState extends ImageState {}

class ImageLoadingState extends ImageState {}

class ImageLoadedState extends ImageState {}

class ImageErrorState extends ImageState {
  late String err;
  ImageErrorState({required String error});
}
