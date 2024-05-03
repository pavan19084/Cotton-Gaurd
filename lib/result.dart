import 'package:flutter/material.dart';
import 'package:sgp/resultdialog.dart';

void showResultDialog(
    BuildContext context, String result, String accuracy, String imagePath) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Center(
        child: ResultDialog(
          title: result,
          description: 'Accuracy: $accuracy',
          imagePath: imagePath,
          onTap: () {
            Navigator.pop(context);
          },
        ),
      );
    },
  );
}