import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:food_allergy_detection_app/camera_page.dart';

//Form that stores allergy and passes it to the camera page
class FoodAllergyForm extends StatefulWidget {
  const FoodAllergyForm({super.key});

  @override
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
    //form to input food allergy
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
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
          // button to input allergy
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()){
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Processing Data'))
                );
                //shows message that allergy is saved
                showDialog(
                  context: context,
                  builder: (context){
                    return AlertDialog(
                      content: Text('Selected Food Allergent is ${myController.text}'),
                    );
                  }
                );
              }
            },
            child: const Text('Submit Food Allergy'),
          ),

          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16)
          ),
          // button to start taking a photo with the camera
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