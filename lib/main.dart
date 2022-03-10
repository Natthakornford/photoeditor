// ignore_for_file: unused_local_variable

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:imgly_sdk/imgly_sdk.dart';
import 'package:photo_editor_sdk/photo_editor_sdk.dart';

void main() {
  runApp(MyApp());
}

/// The example application of the photo_editor_sdk plugin.
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Configuration createConfiguration() {
    final flutterSticker = Sticker(
        "example_sticker_logos_flutter", "Flutter", "assets/2.png");
    final imglySticker = Sticker(
        "example_sticker_logos_imgly", "", "assets/3.png",
        );

    final thai = Sticker(
      "thaishirt",
      "",
      "assets/1.png",
      
      
    );
    
    /// A completely custom category.
    final logos = StickerCategory(
        "example_sticker_category_logos", "Logos", "assets/Flutter-logo.png",
        items: [flutterSticker, imglySticker, thai]);

    /// A predefined category.
    final emoticons =
        StickerCategory.existing("imgly_sticker_category_emoticons");

    /// A customized predefined category.
    final shapes =
        StickerCategory.existing("imgly_sticker_category_shapes", items: [
      Sticker.existing("imgly_sticker_shapes_badge_01"),
      Sticker.existing("imgly_sticker_shapes_arrow_02")
    ]);
    final categories = <StickerCategory>[logos, emoticons, shapes];
    final configuration = Configuration(
        sticker:
            StickerOptions(personalStickers: true, categories: categories));
    return configuration;
  }
  @override
  void initState() {
    super.initState();
  }

  void presentEditor(source) async {
    final result = await PESDK.openEditor(
      image: source.path,
      configuration: createConfiguration(),
    );
    PESDK.unlockWithLicense(("./pesdk_license"));

    print(result?.toJson());
  }

  File? image;
  Future selectImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      final imageTemporary = File(image.path);
      setState(() => this.image = imageTemporary);
      presentEditor(imageTemporary);
    } on PlatformException catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text('Photoeditor'),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return ListTile(
              title: Text("เลือกรูป"),
              subtitle: Text("Click to edit a sample image."),
              //onTap: presentEditor,
              onTap: () {
                selectImage(ImageSource.gallery);
              },
            );
          },
          itemCount: 1,
        ),
      ),
    );
  }
}
