import 'dart:convert';

ProjectDescriptionModel projectDescriptionModelFromJson(String str) => ProjectDescriptionModel.fromJson(json.decode(str));

String projectDescriptionModelToJson(ProjectDescriptionModel data) => json.encode(data.toJson());

class ProjectDescriptionModel {
    String? status;
    String? messageDescription;
    String? resultData;

    ProjectDescriptionModel({
        this.status,
        this.messageDescription,
        this.resultData,
    });

    ProjectDescriptionModel copyWith({
        String? status,
        String? messageDescription,
        String? resultData,
    }) => 
        ProjectDescriptionModel(
            status: status ?? this.status,
            messageDescription: messageDescription ?? this.messageDescription,
            resultData: resultData ?? this.resultData,
        );

    factory ProjectDescriptionModel.fromJson(Map<String, dynamic> json) => ProjectDescriptionModel(
        status: json["Status"],
        messageDescription: json["MessageDescription"],
        resultData: json["ResultData"],
    );

    Map<String, dynamic> toJson() => {
        "Status": status,
        "MessageDescription": messageDescription,
        "ResultData": resultData,
    };
}