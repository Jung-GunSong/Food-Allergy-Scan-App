import 'package:flutter/material.dart';
import 'package:food_allergy_detection_app/food_allergy_form.dart';

void main() {
  runApp(const MyApp());
}

//Root widget of this app
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Allergy Scan App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 83, 183, 213)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Food Allergy Scan App'),
    );
  }
}

//Homepage that includes the food allergy form
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: const Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Please enter the food that you are allergic to:',
            ),
            FoodAllergyForm(),
          ],
        ),
      ),
    );
  }
}

