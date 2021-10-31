import 'package:election_exit_poll_620710321/pages/home/poll_item.dart';
import 'package:election_exit_poll_620710321/services/api.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const routeName = '/homepage_poll';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<PollItem>> _futureList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'assets/images/vote_hand.png',
                      height: 80.0,
                    ),
                    const Text(
                      'EXIT POLL',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 22.0, color: Colors.white),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    const Text(
                      'เลือกตั้ง อบต.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 26.0, color: Colors.white),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    const Text(
                      'รายชื่อผู้รับสมัครเลือกตั้ง\nนายกองค์การบริหารส่วนตำบลเขาพระ\nอ.เมืองนครนายก จ.นครนายก',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14.0, color: Colors.white),
                    ),

                  ],
                ),
              ),

              Container(
                child: FutureBuilder<List<PollItem>>(
                    future: _futureList,
                    builder: (context, snapshot){
                      if((snapshot.connectionState != ConnectionState.done)){
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if(snapshot.hasData){
                        for(int i=0 ; i<5 ; i++) {
                          var item = snapshot.data![i];
                          return Column(
                            children: [
                              Card(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                margin: const EdgeInsets.all(20.0),
                                elevation: 5.0,
                                shadowColor: Colors.black.withOpacity(0.2),
                                child: Row(
                                  children: [
                                    Text(item.number.toString()),
                                   const SizedBox(width: 5.0,),
                                    Text(item.fullName),
                                  ],
                                ),
                              ),
                            ],
                          );
                        }
                      }
                      return const SizedBox.shrink();
                    }

                ),
              )
              ,

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.purple,
                    ),
                    onPressed: () {
                      setState(() {
                        _handClickButton();
                      });
                    },
                    child: const Text(
                      'ดูผล',
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }

  _handClickButton() {}

  Future<List<PollItem>> _loadPoll() async {
    List list = await Api().fetch('exit_poll');
    var pollList = list.map((item) => PollItem.fromJson(item)).toList();
    return pollList;
    //print(list);
  }

  @override
  //initState ห้าม async
  void initState() {
    super.initState();
    _futureList = _loadPoll();
  }
}
