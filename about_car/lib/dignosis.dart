import 'package:flutter/material.dart';
import 'doDignosis.dart';

class Dignosis extends StatelessWidget {
  const Dignosis({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Center(
            child: Text(
          "고장 진단",
          style: TextStyle(fontSize: 15, color: Colors.black),
          textAlign: TextAlign.center,
        )),
        iconTheme: IconThemeData(color: Colors.grey),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        actions: <Widget>[
          IconButton(onPressed: () {}, icon: const Icon(Icons.info_outline)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
        ],
      ),
      body: DignosisPage(),
    );
  }
}

class DignosisPage extends StatefulWidget {
  @override
  _DignosisPageState createState() => _DignosisPageState();
}

class _DignosisPageState extends State<DignosisPage> {
  @override
  Widget build(BuildContext context) {
    void _toDignosis() {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DoDignosis(),
          ));
    }

    // TODO: implement build
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.only(left: 20, top: 50),
                child: const Text(
                  "고장 진단 시작하기",
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.8,
          color: Color(0xff9FBEED).withOpacity(0.24),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  padding: EdgeInsets.only(left: 20, top: 20),
                  child: Text("내 차량 데이터로\n예상되는 고장을 확인 해보세요\u{2757}",
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                      ))),
              Container(),
              Container(
                  width: MediaQuery.of(context).size.height * 1.0,
                  height: 200,
                  child: ElevatedButton(
                    onPressed: () {
                      _toDignosis();
                    },
                    child: Text('진단하러가기',
                        style: TextStyle(
                          fontSize: 40,
                          color: Colors.white,
                        )),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith(
                      (states) {
                        if (states.contains(MaterialState.disabled)) {
                          return Colors.grey;
                        } else {
                          return Color(0xff8BB4F2);
                        }
                      },
                    )),
                  )),
            ],
          ),
        )
      ],
    );
  }
}
