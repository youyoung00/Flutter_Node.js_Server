let express = require("express"); // 1. 패키지 호출

let app = express(); // 2.변수에 담기

app.listen(3000); // 3.포트번호 지정 메서드

app.get('/', (req,res) => res.json([1,2,3])); // 4.라우터 (get / send)

app.get('/app', (req,res) => res.json("안녕하세요 앱")); // 5.라우터 (get / json)

app.get('/check', (req,res) => { // 6.라우터 if분기
    let reqCheck = req.headers["user-agent"];
    let index = reqCheck.indexOf("Chrome");
    if(index > -1){
        return res.send("안녕하세요, 웹!");
    }
    return res.json("안녕하세요, 앱!");
});
// 8. 정적인 분기는 순서가 중요하다.
app.get('/check/:date', (req,res) => { // 7정적 / 동적 분기, 쿼리스트링
    let date = req.params.date;
    res.send(date);
});

var datas = [
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
      ]    
    }
  ];

app.get('/datas/', (req,res) => {
    // xml, string, html ...
    res.json( datas );
});

app.get('/data/:id', (req,res) => {
    var id = req.params.id;
    res.json( datas[id] );
});
