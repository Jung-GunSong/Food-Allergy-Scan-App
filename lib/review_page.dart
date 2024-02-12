import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:logger/logger.dart';

var logger = Logger(
  printer: PrettyPrinter(),
);

class PreviewPage extends StatelessWidget {
  const PreviewPage({Key? key, required this.picture, required this.text}) : super(key: key);

  final XFile picture;

  final String text;

  @override
  Widget build(BuildContext context) {

    logger.d('text');

    return Scaffold(
      appBar: AppBar(title: const Text('Results')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
          Image.file(File(picture.path), fit: BoxFit.cover, width: 250),
          const SizedBox(height: 24),
          Text(picture.name),
          Outcome(text:text),
        ],),
      ),
    );
  }

}

class Outcome extends StatelessWidget {
  const Outcome({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    if (text == ''){
      return Text('No Matches');
    }
    return Text(text);
  }
}
