import 'package:flutter/material.dart';

import '../../themes/color_scheme.dart';

class NoInternet extends StatelessWidget {
  final Function press;
  const NoInternet({
    required this.press,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Check your internet connection',
          style: TextStyle(
            fontSize: 13,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 5,
        ),
        GestureDetector(
          onTap: () {
            press();
          },
          child: const Text(
            'Retry',
            style: TextStyle(
                color: ThemeColor.primaryBlue,
                fontSize: 14,
                fontWeight: FontWeight.bold),
          ),
        )
      ],
    ));
  }
}
