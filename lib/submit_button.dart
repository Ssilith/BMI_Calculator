import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  final Function() onPressed;
  const SubmitButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 105,
      height: 38,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor:
                Theme.of(context).buttonTheme.colorScheme!.background),
        onPressed: onPressed,
        child: Text("Submit", style: Theme.of(context).textTheme.bodySmall),
      ),
    );
  }
}
