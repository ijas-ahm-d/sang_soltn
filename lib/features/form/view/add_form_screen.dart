import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:provider/provider.dart';
import 'package:sang/features/form/components/general_condition.dart';
import 'package:sang/features/form/view/signature_screen.dart';
import 'package:sang/features/form/view_model/add_project_view_model.dart';
import 'package:sang/res/constants/app_colors.dart';
import 'package:sang/res/constants/app_sizes.dart';

class AddFormScreen extends StatefulWidget {
  const AddFormScreen({super.key});

  @override
  State<AddFormScreen> createState() => _AddFormScreenState();
}

class _AddFormScreenState extends State<AddFormScreen> {
  @override
  void initState() {
    context.read<AddProjectViewModel>().setDate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        shadowColor: AppColors.kBlack,
        title: const Text(
          "HSE OBSERVATION FORM",
          style: TextStyle(fontSize: 19),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Consumer<AddProjectViewModel>(
                builder: (context, value, child) {
                  value.setProjectName();
                  value.setEmployeeName();
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TypeAheadFormField(
                          textFieldConfiguration: TextFieldConfiguration(
                            controller: value.projectNameController,
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
                                labelText: "Project"),
                          ),
                          suggestionsCallback: (pattern) {
                            return value.namesList.where(
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
                            value.getiIdForSuggestion(suggestion);
                          },
                        ),
                        AppSizes.kHeight20,
                        TextField(
                          controller: value.descriptionController,
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
                              labelText: " Project Details"),
                        ),
                        AppSizes.kHeight20,
                        TextField(
                          controller: value.locController,
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
                              labelText: "Location"),
                        ),
                        AppSizes.kHeight20,
                        TextField(
                          controller: value.dateController,
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
                              labelText: "Date"),
                        ),
                        AppSizes.kHeight20,
                        const GeneralCondition(),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.kBlack),
                            color: AppColors.kWhite,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          height: size.height * 0.2,
                          child: value.signatureData == null
                              ? Center(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) {
                                                return SignatureScreen();
                                              },
                                            ),
                                          );
                                        },
                                        icon: const Icon(
                                          Icons.cloud_upload_rounded,
                                          size: 40,
                                        ),
                                      ),
                                      const Text("Upload Signature")
                                    ],
                                  ),
                                )
                              : Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Center(
                                      child: Image.memory(value.signatureData!),
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          value.setSignature(null);
                                        },
                                        icon: const Icon(Icons.close))
                                  ],
                                ),
                        ),
                        AppSizes.kHeight30,
                        Center(
                          child: ConstrainedBox(
                            constraints: const BoxConstraints(minWidth: 300),
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.primaryColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                                onPressed: () {
                                  value.submitForm(context);
                                },
                                child: const Text(
                                  "Submit",
                                  style: TextStyle(
                                    color: AppColors.kWhite,
                                  ),
                                )),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
