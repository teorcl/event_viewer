// To parse this JSON data, do
//
//     final eventoModel = eventoModelFromJson(jsonString);

import 'dart:convert';

EventoModel eventoModelFromJson(String str) => EventoModel.fromJson(json.decode(str));

String eventoModelToJson(EventoModel data) => json.encode(data.toJson());

class EventoModel {
    EventoModel({
        required this.date,
        required this.time,
        required this.type,
        required this.eventDescription,
        required this.location,
        required this.status,
        required this.comment,
        required this.zoneCode,
        required this.userId,
    });

    int type;
    DateTime date;
    String time;
    String eventDescription;
    List<double> location;
    int status;
    String comment;
    int zoneCode;
    String userId;

    factory EventoModel.fromJson(Map<String, dynamic> json) => EventoModel(
        type: json["type"],
        date: DateTime.parse(json["date"]),
        time: json["time"],
        eventDescription: json["eventDescription"],
        location: List<double>.from(json["location"].map((x) => x.toDouble())),
        status: json["status"],
        comment: json["comment"],
        zoneCode: json["zoneCode"],
        userId: json["userId"],
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "time": time,
        "eventDescription": eventDescription,
        "location": List<dynamic>.from(location.map((x) => x)),
        "status": status,
        "comment": comment,
        "zoneCode": zoneCode,
        "userId": userId,
    };
}
