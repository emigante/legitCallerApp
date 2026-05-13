// To parse this JSON data, do
//
//     final userData = userDataFromJson(jsonString);

import 'dart:convert';

UserData userDataFromJson(String str) => UserData.fromJson(json.decode(str));

String userDataToJson(UserData data) => json.encode(data.toJson());

class UserData {
    bool success;
    int status;
    String message;
    Data data;

    UserData({
        required this.success,
        required this.status,
        required this.message,
        required this.data,
    });

    factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        success: json["success"],
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "status": status,
        "message": message,
        "data": data.toJson(),
    };
}

class Data {
    int contractCount;
    List<Contract> contracts;

    Data({
        required this.contractCount,
        required this.contracts,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        contractCount: json["contractCount"],
        contracts: List<Contract>.from(json["contracts"].map((x) => Contract.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "contractCount": contractCount,
        "contracts": List<dynamic>.from(contracts.map((x) => x.toJson())),
    };
}

class Contract {
    String membership;
    int contractId;
    double salePrice;
    int promoter;
    String promoterName;

    Contract({
        required this.membership,
        required this.contractId,
        required this.salePrice,
        required this.promoter,
        required this.promoterName,
    });

    factory Contract.fromJson(Map<String, dynamic> json) => Contract(
        membership: json["membership"],
        contractId: json["contractId"],
        salePrice: json["salePrice"],
        promoter: json["promoter"],
        promoterName: json["promoterName"],
    );

    Map<String, dynamic> toJson() => {
        "membership": membership,
        "contractId": contractId,
        "salePrice": salePrice,
        "promoter": promoter,
        "promoterName": promoterName,
    };
}
