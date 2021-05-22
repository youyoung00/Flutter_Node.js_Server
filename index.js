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
      "title" : "댄스",
      "datas" : [
          {"title" : "댄스노래1", 
          "name" : "댄스가수1",
          "des" : "댄스가사1", 
          "image": "https://cdn.pixabay.com/photo/2020/09/20/14/08/woman-5587219__480.jpg"
        },
        {
          "title" : "댄스노래2",
          "name" : "댄스가수2",
          "des" : "댄스가사2",
          "image": "https://cdn.pixabay.com/photo/2021/04/26/10/48/lake-6208614__480.jpg"
        }
      ]
    },
    {
      "title" : "발라드",
      "datas" : [
        {
          "title" : "발라드노래1",
          "name" : "발라드가수1",
          "des" : "발라드가사1",
          "image": "https://cdn.pixabay.com/photo/2020/01/21/16/26/yorkshire-terrier-4783327__480.jpg"
        },
        {
          "title" : "발라드노래2",
          "name" : "발라드가수2",
          "des" : "댄스가사2",
          "image": "https://cdn.pixabay.com/photo/2020/01/21/16/26/yorkshire-terrier-4783327__480.jpg"
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
