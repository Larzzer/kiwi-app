import 'package:flutter/material.dart';

class CreateTur extends StatefulWidget {
  final List<String> initialValues;

  const CreateTur({Key? key, required this.initialValues}) : super(key: key);

  @override
  _CreateTurState createState() => _CreateTurState();
}

class _CreateTurState extends State<CreateTur> {
  List<String> _titles = [
    "Dato",
    "Tid",
    "Kaptajn",
    "Ror",
    "Forsejlstyrbord",
    "Forsejlbagbord",
    "Bagstag",
    "Storsejl",
    "Navigation",
    "Fordæk",
    "pitmand",
    "Spiler"
  ];

  late List<String> _texts;

  @override
  void initState() {
    super.initState();
    _texts = List.from(widget.initialValues);
  }

  bool _isTurValid() {
    for (int i = 0; i < 3; i++) {
      if (_texts[i].isEmpty) {
        return false;
      }
    }
    return true;
  }

  void _saveText(int index, String text) {
    _texts[index] = text;
    setState(() {}); // rebuild the widget tree to reflect changes
  }

  void _onCreatePressed() {
    if (_isTurValid()) {
      // return the edited values
      Navigator.pop(context, _texts);
    } else {
      // show an error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Please fill in the first 3 fields'),
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Tur'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onCreatePressed,
        child: const Icon(Icons.save),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.8,
          ),
          child: ListView.builder(
            itemCount: _titles.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      _titles[index],
                      style: const TextStyle(fontSize: 24),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Container(
                      width: double.infinity,
                      child: TextField(
                        decoration: const InputDecoration(
                          hintText: 'Enter text here...',
                          border: OutlineInputBorder(),
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 3,
                        onChanged: (text) {
                          _saveText(index, text);
                        },
                        controller: TextEditingController(text: _texts[index]),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}