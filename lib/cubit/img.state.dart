import 'package:unsplash_api/models/img.model.dart';

abstract class ImageState {}

class ImageInitialState extends ImageState {}

class ImageLoadedState extends ImageState {
  List results;
  List<ImgModel> imgData = [];
  ImageLoadedState(this.results) {
    for (Map i in results) {
      String? alt = i["alt_description"];
      imgData.add(ImgModel(i["urls"]["raw"],
          (alt != null) ? alt : i["description"].toString(),
          i["likes"].toString()));
    }
  }
}

class ImageLoadingState extends ImageState {}

class ImageErrorState extends ImageState {
  String err;
  ImageErrorState(this.err);
}
