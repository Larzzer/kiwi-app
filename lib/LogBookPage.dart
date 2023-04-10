import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LogbookPage extends StatefulWidget {
  const LogbookPage({Key? key}) : super(key: key);

  @override
  _LogbookPageState createState() => _LogbookPageState();
}

class _LogbookPageState extends State<LogbookPage> {
  List<LogEntry> entries = [];

  TextEditingController _textController = TextEditingController();

  void addEntry() {
    setState(() {
      entries.add(LogEntry(
        text: _textController.text,
        date: DateTime.now(),
      ));
      _textController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Logbook'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: entries.length,
              itemBuilder: (BuildContext context, int index) {
                final entry = entries[index];
                final formattedDate = DateFormat.yMd().add_jm().format(entry.date);
                return ListTile(
                  title: Text(entry.text),
                  subtitle: Text(formattedDate),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _textController,
              decoration: const InputDecoration(
                hintText: 'Enter your log entry here',
              ),
            ),
          ),
          ElevatedButton(
            onPressed: addEntry,
            child: const Text('Add Entry'),
          ),
        ],
      ),
    );
  }
}

class LogEntry {
  final String text;
  final DateTime date;

  LogEntry({
    required this.text,
    required this.date,
  });
}