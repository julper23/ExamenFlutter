import 'package:flutter/material.dart';

void main() {
  runApp(MyHomePage());
}


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int _numMax = 33;
  void _incrementCounter() {
    setState(() {
      if(_counter!=33){
        _counter++;
      }
    });
  }
  void _decrementCounter() {
    setState(() {
      if(_counter>0){
        _counter--;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    final botonesA = 100.0;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('EXAMEN'),
        ),
              body: Column(
        children: [
          GestureDetector(
            child: SizedBox(
              height: botonesA,
              child: Center(
                child: Column(
                  children: [
                    //margen superior,
                    Expanded(
                        flex: 1,
                        child: Container(
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                flex: 1,
                                child: Container(
                                  width: double.infinity,
                                  color: Colors.amber[100],
                                  padding: EdgeInsets.all(5),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      FloatingActionButton(
                                        onPressed: _decrementCounter,
                                        tooltip: 'Decrement',
                                        child: Text("-",style: TextStyle(fontSize: 50))//Icon(Icons.remove),El icono ponia un icono distinto por eso lo hago con text
                                      ),
                                      Column(children: <Widget>[Container(width: 20,child:Text(""),)]),
                                      Container(child:Text("$_counter",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold))),
                                      Column(children: <Widget>[Container(width: 20,child:Text(""),)]),
                                      FloatingActionButton(
                                        onPressed: _incrementCounter,
                                        tooltip: 'Increment',
                                        child: Text("+",style: TextStyle(fontSize: 50))//Icon(Icons.add),El icono ponia un icono distinto por eso lo hago con text
                                      ),
                                    ]
                                  ),
                                ),
                              ),
                              
                            ]
                          )
                        )
                    ),
                  ]
                )
              )
            ),
          ),
          Container(
            height: 503,
            color: Colors.amber[200],
            child: GridView.count(
              crossAxisCount: 5,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              primary: false,
              padding: const EdgeInsets.all(20),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: List.generate(_counter, (index) {
                return Container(
                  padding: const EdgeInsets.all(8),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      (index+1)%15 == 0 ? 'FB':((index+1)%3 == 0 ? 'FACE':((index+1)%5 == 0 ? 'BOOK':(index+1).toString())),
                    ),
                    ),
                  color: Colors.teal[100],
                );
              }),
            )
          )
        ])
  ));}
}