import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  var wt_controller = TextEditingController();
  var ht_controller = TextEditingController();
  var bmi = "";
  var comment = "";
  @override
  void dispose() {
    wt_controller.dispose();
    ht_controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 233, 109, 255),
        title: Text('BMI'),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Colors.white,
            Color.fromARGB(255, 234, 114, 255),
          ])),
          child: Column(
            children: [
              SizedBox(height: 150),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: TextField(
                  controller: wt_controller,
                  decoration: InputDecoration(
                    label: Text('Weight'),
                    hintText: 'Enter your weight in kg',
                    prefixIcon: Icon(Icons.line_weight_outlined),
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  controller: ht_controller,
                  decoration: InputDecoration(
                    label: Text('Height'),
                    hintText: 'Enter your height in inches',
                    prefixIcon: Icon(Icons.height),
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                padding: EdgeInsets.all(10), // Add padding here
                child: Card(
                  elevation: 5,
                  child: InkWell(
                    onTap: () {
                      var weight = wt_controller.text.toString();
                      var height = ht_controller.text.toString();
                      if (weight.isNotEmpty && height.isNotEmpty) {
                        double weightValue = double.parse(weight);
                        double heightValue = double.parse(height);
                        heightValue = heightValue * 0.3048;
                        double bmiValue =
                            weightValue / (heightValue * heightValue);
                        setState(() {
                          bmi = 'Your BMI: ${bmiValue.toStringAsFixed(3)}';
                          if (bmiValue <= 18.5) {
                            comment = '⚠️ Underweight! 🍔🍟';
                          } else if (bmiValue <= 24.9) {
                            comment = '👍 Normal weight! Stay healthy!';
                          } else if (bmiValue <= 29.9) {
                            comment = '⚠️ Overweight! 🏋️‍♀️🥦';
                          } else {
                            comment = '🚨 Obesity! Consult a doctor!';
                          }
                        });
                      } else {
                        setState(() {
                          bmi = 'Give Correct Credentials';
                          comment = "⚠️";
                        });
                      }
                    },
                    child: Padding(
                      padding: EdgeInsets.all(
                          10), // Add additional padding for the text
                      child: Text(
                        'Calculate',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: 250,
                child: Card(
                  elevation: 5,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Container(
                      child: Text(bmi, style: TextStyle(fontSize: 16)),
                    ),
                  ),
                ),
              ),
              Container(
                width: 250,
                child: Card(
                  elevation: 5,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Container(
                      child: Text(comment,
                          style: TextStyle(fontSize: 16, fontFamily: 'My4')),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
