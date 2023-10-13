import 'package:flutter/material.dart';
import 'package:sang/features/home/components/home_grid_view.dart';
import 'package:sang/features/home/components/home_svg.dart';
import 'package:sang/res/constants/app_colors.dart';
import 'package:sang/res/constants/app_sizes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        shadowColor: AppColors.kBlack,
        scrolledUnderElevation: 5,
        backgroundColor: AppColors.kWhite,
        title: const Text("Forms"),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            AppSizes.kHeight10,
            HomeSvg(),
            AppSizes.kHeight10,
            HomeGridView(),
          ],
        ),
      ),
    );
  }
}
