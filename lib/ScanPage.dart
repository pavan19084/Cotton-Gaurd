// ignore_for_file: sized_box_for_whitespace, file_names
import "dart:io";
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sgp/result.dart';
import 'package:tflite/tflite.dart';

class ScanPage extends StatefulWidget {
  final String language;

  const ScanPage({Key? key, required this.language}) : super(key: key);

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  List _output = [];
  File? _image;

  // ignore: non_constant_identifier_names
  detect_image(File image) async {
    String result;
    String accuracy;

    var pred = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 4,
      threshold: 0.8,
      imageStd: 127.5,
      imageMean: 127.5,
    );

    setState(() {
      _output = pred ?? [];
    });

    if (_output[0] == Null) {
      result = "Plese select cotton leaf";
      accuracy = "0 %";
    } else {
      result = _output[0]['label'].toString().substring(2);
      accuracy = (_output[0]['confidence'] * 100).toStringAsFixed(0) + '%';
    }

    // ignore: use_build_context_synchronously
    showResultDialog(context, result, accuracy, image.path);
  }

  @override
  void initState() {
    super.initState();
    loadmodel();
  }

  loadmodel() async {
    await Tflite.loadModel(
      model: "assets/model_unquant.tflite",
      labels: "assets/labels.txt",
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  final ImagePicker _imagePicker = ImagePicker();

  _gallery(BuildContext context) async {
    var image = await _imagePicker.pickImage(source: ImageSource.gallery);
    if (image == null) {
      return null;
    } else {
      _image = File(image.path);
    }
    detect_image(_image!);
  }

  _camera(BuildContext context) async {
    var image = await _imagePicker.pickImage(source: ImageSource.camera);
    if (image == null) {
      return null;
    } else {
      _image = File(image.path);
    }
    detect_image(_image!);
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "CottonGuard",
          style: GoogleFonts.roboto(),
        ),
      ),
      body: Container(
        height: h,
        width: w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 25),
            SizedBox(
              height: 200,
              width: 200,
              child: Image.asset("assets/cotton-removebg-preview.png"),
            ),
            const SizedBox(height: 25),
            Text(
              widget.language == 'eng'
                  ? "Please upload or click the photo"
                  : "કૃપા કરીને ફોટો અપલોડ કરો અથવા ક્લિક કરો",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              height: 70,
              padding: const EdgeInsets.all(10),
              child: ElevatedButton(
                onPressed: () => _camera(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  widget.language == 'eng' ? "Camera" : "કેમેરા",
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 70,
              padding: const EdgeInsets.all(10),
              child: ElevatedButton(
                onPressed: () => _gallery(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  widget.language == 'eng' ? "Gallery" : "ગેલેરી",
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
