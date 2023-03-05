import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unsplash_api/constants/colors.dart';
import 'package:unsplash_api/constants/size_config.dart';
import 'package:unsplash_api/models/img.model.dart';

class ImageWidget extends StatelessWidget {
  ImgModel data;
  ImageWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: bgGrey,
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: const BoxDecoration(
                    color: grey,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image(
                    width: SizeConfig.swidth,
                    height: SizeConfig.sheight * 0.5,
                    image: NetworkImage(data.imgLink),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: SizeConfig.swidth * 0.6,
                        child: Text(data.desc,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(fontWeight: FontWeight.bold)),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          const Icon(
                            CupertinoIcons.heart_fill,
                            color: red,
                            size: 20,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(data.likes,
                              style: Theme.of(context).textTheme.bodySmall),
                        ],
                      )
                    ],
                  ),
                  ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(
                        CupertinoIcons.bookmark_fill,
                        size: 12,
                      ),
                      label: const Text("Save"))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
