import 'package:flutter/material.dart';
import 'package:whatsapp_clone/color.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onpressed;
  const CustomButton({
    Key? key,
    required this.text,
    required this.onpressed,
  }) :super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(
        text,
        style: const TextStyle(color: blackColor),
      ),
      onPressed: onpressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: tabColor,
        minimumSize: const Size(double.infinity, 50),
      ),
    );
  }
}
