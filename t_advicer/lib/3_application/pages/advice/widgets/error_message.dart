import 'package:flutter/material.dart';

class ErrrorMessage extends StatelessWidget {
  final String message;
  const ErrrorMessage({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    final themedata = Theme.of(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.error,
          size: 40,
          color: Colors.redAccent,
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          message,
          style: themedata.textTheme.bodyMedium,
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
