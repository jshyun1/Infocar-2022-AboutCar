import 'dart:ffi';

class Data {
  //'srcSpeed','srcAPS','srcGyroValue','srcRPM','srcTPS','srcMAF','srcEngineLoad'
  double srcSpeed;
  double srcAPS;
  double srcGyroValue;
  double srcRPM;
  double srcTPS;
  double srcMAF;
  double srcEngineLoad;

  Data(
      {required this.srcSpeed,
      required this.srcAPS,
      required this.srcGyroValue,
      required this.srcRPM,
      required this.srcTPS,
      required this.srcMAF,
      required this.srcEngineLoad});

  Map<String, dynamic> toJson() {
    return {
      'srcSpeed': srcSpeed,
      'srcAPS': srcAPS,
      'srcGyroValue': srcGyroValue,
      'srcRPM': srcRPM,
      'srcTPS': srcTPS,
      'srcMAF': srcMAF,
      'srcEngineLoad': srcEngineLoad
    };
  }

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      srcSpeed: json['srcSpeed'],
      srcAPS: json['srcAPS'],
      srcGyroValue: json['srcGyroValue'],
      srcRPM: json['srcRPM'],
      srcTPS: json['srcTPS'],
      srcMAF: json['srcMAF'],
      srcEngineLoad: json['srcEngineLoad'],
    );
  }
}
