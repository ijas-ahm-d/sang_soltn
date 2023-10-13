// To parse this JSON data, do
//
//     final hseObservationModel = hseObservationModelFromJson(jsonString);

import 'dart:convert';

HseObservationModel hseObservationModelFromJson(String str) => HseObservationModel.fromJson(json.decode(str));

String hseObservationModelToJson(HseObservationModel data) => json.encode(data.toJson());

class HseObservationModel {
    int? iTransId;
    DateTime? docDate;
    int? project;
    String? projectDes;
    String? location;
    int? userId;
    String? signature;
    List<Body>? body;

    HseObservationModel({
        this.iTransId,
        this.docDate,
        this.project,
        this.projectDes,
        this.location,
        this.userId,
        this.signature,
        this.body,
    });

    factory HseObservationModel.fromJson(Map<String, dynamic> json) => HseObservationModel(
        iTransId: json["iTransId"],
        docDate: json["DocDate"] == null ? null : DateTime.parse(json["DocDate"]),
        project: json["Project"],
        projectDes: json["ProjectDes"],
        location: json["Location"],
        userId: json["UserId"],
        signature: json["Signature"],
        body: json["Body"] == null ? [] : List<Body>.from(json["Body"]!.map((x) => Body.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "iTransId": iTransId,
        "DocDate": "${docDate!.year.toString().padLeft(4, '0')}-${docDate!.month.toString().padLeft(2, '0')}-${docDate!.day.toString().padLeft(2, '0')}",
        "Project": project,
        "ProjectDes": projectDes,
        "Location": location,
        "UserId": userId,
        "Signature": signature,
        "Body": body == null ? [] : List<dynamic>.from(body!.map((x) => x.toJson())),
    };
}

class Body {
    String? observation;
    int? riskLevel;
    String? actionReq;
    int? actionBy;
    DateTime? targetDate;
    String? images;

    Body({
        this.observation,
        this.riskLevel,
        this.actionReq,
        this.actionBy,
        this.targetDate,
        this.images,
    });

    factory Body.fromJson(Map<String, dynamic> json) => Body(
        observation: json["Observation"],
        riskLevel: json["RiskLevel"],
        actionReq: json["ActionReq"],
        actionBy: json["ActionBy"],
        targetDate: json["TargetDate"] == null ? null : DateTime.parse(json["TargetDate"]),
        images: json["Images"],
    );

    Map<String, dynamic> toJson() => {
        "Observation": observation,
        "RiskLevel": riskLevel,
        "ActionReq": actionReq,
        "ActionBy": actionBy,
        "TargetDate": "${targetDate!.year.toString().padLeft(4, '0')}-${targetDate!.month.toString().padLeft(2, '0')}-${targetDate!.day.toString().padLeft(2, '0')}",
        "Images": images,
    };
}
