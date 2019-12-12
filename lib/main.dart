
import 'package:calendar/first_calendar/calendar_carousel.dart';
import 'package:calendar/first_calendar//clean_calendar.dart';
import 'package:calendar/first_calendar/table_calendar.dart';
import 'package:calendar/screens/agendamento_screen.dart';
import 'package:calendar/second_calendar//calendar_carousel.dart';
import 'package:calendar/second_calendar/table_calendar.dart';
import 'package:flutter/material.dart';
void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Calendar Tester',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Calendar Test'),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Text('Calendário Marcação', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              ),
              Center(child: Text('Clean Calendar')),
              Container(
                margin: EdgeInsets.all(16.0),
                color: Colors.blue,
                height: 420,
                child: CleanCalendarExample(),
              ), //


            RaisedButton(
              child: Text("Agendar"),
              onPressed:() {
                return Navigator.push(context,
                MaterialPageRoute(builder: (context)=> AgendamentoScreen()));
              },
            )
            ],
          ),
        ));
  }
}