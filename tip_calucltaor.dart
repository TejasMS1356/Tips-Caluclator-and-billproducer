import 'package:flutter/material.dart';

class TipCalucltaor extends StatefulWidget {
  const TipCalucltaor({super.key});
  @override
  State<TipCalucltaor> createState() => _TipCalucltaor();
}

class _TipCalucltaor extends State<TipCalucltaor> {
  double total = 0;
  double per = 0;
  double amt = 0;
  double percen = 0;
  final TextEditingController billController = TextEditingController();
  final TextEditingController percentageController = TextEditingController();

  void calculateTip() {
    double? amtValue = double.tryParse(billController.text);
    double? perValue = double.tryParse(percentageController.text);

    if (amtValue != null && perValue != null) {
      setState(() {
        amt = amtValue; // Update the amt variable
        total = amtValue + (amtValue * perValue / 100);
        percen = amtValue * perValue / 100;
      });
    } else {
      setState(() {
        total = 0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 95, 108, 122),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 129, 178, 227),
        title: Text(
          "Tips Caluclator",
          style: TextStyle(
            // backgroundColor: Color.fromARGB(235, 237, 233, 233),
            color: Color.fromARGB(234, 28, 61, 61),
            fontSize: 45,
            fontFamily: 'TimesNewRoman',
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: Icon(Icons.payment),
      ),
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Total Amount : $total",
              style: TextStyle(
                color: Color.fromARGB(255, 247, 245, 245),
                fontSize: 45,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Tips Amount : $percen",
              style: TextStyle(
                color: Color.fromARGB(255, 247, 245, 245),
                fontSize: 45,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),

              child: TextField(
                controller: billController,
                decoration: InputDecoration(
                  filled: true, // Enables background color
                  fillColor: Colors.blue[100],
                  hintText: 'Enter the Bill',

                  hintStyle: TextStyle(color: Color.fromARGB(255, 17, 16, 16)),
                  prefixIcon: Icon(Icons.currency_rupee_sharp),
                  prefixIconColor: Color.fromARGB(249, 173, 45, 212),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(60)),
                  ),
                ),

                keyboardType: TextInputType.numberWithOptions(decimal: true),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),

              child: TextField(
                controller: percentageController,
                decoration: InputDecoration(
                  filled: true, // Enables background color
                  fillColor: Colors.blue[100],
                  hintText:
                      'Enter the percentage of tips you are going to give',

                  hintStyle: TextStyle(color: Color.fromARGB(255, 17, 16, 16)),
                  prefixIcon: Icon(Icons.percent),
                  prefixIconColor: Color.fromARGB(249, 173, 45, 212),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(60)),
                  ),
                ),

                keyboardType: TextInputType.numberWithOptions(decimal: true),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: ElevatedButton(
                onPressed: calculateTip,
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                  textStyle: TextStyle(
                    fontSize: 18,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
                child: Text(
                  'Calculate Tip',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Text(
              "         BILL:\n------------------------\nAmount:     ${amt.toStringAsFixed(2)}\nTips:           $percen \n-------------------------\nTotal amount:$total",
              style: TextStyle(
                color: Color.fromARGB(255, 16, 16, 16),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
