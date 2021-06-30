// To parse this JSON data, do
//
//     final weatherModel = weatherModelFromJson(jsonString);

import 'dart:convert';

WeatherModel weatherModelFromJson(String str) => WeatherModel.fromJson(json.decode(str));

String weatherModelToJson(WeatherModel data) => json.encode(data.toJson());

class WeatherModel {
    WeatherModel({
        this.status,
        this.data,
    });

    String status;
    Data data;

    factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
        status: json["status"] == null ? null : json["status"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "data": data == null ? null : data.toJson(),
    };
}

class Data {
    Data({
        this.city,
        this.state,
        this.country,
        this.location,
        this.current,
    });

    String city;
    String state;
    String country;
    Location location;
    Current current;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        city: json["city"] == null ? null : json["city"],
        state: json["state"] == null ? null : json["state"],
        country: json["country"] == null ? null : json["country"],
        location: json["location"] == null ? null : Location.fromJson(json["location"]),
        current: json["current"] == null ? null : Current.fromJson(json["current"]),
    );

    Map<String, dynamic> toJson() => {
        "city": city == null ? null : city,
        "state": state == null ? null : state,
        "country": country == null ? null : country,
        "location": location == null ? null : location.toJson(),
        "current": current == null ? null : current.toJson(),
    };
}

class Current {
    Current({
        this.weather,
        this.pollution,
    });

    Weather weather;
    Pollution pollution;

    factory Current.fromJson(Map<String, dynamic> json) => Current(
        weather: json["weather"] == null ? null : Weather.fromJson(json["weather"]),
        pollution: json["pollution"] == null ? null : Pollution.fromJson(json["pollution"]),
    );

    Map<String, dynamic> toJson() => {
        "weather": weather == null ? null : weather.toJson(),
        "pollution": pollution == null ? null : pollution.toJson(),
    };
}

class Pollution {
    Pollution({
        this.ts,
        this.aqius,
        this.mainus,
        this.aqicn,
        this.maincn,
    });

    DateTime ts;
    int aqius;
    String mainus;
    int aqicn;
    String maincn;

    factory Pollution.fromJson(Map<String, dynamic> json) => Pollution(
        ts: json["ts"] == null ? null : DateTime.parse(json["ts"]),
        aqius: json["aqius"] == null ? null : json["aqius"],
        mainus: json["mainus"] == null ? null : json["mainus"],
        aqicn: json["aqicn"] == null ? null : json["aqicn"],
        maincn: json["maincn"] == null ? null : json["maincn"],
    );

    Map<String, dynamic> toJson() => {
        "ts": ts == null ? null : ts.toIso8601String(),
        "aqius": aqius == null ? null : aqius,
        "mainus": mainus == null ? null : mainus,
        "aqicn": aqicn == null ? null : aqicn,
        "maincn": maincn == null ? null : maincn,
    };
}

class Weather {
    Weather({
        this.ts,
        this.tp,
        this.pr,
        this.hu,
        this.ws,
        this.wd,
        this.ic,
    });

    DateTime ts;
    int tp;
    int pr;
    int hu;
    double ws;
    int wd;
    String ic;

    factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        ts: json["ts"] == null ? null : DateTime.parse(json["ts"]),
        tp: json["tp"] == null ? null : json["tp"],
        pr: json["pr"] == null ? null : json["pr"],
        hu: json["hu"] == null ? null : json["hu"],
        ws: json["ws"] == null ? null : json["ws"].toDouble(),
        wd: json["wd"] == null ? null : json["wd"],
        ic: json["ic"] == null ? null : json["ic"],
    );

    Map<String, dynamic> toJson() => {
        "ts": ts == null ? null : ts.toIso8601String(),
        "tp": tp == null ? null : tp,
        "pr": pr == null ? null : pr,
        "hu": hu == null ? null : hu,
        "ws": ws == null ? null : ws,
        "wd": wd == null ? null : wd,
        "ic": ic == null ? null : ic,
    };
}

class Location {
    Location({
        this.type,
        this.coordinates,
    });

    String type;
    List<double> coordinates;

    factory Location.fromJson(Map<String, dynamic> json) => Location(
        type: json["type"] == null ? null : json["type"],
        coordinates: json["coordinates"] == null ? null : List<double>.from(json["coordinates"].map((x) => x.toDouble())),
    );

    Map<String, dynamic> toJson() => {
        "type": type == null ? null : type,
        "coordinates": coordinates == null ? null : List<dynamic>.from(coordinates.map((x) => x)),
    };
}
