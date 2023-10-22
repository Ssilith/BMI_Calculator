import 'package:floating_snackbar/floating_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pim/input_container.dart';
import 'package:pim/result_page.dart';
import 'package:pim/sex_choice.dart';
import 'package:pim/submit_button.dart';
import 'package:pim/title_row.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: const ColorScheme.light(secondary: Color(0xFF43928A)),
        buttonTheme: const ButtonThemeData(
            colorScheme: ColorScheme.light(
                background: Color(0xFFFE902A), surface: Color(0xFFFE902A))),
        textTheme: const TextTheme(
            bodySmall: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
            bodyMedium: TextStyle(
                color: Color(0xFFD9D9D9),
                fontSize: 15,
                fontWeight: FontWeight.w600),
            bodyLarge: TextStyle(
                color: Color(0xFFD9D9D9),
                fontSize: 20,
                fontWeight: FontWeight.w600),
            displayMedium: TextStyle(
                color: Color(0xFF706C6C),
                fontSize: 15,
                fontWeight: FontWeight.w600)),
        useMaterial3: true,
        fontFamily: "Inter",
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController weight = TextEditingController();
  TextEditingController height = TextEditingController();
  TextEditingController age = TextEditingController();
  bool male = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          height: size.height,
          color: Theme.of(context).colorScheme.secondary,
          child: Column(
            children: [
              const TitleRow(),
              const SizedBox(height: 68),
              InputContainer(
                title: "Weight",
                controller: weight,
                inputFormat: FilteringTextInputFormatter.allow(
                    RegExp(r'^\d*([,]\d*)?$')),
              ),
              const SizedBox(height: 15),
              InputContainer(
                title: "Height",
                controller: height,
                inputFormat: FilteringTextInputFormatter.allow(
                    RegExp(r'^\d*([,]\d*)?$')),
              ),
              const SizedBox(height: 15),
              InputContainer(
                title: "Age",
                controller: age,
                inputFormat:
                    FilteringTextInputFormatter.allow(RegExp(r'^[1-9][0-9]*$')),
              ),
              const SizedBox(height: 33),
              SexChoice(
                  male: male,
                  onSexChanged: (value) {
                    setState(() {
                      male = value;
                    });
                  }),
              const Spacer(),
              SubmitButton(
                onPressed: () {
                  if (age.text.isEmpty ||
                      height.text.isEmpty ||
                      weight.text.isEmpty) {
                    FloatingSnackBar(
                      message: 'Field is empty',
                      context: context,
                      textColor: Colors.white,
                      duration: const Duration(milliseconds: 4000),
                      backgroundColor: const Color.fromARGB(255, 44, 41, 41),
                    );
                    return;
                  }
                  double result = calculateBMI(weight, height);
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => ResultPage(
                        result: result,
                        male: male,
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 40),
            ],
          ),
        ));
  }
}

double calculateBMI(
    TextEditingController weight, TextEditingController height) {
  try {
    if (weight.text.isEmpty || height.text.isEmpty) {
      return 0.0;
    }

    double h = double.parse(height.text.replaceAll(',', '.'));
    if (h > 9 && !height.text.contains(',')) h /= 100;

    double w = double.parse(weight.text.replaceAll(',', '.'));

    return w / (h * h);
  } catch (e) {
    return 0.0;
  }
}
