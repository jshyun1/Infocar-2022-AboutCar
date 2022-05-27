import 'package:flutter/material.dart';
import './menu.dart';

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
                  "고장 잔단 시작하기",
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.7,
          color: Color(0xff9FBEED).withOpacity(0.24),
          width: double.infinity,
        )
      ],
    );
  }
}
