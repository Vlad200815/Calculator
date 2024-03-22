import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final void Function()? onTaped;
  final String text;
  final Color? color;
  final double? size;
  final Color? background;

  const MyButton({
    super.key,
    required this.onTaped,
    required this.text,
    required this.color,
    required this.size,
    required this.background,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(90),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: MaterialButton(
          color: background,
          onPressed: onTaped,
          child: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: color,
              fontSize: size,
            ),
          ),
        ),
      ),
    );
  }
}
