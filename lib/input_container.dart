import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputContainer extends StatelessWidget {
  final String title;
  final TextEditingController? controller;
  final TextInputFormatter? inputFormat;
  final bool readOnly;
  final String? result;
  const InputContainer(
      {super.key,
      required this.title,
      this.controller,
      this.inputFormat,
      this.readOnly = false,
      this.result});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Theme.of(context).textTheme.bodyMedium),
        SizedBox(
          width: 223,
          height: 29,
          child: TextField(
            controller:
                readOnly ? TextEditingController(text: result) : controller,
            inputFormatters: inputFormat != null ? [inputFormat!] : null,
            readOnly: readOnly,
            style: Theme.of(context).textTheme.displayMedium,
            textAlign: readOnly ? TextAlign.center : TextAlign.start,
            cursorColor: const Color(0xFF706C6C),
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
              filled: true,
              fillColor: const Color(0xFFD9D9D9),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
