import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeSvg extends StatelessWidget {
  const HomeSvg({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SizedBox(
        height: size.height * 0.4,
        child: SvgPicture.asset(
          "assets/images/form_svg.svg",
        ),
      ),
    );
  }
}
