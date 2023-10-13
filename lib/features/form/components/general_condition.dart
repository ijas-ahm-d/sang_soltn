import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sang/features/form/view/sub_form_screen.dart';
import 'package:sang/features/form/view_model/add_project_view_model.dart';
import 'package:sang/res/constants/app_colors.dart';

class GeneralCondition extends StatefulWidget {
  const GeneralCondition({super.key});

  @override
  State<GeneralCondition> createState() => _GeneralConditionState();
}

class _GeneralConditionState extends State<GeneralCondition> {
 

  String getRiskLevelLabel(int riskLevel) {
    switch (riskLevel) {
      case 1:
        return "Low";
      case 2:
        return "Medium";
      case 3:
        return "High";
      default:
        return "Unknown";
    }
  }

  @override
  Widget build(BuildContext context) {
    final pro = context.watch<AddProjectViewModel>();
    final size = MediaQuery.of(context).size;
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "General Conditon",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Column(
              children: [
                Consumer<AddProjectViewModel>(
                  builder: (context, value, child) {
                    return DataTable(
                      columns: const [
                        DataColumn(label: Text("Actions")),
                        DataColumn(label: Text("SL NO")),
                        DataColumn(label: Text("Observations / Findings")),
                        DataColumn(label: Text("Risk Level")),
                        DataColumn(label: Text("Action Required")),
                      ],
                      rows: pro.subFormList.asMap().entries.map(
                        (entry) {
                          final index = entry.key + 1;
                          final data = entry.value;
                          return DataRow(
                            cells: [
                              DataCell(
                                Row(
                                  children: [
                                    IconButton(
                                      icon: const Icon(Icons.edit),
                                      onPressed: () {
                                      },
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.delete),
                                      onPressed: () {
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              DataCell(
                                Text(
                                  index.toString(),
                                ),
                              ),
                              DataCell(
                                Text(data.observation ?? ""),
                              ),
                              DataCell(
                                Text(
                                  getRiskLevelLabel(data.riskLevel ?? 0),
                                ),
                              ),
                              DataCell(
                                Text(data.actionReq ?? ""),
                              ),
                            ],
                          );
                        },
                      ).toList(),
                    );
                  },
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      pro.clearFields();
                      _showAddValueDialog(size);
                    },
                    child: const Text(
                      "Add General Conditon",
                      style: TextStyle(
                        color: AppColors.kWhite,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showAddValueDialog(
    Size size,
  ) {
    showDialog(
      context: context,
      builder: (context) {
        return const SubFormScreen();
      },
    );
  }
}
