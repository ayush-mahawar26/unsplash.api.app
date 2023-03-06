import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unsplash_api/cubit/img.state.dart';
import 'package:unsplash_api/service/unsplash.api.dart';

class ImageCubit extends Cubit<ImageState> {
  ImageCubit() : super(ImageInitialState()) {
    getImageData(value: "people");
  }

  getImageData({required String value}) async {
    emit(ImageLoadingState());

    try {
      Map jsonResults = await getUnsplashImages().getImages(value: value);
      emit(ImageLoadedState(jsonResults["results"]));
      return jsonResults;
    } catch (e) {
      emit(ImageErrorState("Error Occured"));
    }
  }
}
