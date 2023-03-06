import 'dart:convert';

import 'package:http/http.dart';
import 'package:unsplash_api/constants/credential.dart';

class getUnsplashImages {
  Future getImages({required String value}) async {
    String imageUrl =
        "https://api.unsplash.com/search/photos?page=1&query=$value&client_id=$apiKey";

    Response res = await get(Uri.parse(imageUrl));

    Map jsonToMap = await jsonDecode(res.body);

    return jsonToMap;
  }
}
