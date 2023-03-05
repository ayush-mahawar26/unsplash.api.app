import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unsplash_api/cubit/homecubit/home.state.dart';
import 'package:unsplash_api/service/unsplash.api.dart';

class ImageLoadCubit extends Cubit<ImageState> {
  ImageLoadCubit() : super(ImageInitalState());

  Future getImagesResults({required String value}) async {
    emit(ImageLoadingState());

    try {
      Map imgData = await getUnsplashImages().getImages(value: value);
      emit(ImageLoadedState());
      return imgData["results"];
    } catch (e) {
      emit(ImageErrorState(error: "Error Occured"));
    }
  }
}
