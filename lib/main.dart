import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

enum WhyFarther { harder, smarter, selfStarter, tradingCharter }

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Posting',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Posts'),
    );
  }
}


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  WhyFarther _selection;
  void _addItem() {
    setState(() {
      _counter = _counter + 1;
    });
  }

  Container _buildRow(int index) {
    return Container(
      child: Text(
        index.toString(),
        style: TextStyle(color: Colors.red),
      ),
      padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
      width: 200.0,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.blue),
          borderRadius: BorderRadius.circular(8.0)),
      margin: EdgeInsets.only(
          bottom: 10.0,
          right: 10.0),
    );
  }
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
       actions: <Widget>[
         PopupMenuButton<WhyFarther>(
            onSelected: (WhyFarther result) { setState(() { _selection = result; }); },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<WhyFarther>>[
              const PopupMenuItem<WhyFarther>(
                value: WhyFarther.harder,
                child:  ListTile(leading: Icon(Icons.favorite, color: Colors.pink,), title: Text('Favourites')),

              ),
              const PopupMenuItem<WhyFarther>(
                value: WhyFarther.smarter,
                child: ListTile(leading: Icon(Icons.arrow_upward_rounded, color: Colors.pink, size: 30.0,), title: Text('Most Recent')),
              ),
              const PopupMenuItem<WhyFarther>(
                value: WhyFarther.selfStarter,
                child: ListTile(leading: Icon(Icons.emoji_events_rounded, color: Colors.pink, size: 30.0,), title: Text('Most Popular')),
              ),
              const PopupMenuItem<WhyFarther>(
                value: WhyFarther.tradingCharter,
                child: ListTile(leading: Icon(Icons.sentiment_satisfied_alt_outlined, color: Colors.pink, size: 30.0,), title: Text('Mine')),
              ),
            ],
          )
       ],
        title: Text(widget.title),
      ),
      body: ListView.builder(
          itemCount: this._counter,
          itemBuilder: (context, index) => this._buildRow(index)),
          floatingActionButton: FloatingActionButton(
            onPressed: _addItem,
            child: Icon(Icons.add),
          ),
    );
  }

  Widget buildInput() {
    return Container(
      child: Row(
        children: <Widget>[
          // Edit text
          Flexible(
            child: Container(
              child: TextField(
                onSubmitted: (value) {
                  //onSendMessage(textEditingController.text, 0);
                },
                style: TextStyle(color: Colors.red, fontSize: 15.0),
                //controller: textEditingController,
                decoration: InputDecoration.collapsed(
                  hintText: 'Type your message...',
                  hintStyle: TextStyle(color: Colors.blue),
                ),
                //focusNode: focusNode,
              ),
            ),
          ),

          // Button send message
          Material(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 8.0),
              child: IconButton(
                icon: Icon(Icons.send),
                //onPressed: () => onSendMessage(textEditingController.text, 0),
                color: Colors.red,
              ),
            ),
            color: Colors.white,
          ),
        ],
      ),
      width: double.infinity,
      height: 50.0,
      decoration: BoxDecoration(
          border: Border(top: BorderSide(color: Colors.blue, width: 0.5)),
          color: Colors.white),
    );
  }

}
