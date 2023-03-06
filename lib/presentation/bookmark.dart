import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:unsplash_api/constants/colors.dart';
import 'package:unsplash_api/models/img.model.dart';
import 'package:unsplash_api/presentation/widget/image.widget.dart';

class BookmarkPage extends StatelessWidget {
  const BookmarkPage({super.key});

  static List<ImgModel> bookmarkImage = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BookMarks"),
        centerTitle: true,
        backgroundColor: black,
      ),
      body: ListView.builder(
        itemCount: bookmarkImage.length,
        itemBuilder: (context, index) {
          return ImageWidget(data: bookmarkImage[index]);
        },
      ),
    );
  }
}
