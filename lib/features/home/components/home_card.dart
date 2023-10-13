import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sang/features/form/view_model/add_project_view_model.dart';
import 'package:sang/features/home/model/home_card_model.dart';
import 'package:sang/res/constants/app_colors.dart';
import 'package:sang/utils/routes/routes_name.dart';

class HomeCard extends StatelessWidget {
  final int index;
  const HomeCard({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final pro = context.watch<AddProjectViewModel>();
    return GestureDetector(
      onTap: () {

        index == 0
            ? goToHseForm(context, pro)
            : Navigator.pushNamed(
                context,
                RoutesNames.emptyScreen,
                arguments: homeCardText[index],
              );
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.description,
              color: AppColors.kWhite,
              size: 60,
            ),
            Text(
              homeCardText[index],
              style: const TextStyle(color: AppColors.kWhite),
            )
          ],
        ),
      ),
    );
  }

  goToHseForm(BuildContext context, AddProjectViewModel vmodel) {
    vmodel.getAllProjects();
    vmodel.getAllEmployees();
    Navigator.pushNamed(context, RoutesNames.hseFormScreen);
  }
}
