import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'dart:io';
// import 'package:logger/logger.dart';

// var logger = Logger(
//   printer: PrettyPrinter(),
// );

//Page to display results of the scan
class ReviewPage extends StatelessWidget {
  const ReviewPage({Key? key, required this.picture, required this.text, required this.allergy}) : super(key: key);

  final XFile picture;
  final String text;
  final String allergy;

  @override
  Widget build(BuildContext context) {

    // logger.d(allergy);

    return Scaffold(
      appBar: AppBar(title: const Text('Results')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
          Image.file(File(picture.path), fit: BoxFit.cover, width: 250),
          const SizedBox(height: 24),
          Text(picture.name),
          Outcome(text:text, match: allergy),
        ],),
      ),
    );
  }

}
//determines if match occurred between words on image and listed allergy
class Outcome extends StatelessWidget {
  const Outcome({Key? key, required this.text, required this.match}) : super(key: key);
  final String text;
  final String match;

  @override
  Widget build(BuildContext context) {
    if (text != match){
      return Text('No Matches');
    }
    return Text('Found $match');
  }
}
