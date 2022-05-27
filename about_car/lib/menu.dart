import 'package:about_car/dignosis.dart';
import 'package:flutter/material.dart';
import './dignosisResult.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _toResult() {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Result(),
          ));
    }

    void _toDiagnosis() {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Dignosis(),
          ));
    }

    return MaterialApp(
      home: Scaffold(
        body: Stack(children: [
          Container(
            color: Color(0xff9FBEED).withOpacity(0.24),
          ),
          Center(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 100,
              ),
              Container(
                padding: const EdgeInsets.only(
                  top: 30,
                ),
                child: const Text(
                  "menu",
                  style: TextStyle(
                      fontSize: 40,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                height: 70,
                width: 300,
                child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: Color(0xff8BB4F2),
                    ),
                    onPressed: () {
                      _toDiagnosis();
                    },
                    child: Text("차량 진단", style: TextStyle(fontSize: 25))),
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                height: 70,
                width: 300,
                child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: Color(0xff8BB4F2),
                    ),
                    onPressed: () {
                      _toResult();
                    },
                    child: Text("차량 진단 결과", style: TextStyle(fontSize: 25))),
              )
            ],
          ))
        ]),
      ),
    );
  }
}
