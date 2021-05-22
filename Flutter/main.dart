import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:mymusic1/Models/MainDataModels.dart';
import 'package:mymusic1/Models/SubDataModel.dart';
import 'package:mymusic1/TwoPage.dart';
import 'package:http/http.dart' as http;

void main(){
  runApp(new App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Future<void> connect() async{
    http.Response res = await http.get(Uri.parse("http://192.168.219.131:3000/"));
    print(res.body);
 // Future<void> connect() async{
 //   http.Response res =  await http.get(Uri.parse("http://192.168.219.131:3000/"));
 //   print(res.body);
    // 서버문자열 -> 다트문법 변환: 디코드/디코딩
    // 다트문법 -> 문자열로 변환해서 서버에 전달: 인코드/인코딩
    List<dynamic> li = json.decode(res.body);
    print("변환: ${ li[2] +1 }");

  }

  // Build 이전에 Modeling Data 담을 지점.
  List<Map<String,dynamic>> allData = [
    {
      "category":"댄스",
      "categoryimg":"https://images.unsplash.com/photo-1620414573733-2e3c7668cc63?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyfHx8ZW58MHx8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60",
      "datas":
      [
        {
         "title":"운전만해 (We Ride)",
          "artist":"브레이브걸스(Brave Girls)",
          "jacket":"https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8Z2lybHxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60",

        },
        {
          "title":"꼬리 (TAIL)",
          "artist":"선미",
          "jacket":"https://images.unsplash.com/photo-1620416264544-5866b5c5c931?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw0N3x8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60",

        }
      ]
    },
    {
      "category":"발라드",
      "categoryimg":"https://images.unsplash.com/photo-1619644918254-fa5d69bd17be?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw2OXx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60",
      "datas":
      [
        {
          "title":"살다가",
          "artist":"SG워너비",
          "jacket":"https://images.unsplash.com/photo-1526218626217-dc65a29bb444?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8c2luZ2VyfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",

        },
        {
          "title":"아이와 나의 바다",
          "artist":"아이유(IU)",
          "jacket":"https://images.unsplash.com/photo-1593697821252-0c9137d9fc45?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8c2luZ2VyfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",

        }
      ]
    },
    {
      "category":"힙합",
      "categoryimg":"https://images.unsplash.com/photo-1548354797-6b1c0d36b3af?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mjl8fGhpcCUyMGhvcHxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60",
      "datas":
      [
        {
          "title":"마.피.아. In the morning",
          "artist":"ITZY (있지)",
          "jacket":"https://images.unsplash.com/photo-1612976023590-be5b6a14051d?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NTh8fHNpbmdlcnxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",

        },
        {
          "title":"굿모닝 (Feat. 원슈타인)",
          "artist":"버벌진트(Verbal Jint),한해",
          "jacket":"https://images.unsplash.com/photo-1600395010878-e554c285589f?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzN8fGhpcCUyMGhvcHxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1400&q=60",

        }
      ]    }
  ];

  List <MainDataModel> vData;

  Future<void> mainConnect() async{
    // init 동기적인 실행
    // build 동기적인 생행
    // setState -> build 재실행 - 이미 build 한번 이상은 실행 되어있다는 전제
    // mountes - build를 했는지 체크하는 변수 / true - false

    http.Response res =  await http.get(Uri.parse("http://192.168.219.131:3000/datas"));
    List datas = json.decode(res.body);
    this.vData = datas.map<MainDataModel>( (e) => MainDataModel.fInit(e)).toList();
    return;
  }

  @override
  void initState() {

    Future(() async{
      await this.mainConnect();
      if (!mounted) return;
      setState(() {});
    });

    new Future(this.connect);
    // setState(() {
    // // iniState 시점을 만들어서 모델링 class의 인스턴스를 만들 지점
    // //  vData = this.allData.map((Map<String,dynamic> e){
    // //   return new MainDataModel(
    // //     categoryimg: e["categoryimg"].toString(),
    // //     category: e["category"].toString(),
    // //     datas: new List.from(e["datas"]).map<SubDataModel>((v){
    // //       return new SubDataModel(
    // //         title: v["title"].toString(),
    // //         lyrics: v["lyrics"].toString(),
    // //         artist: v["artist"].toString(),
    // //         jacket: v["jacket"].toString(),
    // //       );
    // //     }).toList()
    // //   );
    // // }).toList();
    //
    //  vData = this.allData.map((Map<String,dynamic> e){return new MainDataModel.fInit(e);}).toList();
    //
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        title: Text("My Music"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.add_outlined),
            onPressed: (){
              return;
            },
          )
        ],
      ),
      body: this.vData == null
          ? Center(child: Text("로딩 중....."),)
          : new GridView.builder(
        padding: EdgeInsets.all(10.0),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
          ),
          itemCount: this.vData.length,
          itemBuilder: (BuildContext context, int i){
            return GestureDetector(
              onTap: (){
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (BuildContext context){
                    return new TwoPage(
                      index: i,
                      category: this.vData[i].category,
                      datas: this.vData[i].datas,
                      categoryimg: this.vData[i].categoryimg
                    );
                  })
                );
                return;
              },
              child: new Container(
                width: 60.0,
                height: 60.0,
                color: Colors.black12,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 10.0),
                      padding: EdgeInsets.only(right: 5.0),
                      alignment: Alignment.centerRight,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.amberAccent,
                      child: Icon(
                          Icons.playlist_add_check,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top:10.0, bottom: 10.0),
                      width: 70.0,
                      height: 70.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(70.0),
                        color: Colors.red,
                        image: DecorationImage(
                          image: NetworkImage(this.vData[i].categoryimg),
                          fit: BoxFit.cover
                        )
                      ),
                    ),
                    Container(
                      child: Title(
                        color: Colors.black,
                        child: Text(this.vData[i].category,
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(Icons.play_arrow_sharp),
                          Icon(Icons.settings),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },
      ),
    );
  }
}
