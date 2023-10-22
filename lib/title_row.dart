import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TitleRow extends StatelessWidget {
  const TitleRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 19.0, right: 19.0, top: 9.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("BMI Calculator", style: Theme.of(context).textTheme.bodyLarge),
          SvgPicture.asset(
            'assets/logo.svg',
            height: 63,
            width: 54,
          ),
        ],
      ),
    );
  }
}
