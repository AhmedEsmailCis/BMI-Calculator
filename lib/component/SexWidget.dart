import 'package:flutter/material.dart';

import 'constant.dart';

class SexWidget extends StatelessWidget {
  final String sexType;
  final IconData sexIcon;
  SexWidget({@required this.sexIcon, @required this.sexType});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          sexIcon,
          size: 80,
        ),
        SizedBox(height: 15),
        Text(
          sexType,
          style: labelTextStyle,
        )
      ],
    );
  }
}
