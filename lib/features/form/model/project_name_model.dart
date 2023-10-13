import 'dart:convert';






ProjectNameModel projectNameModelFromJson(String str) => ProjectNameModel.fromJson(json.decode(str));

String projectNameModelToJson(ProjectNameModel data) => json.encode(data.toJson());

class ProjectNameModel {
    String? status;
    String? messageDescription;
    String? resultData;
      // List<ResultDataItem>? resultData;

    ProjectNameModel({
        this.status,
        this.messageDescription,
        this.resultData,
    });

    factory ProjectNameModel.fromJson(Map<String, dynamic> json) => ProjectNameModel(
        status: json["Status"],
        messageDescription: json["MessageDescription"],
        resultData: json["ResultData"],
        // resultData: List<ResultDataItem>.from(json["ResultData"].map((x) => ResultDataItem.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "Status": status,
        "MessageDescription": messageDescription,
        //  "ResultData": List<dynamic>.from(resultData!.map((x) => x.toJson())),
        "ResultData": resultData,
    };
}



class ResultDataItem {
  int? iId;
  String? sName;
  String? sCode;

  ResultDataItem({
    this.iId,
    this.sName,
    this.sCode,
  });

  
}
