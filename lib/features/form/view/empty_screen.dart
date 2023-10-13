import 'package:flutter/material.dart';

class EmptyScreen extends StatelessWidget {
  final String title;
  const EmptyScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: const Center(
        child: Text("No Data Found"),
      ),
    );
  }
}
class SubFormModel {
  String? observation;
  int? riskLevel;
  String? actionReq;
  int? actionBy;
  DateTime? targetDate;
  String? images;

  SubFormModel({
    this.observation,
    this.riskLevel,
    this.actionReq,
    this.actionBy,
    this.targetDate,
    this.images,
  }  );
}