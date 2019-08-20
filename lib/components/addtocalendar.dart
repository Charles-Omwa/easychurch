import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class Reminder extends StatefulWidget {


  @override
  _ReminderState createState() => _ReminderState();
}

class _ReminderState extends State<Reminder> {
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      appBar: AppBar(
        title: Text('Reminder'),
      ),
      url: "https://calendar.google.com/calendar/gp?hl=en",
      withZoom: true,
    );
  }

}