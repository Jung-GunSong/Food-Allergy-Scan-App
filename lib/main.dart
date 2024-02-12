import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:food_allergy_detection_app/camera_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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

class FoodAllergyForm extends StatefulWidget {
  const FoodAllergyForm({super.key});

  @override
  // FoodAllergyFormState createState(){
  //   return FoodAllergyFormState();
  State<FoodAllergyForm> createState() => _FoodAllergyFormState();

}

class _FoodAllergyFormState extends State<FoodAllergyForm> {

  final _formKey = GlobalKey<FormState>();
  final myController = TextEditingController();

  @override
  void dispose(){
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField (
            controller: myController,
            validator: (value){
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16)
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()){
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Processing Data'))
                );
                showDialog(
                  context: context,
                  builder: (context){
                    return AlertDialog(
                      content: Text(myController.text),
                    );
                  }
                );
              }
            },
            child: const Text('Submit'),
          ),
           ElevatedButton(
              onPressed: () async {
                  await availableCameras().then((value) => Navigator.push(context,
                  MaterialPageRoute(builder: (_) => CameraPage(cameras: value, allergy:myController.text))));
                 },
              child: const Text('Take a picture')),
        ],
      ),
    );
  }
}