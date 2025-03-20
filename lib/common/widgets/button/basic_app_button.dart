import 'package:flutter/material.dart';

class BasicAppButton extends StatelessWidget {
  const BasicAppButton({
    required this.onPressed,
    this.title = '',
    this.height,
    this.width,
    this.content,
    super.key
  });

  final VoidCallback onPressed;
  final String title;
  final Widget ? content;
  final double ? height;
  final double ? width;
  

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed,
      style: FilledButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.primary,
        minimumSize: Size(
          width ?? MediaQuery.of(context).size.width,
          height ?? 56
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      child: content ?? Text(
        title,
        style: Theme.of(context).textTheme.bodyLarge,
        ),
    );
  }
}