import 'package:flutter/material.dart';

class SexChoice extends StatefulWidget {
  final bool male;
  final ValueChanged<bool> onSexChanged;
  const SexChoice({super.key, required this.male, required this.onSexChanged});

  @override
  State<SexChoice> createState() => _SexChoiceState();
}

class _SexChoiceState extends State<SexChoice> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 225,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Sex", style: Theme.of(context).textTheme.bodyMedium),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    widget.onSexChanged(true);
                  });
                },
                child: Text(
                  "Male",
                  style: TextStyle(
                      color: widget.male
                          ? const Color(0xFFD9D9D9)
                          : const Color(0xFF706C6C),
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
              ),
              InkWell(
                  onTap: () {
                    setState(() {
                      widget.onSexChanged(false);
                    });
                  },
                  child: Text("Female",
                      style: TextStyle(
                          color: !widget.male
                              ? const Color(0xFFD9D9D9)
                              : const Color(0xFF706C6C),
                          fontSize: 15,
                          fontWeight: FontWeight.w600))),
            ],
          )
        ],
      ),
    );
  }
}
