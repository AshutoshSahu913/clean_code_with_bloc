import 'package:flutter/material.dart';

class TextWidget extends StatefulWidget {
  final int count;

  const TextWidget({super.key, this.count = 0});

  @override
  State<TextWidget> createState() => _TextWidgetState();
}

class _TextWidgetState extends State<TextWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Text(
        widget.count.toString(),
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
      ),
    );
  }
}
