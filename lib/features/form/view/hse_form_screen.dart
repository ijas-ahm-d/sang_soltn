import 'package:flutter/material.dart';
import 'package:sang/res/constants/app_colors.dart';
import 'package:sang/res/constants/app_sizes.dart';
import 'package:sang/utils/routes/routes_name.dart';

class HseFormScreen extends StatelessWidget {
  const HseFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        shadowColor: AppColors.kBlack,
        scrolledUnderElevation: 5,
        title: const Text(
          "HSE OBSERVATION FORM",
          style: TextStyle(fontSize: 19),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              // pro.getAllProjects();
              Navigator.pushNamed(
                context,
                RoutesNames.addFormScreen,
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 20,
              ),
              child: const Text(
                "New Form",
                style: TextStyle(
                  color: AppColors.kWhite,
                ),
              ),
            ),
          ),
          AppSizes.kWidth20
        ],
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Container(
            height: 100,
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: AppColors.kWhite,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Company name helo",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.delete,
                          color: AppColors.kred,
                        ),
                        AppSizes.kWidth10,
                        Icon(
                          Icons.edit_note_outlined,
                        ),
                      ],
                    )
                  ],
                ),
                Text(
                  "hello dear",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("23-07-00004"),
                    Text("10-07-2023"),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
