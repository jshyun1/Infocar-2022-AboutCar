import 'package:about_car/dignosisResult.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

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
  bool _isButtonDisabled = true;
  @override
  Widget build(BuildContext context) {
    void _toDignosis() {
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

    // TODO: implement build
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.2,
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
                  child: const Center(
                    child: Text("진단중\u{1F50D}",
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                        )),
                  )),
              StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection("/TrubleCode")
                    .snapshots(),
                builder: (BuildContext context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.data!.docs.length == 0) {
                    _isButtonDisabled = true;
                    return Column(
                      children: [
                        CircularProgressIndicator(),
                        SizedBox(height: 60),
                        Container(
                          width: MediaQuery.of(context).size.height * 1.0,
                          height: 200,
                          child: ElevatedButton(
                            onPressed: () {
                              _toDignosis();
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
                      ],
                    );
                  } else {
                    _isButtonDisabled = false;
                    return Container(
                      width: MediaQuery.of(context).size.height * 1.0,
                      height: 200,
                      child: ElevatedButton(
                        onPressed: () {
                          _toDignosis();
                        },
                        child: const Text('결과보러가기',
                            style: TextStyle(
                              fontSize: 40,
                              color: Colors.white,
                            )),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.resolveWith(
                          (states) {
                            if (_isButtonDisabled) {
                              return Colors.grey;
                            } else {
                              return Color(0xff8BB4F2);
                            }
                          },
                        )),
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
