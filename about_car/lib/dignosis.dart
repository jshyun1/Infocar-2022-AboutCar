import 'package:flutter/material.dart';
import 'doDignosis.dart';
import 'package:animate_do/animate_do.dart';

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
          height: MediaQuery.of(context).size.height * 0.15,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [],
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.85,
          color: Color(0xff9FBEED).withOpacity(0.24),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  padding: EdgeInsets.only(left: 20, top: 20),
                  child: FadeInUp(
                    child: const Text("내 차량 데이터로\n고장을 예측하고 확인 해보세요\u{2757}",
                        style: TextStyle(
                            fontSize: 28,
                            color: Colors.black,
                            fontWeight: FontWeight.w100)),
                  )),
              FadeInUp(
                child: Center(
                  child: Container(
                    width: 250,
                    height: 200,
                    child: Image.asset('assets/car.png'),
                  ),
                ),
              ),
              Container(
                  padding: EdgeInsets.only(left: 20, top: 20),
                  child: FadeInUp(
                    child: const Text(
                        "앱에서 실행 하지 않아도\n자동으로 수행 후 \n고장이 있을 시 알림을 드립니다.",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black87,
                        )),
                  )),
              FadeInUp(
                child: Container(
                    width: MediaQuery.of(context).size.height * 1.0,
                    height: MediaQuery.of(context).size.height * 0.85 * 0.25,
                    child: ElevatedButton(
                      onPressed: () {
                        _toDignosis();
                      },
                      child: const Text('진단하러가기',
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
              ),
            ],
          ),
        )
      ],
    );
  }
}
