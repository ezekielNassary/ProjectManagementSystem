import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../themes/color_scheme.dart';

class loading_container extends StatelessWidget {
  const loading_container({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        SpinKitThreeInOut(
          color: ThemeColor.primaryBlue,
          size: 30,
        ),
        SizedBox(
          height: 10,
        ),
        Text('loading...')
      ],
    );
  }
}
