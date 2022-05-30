import 'package:flutter/material.dart';
import './menu.dart';
import './sqlite.dart';

class Result extends StatelessWidget {
  const Result({Key? key}) : super(key: key);

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
            children: [
              const SizedBox(
                height: 100,
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
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //일단 3건으로 작성해놓은 상태, 향후 db연결 후  갯수를 넣어주면 될 것 같습니다.
                children: [
                  Container(
                      padding: const EdgeInsets.only(
                        left: 20,
                      ),
                      child: Container(
                        child: Text(
                          " 건 \u{1F697}",
                          style: TextStyle(fontSize: 30, color: Colors.black),
                        ),
                      )),
                  Container(
                      padding: EdgeInsets.only(right: 20),
                      child: const Text(
                        "2020년 05월 23일 기준",
                        style: TextStyle(fontSize: 15, color: Colors.grey),
                      )),
                ],
              ),
            ],
          ),
        ),
        Container(
            height: MediaQuery.of(context).size.height * 0.7,
            color: Color(0xff9FBEED).withOpacity(0.24),
            width: double.infinity,
            child: FutureBuilder<List<ResultCode>>(
              future: DatabaseHelper.instance.getall(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<ResultCode>> snapshot) {
                if (snapshot.hasData) {
                  return snapshot.data!.isEmpty
                      ? Container(child: Center(child: Text("no data")))
                      : ListView.builder(
                          padding: EdgeInsets.only(top: 0),
                          itemCount: snapshot.data!.length,
                          itemBuilder: (BuildContext context, int index) {
                            if (snapshot.data![index].code == 'null') {
                              return Card(
                                  child: Center(
                                child: Text(
                                  "CLEAN",
                                  style: TextStyle(fontSize: 30),
                                ),
                              ));
                            }
                            TroubleCode item =
                                TroubleCode(snapshot.data![index].code);
                            return TroubleTile(item);
                          },
                        );
                } else {
                  return Card(
                      child: Center(
                    child: Text(
                      "CLEAN",
                      style: TextStyle(fontSize: 30),
                    ),
                  ));
                }
              },
            ))
      ],
    );
  }
}

//db에서 불러올 고장 코드
class TroubleCode {
  String code;
  TroubleCode(this.code);
}

//고장 코드 리스트에 들어가는 카드
class TroubleTile extends StatelessWidget {
  TroubleTile(this._trouble);
  final TroubleCode _trouble;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: ListTile(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(8.0),
                child: Text(_trouble.code,
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
