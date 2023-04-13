import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class LogbookPage extends StatefulWidget {
  const LogbookPage({Key? key}) : super(key: key);

  @override
  _LogbookPageState createState() => _LogbookPageState();
}

class _LogbookPageState extends State<LogbookPage> {
  List<LogEntry> entries = [];

  TextEditingController _textController = TextEditingController();

  void _saveAndAddEntry() {
    if (_textController.text.isNotEmpty) {
      final newEntry = LogEntry(
        text: _textController.text,
        date: DateTime.now(),
      );
      setState(() {
        entries.add(newEntry);
        _textController.clear();
      });
      saveEntries(); // call saveEntries to save the new entry to the file
    }
  }

  void addEntry() {
    _saveAndAddEntry();
  }


  void saveEntries() async {
    // Write the list of entries to a file
    final file = await localFile;
    final entriesJson = entries.map((entry) => entry.toJson()).toList();
    await file.writeAsString(jsonEncode(entriesJson));
  }





  Future<List<LogEntry>> loadEntries() async {
    try {
      // Read the list of entries from the file
      final file = await localFile;
      final entriesJson = await file.readAsString();
      final entriesData = List<Map<String, dynamic>>.from(
        (jsonDecode(entriesJson) as List<dynamic>),
      );
      return entriesData.map((data) => LogEntry.fromJson(data)).toList();
    } catch (e) {
      // Return an empty list if there is an error reading the file
      return [];
    }
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get localFile async {
    final path = await _localPath;
    return File('$path/logbook.txt');
  }

  @override
  void initState() {
    super.initState();
    loadEntries().then((loadedEntries) {
      setState(() {
        entries = loadedEntries;
      });
    });
  }

  Future<void> deleteEntries() async {
    final file = await localFile;
    await file.delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Logbook'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: saveEntries,
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () async {
              final confirmed = await showDialog<bool>(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Delete All Entries'),
                  content: const Text('Are you sure you want to delete all entries?'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(false);
                      },
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(true);
                      },
                      child: const Text('Delete'),
                    ),
                  ],
                ),
              );
              if (confirmed == true) {
                setState(() {
                  entries.clear();
                });
                await deleteEntries(); // call deleteEntries to remove the entries from the file
              }
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: entries.length,
              itemBuilder: (BuildContext context, int index) {
                final entry = entries[index];
                final formattedDate =
                DateFormat.yMd().add_jm().format(entry.date);
                return ListTile(
                  title: Text(entry.text),
                  subtitle: Text(formattedDate),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            LogbookEntryDetailsPage(entry: entry),
                      ),
                    );
                  },
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
            onPressed: _saveAndAddEntry,
            child: const Text('Add Entry'),
          ),
          const SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              setState(() {
                entries.clear();
              });
            },
            child: const Text('Delete All Entries'),
          ),
        ],
      ),
    );
  }
}


class LogbookEntryDetailsPage extends StatelessWidget {
  final LogEntry entry;

  const LogbookEntryDetailsPage({Key? key, required this.entry})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formattedDate = DateFormat.yMd().add_jm().format(entry.date);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Logbook Entry Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              formattedDate,
              style: const TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 16.0),
            Text(
              entry.text,
              style: const TextStyle(fontSize: 18.0),
            ),
          ],
        ),
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

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'date': date.millisecondsSinceEpoch,
    };
  }

  factory LogEntry.fromJson(Map<String, dynamic> json) {
    return LogEntry(
      text: json['text'],
      date: DateTime.fromMillisecondsSinceEpoch(json['date']),
    );
  }
}

class LogbookHistoryPage extends StatelessWidget {
  final List<LogEntry> entries;

  const LogbookHistoryPage({Key? key, required this.entries})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Logbook History'),
      ),
      body: ListView.builder(
        itemCount: entries.length,
        itemBuilder: (BuildContext context, int index) {
          final entry = entries[index];
          final formattedDate = DateFormat.yMd().add_jm().format(entry.date);
          return ListTile(
            title: Text(entry.text),
            subtitle: Text(formattedDate),
            onTap: () {
              Navigator.of(context).pop(entry);
            },
          );
        },
      ),
    );
  }
}