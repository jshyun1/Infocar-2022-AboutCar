import 'dart:convert';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'dart:async' show Future;
import './toJson.dart';

class MLService {
  MLService() {
    print("ml service create");
  }
  Dio dio = Dio();
  //임의로 값 넣어놓기
  Data data = Data(
      srcSpeed: 0.000000,
      srcAPS: 15.729847,
      srcGyroValue: -0.109772,
      srcRPM: 786.944444,
      srcTPS: 15.555556,
      srcMAF: 1.803333,
      srcEngineLoad: 26.361656);

  // ml server

  // https://github.com/PuzzleLeaf/tensorflow_flask_api_server
  // ignore: non_constant_identifier_names
  Future<void> lgbm_service() async {
    print("ml lgbm service");
    const url = 'http://127.0.0.1:5000/lgbm';

    try {
      print("connecting");
      var encoded = json.encode(data);
      print(encoded);
      Response response = await dio.post(url, data: {'data': encoded});
      print("Data:\n${response.data}");
      var result = response.data;
      print(result.runtimeType);
      if (result == "True") {
        print("true");
        FirebaseFirestore.instance
            .collection('TrubleCode')
            .add({'code': "P0171", 'date': "23-04-23"});
      } else {
        print("false");
      }
      return (response.data);
    } catch (e) {
      print(e);
    }
  }
}
