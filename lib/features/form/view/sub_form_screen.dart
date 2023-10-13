import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:provider/provider.dart';
import 'package:sang/features/form/view_model/add_project_view_model.dart';
import 'package:sang/res/constants/app_colors.dart';
import 'package:sang/res/constants/app_sizes.dart';

class SubFormScreen extends StatelessWidget {
  const SubFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return AlertDialog(
      backgroundColor: AppColors.kWhite,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
      content: SizedBox(
        width: size.width * 0.8,
        height: size.height * 0.85,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Add General Condition",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              AppSizes.kHeight20,
              SizedBox(
                child: Consumer<AddProjectViewModel>(
                    builder: (context, value, child) {
                  return Form(
                    key: value.formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          maxLines: 3,
                          controller: value.observationsController,
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: AppColors.kWhite,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                  color: AppColors.primaryColor,
                                ),
                              ),
                              labelText: "Observations / Findings"),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Observations / Findings is required";
                            }
                            return null;
                          },
                        ),
                        AppSizes.kHeight20,
                        DropdownButtonFormField<int>(
                          value: value.selectedRiskLevel,
                          items: const [
                            DropdownMenuItem<int>(
                              value: 1,
                              child: Text("Low"),
                            ),
                            DropdownMenuItem<int>(
                              value: 2,
                              child: Text("Medium"),
                            ),
                            DropdownMenuItem<int>(
                              value: 3,
                              child: Text("High"),
                            ),
                          ],
                          onChanged: (val) {
                            value.setRisklevel(val!);
                          },
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: AppColors.kWhite,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: AppColors.primaryColor,
                              ),
                            ),
                            hintText: "(Risk Level)",
                            labelText: "Risk Level",
                          ),
                        ),
                        AppSizes.kHeight20,
                        TextFormField(
                          maxLines: 3,
                          controller: value.actionRequiredController,
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: AppColors.kWhite,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                  color: AppColors.primaryColor,
                                ),
                              ),
                              labelText: "Action Required"),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Action Required is required";
                            }
                            return null;
                          },
                        ),
                        AppSizes.kHeight20,
                        TypeAheadFormField(
                          textFieldConfiguration: TextFieldConfiguration(
                            controller: value.actionByController,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: AppColors.kWhite,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                  color: AppColors.primaryColor,
                                ),
                              ),
                              labelText: "Action By",
                            ),
                          ),
                          suggestionsCallback: (pattern) {
                            return value.employeeList.where(
                              (element) => element
                                  .toLowerCase()
                                  .contains(pattern.toLowerCase()),
                            );
                          },
                          itemBuilder: (context, itemData) {
                            return ListTile(
                              title: Text(itemData),
                            );
                          },
                          onSuggestionSelected: (suggestion) {
                            value.getEmployeeCode(suggestion);
                          },
                        ),
                        AppSizes.kHeight20,
                        TextFormField(
                          controller: value.employeeCodeController,
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: AppColors.kWhite,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                  color: AppColors.primaryColor,
                                ),
                              ),
                              labelText: "Employee Code"),
                        ),
                        AppSizes.kHeight20,
                        TextFormField(
                          controller: value.targetDateController,
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: AppColors.kWhite,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                  color: AppColors.primaryColor,
                                ),
                              ),
                              labelText: "Target Date"),
                        ),
                        AppSizes.kHeight20,
                        Consumer<AddProjectViewModel>(
                          builder: (context, value, child) {
                            return Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: AppColors.kBlack),
                                color: AppColors.kWhite,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              height: size.height * 0.2,
                              child: value.projectImage == null
                                  ? Center(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          IconButton(
                                            onPressed: () {
                                              value.pickImage();
                                            },
                                            icon: const Icon(
                                              Icons.cloud_upload_rounded,
                                              size: 40,
                                            ),
                                          ),
                                          const Text("Upload Image")
                                        ],
                                      ),
                                    )
                                  : Center(
                                      child: Image.file(value.projectImage!),
                                    ),
                            );
                          },
                        ),
                        AppSizes.kHeight20,
                      ],
                    ),
                  );
                }),
              ),
              Consumer<AddProjectViewModel>(
                builder: (context, value, child) {
                  return Center(
                    child: ConstrainedBox(
                      constraints:const BoxConstraints(minWidth: 200),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        onPressed: () {
                          if (value.formKey.currentState?.validate() == true) {
                            // Add the newEntry to your bodyData list or wherever you want to store it
                            value.onSubFormSubmit();
                            Navigator.of(context).pop();
                          }
                        },
                        child: const Text(
                          "Add",
                          style: TextStyle(
                            color: AppColors.kWhite,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
