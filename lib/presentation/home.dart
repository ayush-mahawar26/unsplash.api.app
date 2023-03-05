import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unsplash_api/constants/colors.dart';
import 'package:unsplash_api/constants/size_config.dart';
import 'package:unsplash_api/cubit/homecubit/home.cubit.dart';
import 'package:unsplash_api/cubit/homecubit/home.state.dart';
import 'package:unsplash_api/models/img.model.dart';
import 'package:unsplash_api/presentation/widget/image.widget.dart';

class HomeScr extends StatefulWidget {
  HomeScr({super.key});

  @override
  State<HomeScr> createState() => _HomeScrState();
}

class _HomeScrState extends State<HomeScr> {
  final TextEditingController searchController = TextEditingController();
  late List results;

  List<ImgModel> resultsList = [];

  getResult({required String value}) async {
    results = await ImageLoadCubit().getImagesResults(value: value);
    for (Map i in results) {
      String? desc = i["description"];
      resultsList.add(ImgModel(i['urls']["raw"],
          (desc != null) ? desc : i["alt_description"], i["likes"].toString()));
    }
  }

  @override
  void initState() {
    getResult(value: "people");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("UnSplash"),
        centerTitle: true,
        backgroundColor: black,
      ),
      body: BlocBuilder<ImageLoadCubit, ImageState>(
        builder: (context, state) {
          if (state is ImageLoadingState) {
            return const Center(
              child: CircularProgressIndicator(
                color: black,
              ),
            );
          } else if (state is ImageErrorState) {
            return Center(
              child: Text(state.err),
            );
          }

          return Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: searchController,
                  cursorColor: black,
                  decoration: InputDecoration(
                      suffixIcon: InkWell(
                        onTap: () => {if (searchController.text != "") {}},
                        child: const Icon(
                          Icons.search,
                          color: grey,
                        ),
                      ),
                      hintText: "Search Image",
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(color: black, width: 3),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: black, width: 2),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: black, width: 2),
                      )),
                ),
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: resultsList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ImageWidget(
                        data: resultsList[index],
                      );
                    }),
              )
            ],
          );
        },
      ),
    );
  }
}
