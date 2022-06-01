class TroubleCode {
  String code;
  String date;

  TroubleCode({this.code = '', this.date = ''});

  factory TroubleCode.fromMap({required Map<String, dynamic> map}) {
    return TroubleCode(code: map['code'] ?? '', date: map['date'] ?? '');
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> data = {};
    data['code'] = code;

    return data;
  }
}
