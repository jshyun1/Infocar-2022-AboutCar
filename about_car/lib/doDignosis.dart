import 'package:about_car/dignosisResult.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'notification.dart';

class DoDignosis extends StatelessWidget {
  const DoDignosis({Key? key}) : super(key: key);

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
      body: DoDignosisPage(),
    );
  }
}

class DoDignosisPage extends StatefulWidget {
  @override
  _DignosisPageState createState() => _DignosisPageState();
}

class _DignosisPageState extends State<DoDignosisPage> {
  late Future<String?> lgbm_result;

  bool _isButtonDisabled = true;
  @override
  Widget build(BuildContext context) {
    void _toResult() {
      if (_isButtonDisabled) {
      } else {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Result(),
            ));
      }
    }

    @override
    void initState() {
      _isButtonDisabled = true;
    }

    //need to add notification

    // TODO: implement build
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.15,
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.85,
          color: Color(0xff9FBEED).withOpacity(0.24),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection("/TrubleCode")
                    .snapshots(),
                builder: (BuildContext context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.data!.docs.isEmpty) {
                    _isButtonDisabled = true;
                    return Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              padding: EdgeInsets.only(left: 20, top: 20),
                              child: FadeInUp(
                                child: const Center(
                                  child: Text("진단중\u{1F50D}",
                                      style: TextStyle(
                                        fontSize: 25,
                                        color: Colors.black,
                                      )),
                                ),
                              )),
                          FadeInUp(child: CircularProgressIndicator()),
                          FadeInUp(
                              child: const Center(
                            child: Text('잠시만 기다려주세요',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black87,
                                )),
                          )),
                          FadeInUp(
                            child: Container(
                              width: MediaQuery.of(context).size.height * 1.0,
                              height: MediaQuery.of(context).size.height *
                                  0.85 *
                                  0.25,
                              child: ElevatedButton(
                                onPressed: () {
                                  _toResult();
                                },
                                child: const Text('결과보러가기',
                                    style: TextStyle(
                                      fontSize: 40,
                                      color: Colors.white,
                                    )),
                                style: ButtonStyle(backgroundColor:
                                    MaterialStateProperty.resolveWith(
                                  (states) {
                                    if (_isButtonDisabled) {
                                      return Colors.grey;
                                    } else {
                                      return Color(0xff8BB4F2);
                                    }
                                  },
                                )),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  } else {
                    _isButtonDisabled = false;
                    return Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              padding: EdgeInsets.only(left: 20, top: 20),
                              child: FadeInUp(
                                child: const Center(
                                  child: Text("진단 완료\u{1F50D}",
                                      style: TextStyle(
                                        fontSize: 25,
                                        color: Colors.black,
                                      )),
                                ),
                              )),
                          FadeInUp(
                            child: Center(
                              child: Container(
                                width: 300,
                                height: 300,
                                child: Image.asset('assets/02.png'),
                              ),
                            ),
                          ),
                          FadeInUp(
                            child: SizedBox(
                              width: MediaQuery.of(context).size.height * 1.0,
                              height: 200,
                              child: ElevatedButton(
                                onPressed: () {
                                  // showNotification();
                                  _toResult();
                                },
                                child: const Text('결과보러가기',
                                    style: TextStyle(
                                      fontSize: 40,
                                      color: Colors.white,
                                    )),
                                style: ButtonStyle(backgroundColor:
                                    MaterialStateProperty.resolveWith(
                                  (states) {
                                    if (_isButtonDisabled) {
                                      return Colors.grey;
                                    } else {
                                      return Color(0xff8BB4F2);
                                    }
                                  },
                                )),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        )
      ],
    );
  }
}
