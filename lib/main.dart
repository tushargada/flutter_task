import 'package:flutter/material.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String name = "TUSHAR GADA";
  String newname;
  final _namecontroller = TextEditingController();
  bool fav = true;
  int count = 41;
  int totalcount = 0;

  @override
  void dispose() {
    _namecontroller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;
    Container topSectionColumn() {
      return Container(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("$name",
                style: TextStyle(
                    color: fav ? Colors.blueAccent : Colors.black,
                    fontWeight: FontWeight.bold)),
            Padding(padding: EdgeInsets.all(2.0)),
            Text("MUMBAI ANDHERI(WEST)"),
          ]
        )
      );
    }



    Container topSection() {
      return Container(
        padding: EdgeInsets.all(10),
        child: Row(
          children: <Widget>[
            Expanded(child: topSectionColumn()),
            Builder(builder: (BuildContext context) {
              return IconButton(
                icon: (fav ? Icon(Icons.star) : Icon(Icons.star_border)),
                onPressed: null ,
                // {
                //   favunfav();
                //   Scaffold.of(context).showSnackBar(SnackBar(
                //     content: Text('$totalcount'),
                //     duration: Duration(seconds: 1),
                //   ));
                // },
                color: Colors.redAccent,
              );
            }),
            Text("$count"),
          ],
        ),
      );
    }

    Column buttonSectionColumn(
        {Color color, IconData icondata, String label, Function urlpath}) {
      return Column(
        children: <Widget>[
          IconButton(
            icon: Icon(icondata, color: Colors.indigoAccent),
            onPressed: urlpath,
          ),
          Text(label),
        ],
      );
    }

    Widget buttonsection() {
      return Container(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            buttonSectionColumn(
              color: color,
              icondata: Icons.near_me,
              label: "ROUTE",
              // urlpath:(){_launchURL();}
            ),
            buttonSectionColumn(
                color: color, icondata: Icons.call, label: "CALL"),
            buttonSectionColumn(
                color: color, icondata: Icons.share, label: "SHARE"),
          ],
        ),
      );
    }

    Widget textsection() {
      return Container(
        padding: const EdgeInsets.all(32),
        child: Text(
          'Name:Tushar Gada College:Shah and Anchor Kutchhi Engineering college '
          'Branch:INFORMATION TECHNOLOGY Year:2nd'
              'Hobbies:sports,dancing,games',
          softWrap: true,
        ),
      );
    }

    return MaterialApp(
        title: "my own app",
        home: Scaffold(
          appBar: AppBar(
            title: Text("MY PROFILE"),
            backgroundColor: Colors.greenAccent,
          ),
          body: ListView(
            children: <Widget>[
              Image.asset(
                'images/tushar.jpg',
                width: 600,
                height: 200,
              ),
              topSection(),
              buttonsection(),
              textsection(),
              // nameChange(),
            ],
          ),
        ));
  }

  canLaunch(String url) {}
}
