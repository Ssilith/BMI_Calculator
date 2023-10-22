import 'package:flutter/material.dart';
import 'package:pim/input_container.dart';
import 'package:pim/main.dart';
import 'package:pim/result_photo.dart';
import 'package:pim/title_row.dart';

class ResultPage extends StatefulWidget {
  final double result;
  final bool male;
  const ResultPage({super.key, required this.result, required this.male});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
      height: size.height,
      color: Theme.of(context).colorScheme.secondary,
      child: Column(children: [
        const TitleRow(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 19.0),
          child: InkWell(
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const MyHomePage(),
                  ),
                );
              },
              child: Row(
                children: [
                  const Icon(
                    Icons.arrow_back,
                    color: Color(0xFFD9D9D9),
                  ),
                  const SizedBox(width: 5),
                  Text("Return", style: Theme.of(context).textTheme.bodyMedium),
                ],
              )),
        ),
        const SizedBox(height: 42),
        InputContainer(
          title: "Result",
          result: "${widget.result.toStringAsFixed(3)} kg/m2",
          readOnly: true,
        ),
        const Spacer(),
        ResultPhoto(result: widget.result, male: widget.male),
        const SizedBox(height: 51),
      ]),
    ));
  }
}
