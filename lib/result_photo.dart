import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ResultPhoto extends StatefulWidget {
  final double result;
  final bool male;
  const ResultPhoto({super.key, required this.result, required this.male});

  @override
  State<ResultPhoto> createState() => _ResultPhotoState();
}

class _ResultPhotoState extends State<ResultPhoto> {
  late BMICategory cat;

  @override
  void initState() {
    cat = determineBMICategory(widget.result, widget.male);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        cat.svgAsset,
        const SizedBox(height: 40),
        Text(cat.category, style: Theme.of(context).textTheme.bodySmall)
      ],
    );
  }
}

BMICategory determineBMICategory(double bmi, bool male) {
  if (bmi < 18.5) {
    return BMICategory(
        category: 'Underweight',
        svgAsset: SvgPicture.asset(
          male ? 'assets/underweight_male.svg' : 'assets/underweight.svg',
          height: 326,
          width: 127,
        ));
  } else if (bmi < 24.9) {
    return BMICategory(
        category: 'Normal',
        svgAsset: SvgPicture.asset(
          male ? 'assets/normal_male.svg' : 'assets/normal.svg',
          height: 326,
          width: 127,
        ));
  } else if (bmi < 29.9) {
    return BMICategory(
        category: 'Overweight',
        svgAsset: SvgPicture.asset(
          male ? 'assets/overweight_male.svg' : 'assets/overweight.svg',
          height: 326,
          width: 127,
        ));
  } else {
    return BMICategory(
        category: 'Obesity',
        svgAsset: SvgPicture.asset(
          male ? 'assets/obese_male.svg' : 'assets/obese.svg',
          height: 326,
          width: 127,
        ));
  }
}

class BMICategory {
  final String category;
  final SvgPicture svgAsset;

  BMICategory({required this.category, required this.svgAsset});
}
