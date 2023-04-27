import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:animate_do/animate_do.dart';

class Result extends StatelessWidget {
  Result({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Center(
            child: Text(
          "고장예측결과",
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
      body: ResultPage(),
    );
  }
}

class ResultPage extends StatefulWidget {
  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        Container(
          color: Colors.white,
          height: MediaQuery.of(context).size.height * 0.3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.only(left: 20, top: 25),
                child: const Text(
                  "고장 예측 결과",
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                  padding: const EdgeInsets.only(left: 20, top: 10),
                  child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection("/TrubleCode")
                          .snapshots(),
                      builder: (BuildContext context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return CircularProgressIndicator();
                        } else if (!snapshot.hasData) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "0 건 \u{1F697}",
                                style: TextStyle(
                                    fontSize: 30, color: Colors.black),
                              ),
                              Container(
                                  padding: EdgeInsets.only(right: 20, top: 10),
                                  child: const Text(
                                    "------기준",
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.grey),
                                  )),
                            ],
                          );
                        } else {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "${snapshot.data?.docs.length} 건 \u{1F697}",
                                style: const TextStyle(
                                    fontSize: 30, color: Colors.black),
                              ),
                              Container(
                                  padding: EdgeInsets.only(right: 20, top: 10),
                                  child: Text(
                                    "${snapshot.data?.docs.first['date']} 기준",
                                    style: const TextStyle(
                                        fontSize: 15, color: Colors.grey),
                                  )),
                            ],
                          );
                        }
                      })),
            ],
          ),
        ),
        Container(
            height: MediaQuery.of(context).size.height * 0.7,
            color: Color(0xff9FBEED).withOpacity(0.24),
            width: double.infinity,
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection("/TrubleCode")
                  .snapshots(),
              builder: (BuildContext context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (!snapshot.hasData) {
                  return const Card(
                      child: Center(
                          child: Text(
                    'CLAEN',
                    style: TextStyle(fontSize: 30, color: Colors.black),
                  )));
                } else {
                  return (ListView.builder(
                      padding: const EdgeInsets.only(top: 0),
                      itemCount: snapshot.data?.docs.length,
                      itemBuilder: (context, index) {
                        if (snapshot.data?.docs.first['code'] == 'null') {
                          return const Card(
                              child: Center(
                                  child: Text(
                            'CLAEN',
                            style: TextStyle(fontSize: 30, color: Colors.black),
                          )));
                        } else {
                          return FadeInUp(
                            child:
                                TroubleTile(snapshot.data?.docs[index]['code']),
                          );
                        }
                      }));
                }
                ;
              },
            ))
      ],
    );
  }
}

//  Text(
//                           " 건 \u{1F697}",
//                           style: TextStyle(fontSize: 30, color: Colors.black),
//                         ),
// ListView.builder(
//                       padding: const EdgeInsets.only(top: 0),
//                       itemCount: snapshot.data?.docs.length,
//                       itemBuilder: (context, index) {
//                         return TroubleTile(snapshot.data!.docs[index]['code']);
//고장 코드 리스트에 들어가는 카드
class TroubleTile extends StatelessWidget {
  TroubleTile(this._code);
  final String _code;

  @override
  Widget build(BuildContext context) {
    //final Uri url = Uri.parse('https://www.google.co.kr');
    void _toSearchPage(Uri url) async {
      if (!await launchUrl(url)) throw 'could not launch';
    }

    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: ListTile(
          onTap: () {
            _toSearchPage(
                Uri.parse('https://www.google.com/search?q=${_code}'));
          },
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(8.0),
                child: Text(_code,
                    style: TextStyle(fontSize: 30, color: Colors.black)),
              ),
              Divider()
            ],
          ),
          subtitle: Container(
              padding: EdgeInsets.all(8.0), child: Text("더 자세한 정보 보기")),
          trailing: Container(
              padding: EdgeInsets.only(top: 60),
              child: Icon(Icons.arrow_right)),
        ),
      ),
    );
  }
}
