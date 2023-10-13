

import 'dart:convert';

EmployeeModel employeeModelFromJson(String str) => EmployeeModel.fromJson(json.decode(str));

String employeeModelToJson(EmployeeModel data) => json.encode(data.toJson());

class EmployeeModel {
    String? status;
    String? messageDescription;
    String? resultData;

    EmployeeModel({
        this.status,
        this.messageDescription,
        this.resultData,
    });

    EmployeeModel copyWith({
        String? status,
        String? messageDescription,
        String? resultData,
    }) => 
        EmployeeModel(
            status: status ?? this.status,
            messageDescription: messageDescription ?? this.messageDescription,
            resultData: resultData ?? this.resultData,
        );

    factory EmployeeModel.fromJson(Map<String, dynamic> json) => EmployeeModel(
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
