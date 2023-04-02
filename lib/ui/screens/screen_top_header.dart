import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ScreenTopHeader extends StatelessWidget {
  const ScreenTopHeader({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset(
          "assets/top_header.svg",
          fit: BoxFit.contain,
          width: double.infinity,
          height: 200,
        ),
        child
      ],
    );
  }
}
