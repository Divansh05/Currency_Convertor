import 'package:flutter/material.dart';

class CurrencyConvertorMaterialPagee extends StatefulWidget {
  const CurrencyConvertorMaterialPagee({super.key});
  @override
  State createState() => _CurrencyConvertorMaterialPageState();
}

class _CurrencyConvertorMaterialPageState extends State {
  String result = "0.0";
  final TextEditingController textEditingController = TextEditingController();

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.black,
        width: 2.0,
        style: BorderStyle.solid,
      ),
      borderRadius: BorderRadius.all(Radius.circular(40)),
    );

    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        elevation: 0,
        title: const Text(
          'Currency Convertor',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "INR ${double.parse(result) != 0 ? ((double.parse(result)).toStringAsFixed(2)) : (double.parse(result)).toStringAsFixed(0)}",
              style: const TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 255, 255, 255)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                controller: textEditingController,
                style: const TextStyle(
                  color: Colors.black,
                ),
                decoration: const InputDecoration(
                  hintText: 'Please enter the amount in USD',
                  hintStyle: TextStyle(
                    color: Colors.black,
                  ),
                  prefixIcon: Icon(Icons.monetization_on_outlined),
                  prefixIconColor: Colors.black,
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: border,
                  enabledBorder: border,
                ),
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (textEditingController.text == "") {
                      result = "0.0";
                      textEditingController.text = "0";
                    } else {
                      result = (double.parse(textEditingController.text) * 80)
                          .toString();
                    }
                  });
                },
                style: ElevatedButton.styleFrom(
                  elevation: (15),
                  backgroundColor: (Colors.green),
                  foregroundColor: (Colors.white),
                  fixedSize: const Size(200, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text('Convert'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
