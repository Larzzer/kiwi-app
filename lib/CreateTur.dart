import 'package:flutter/material.dart';
import 'package:eksamesprojekt_kiwi_app/GlobalState.dart';
class CreateTur extends StatefulWidget {
  const CreateTur({Key? key}) : super(key: key);

  @override
  _CreateTurState createState() => _CreateTurState();
}

class _CreateTurState extends State<CreateTur> {
  List<String> _titles = [    "Dato",    "Tid",    "Kaptajn",    "Ror",    "Forsejlstyrbord",    "Forsejlbagbord",    "Bagstag",    "Storsejl",    "Navigation",    "Fordæk",    "pitmand",    "Spiler"  ];

  List<String> _texts = List.filled(12, '');

  void _saveText(int index, String text) {
    _texts[index] = text;
    store.set("Tur", _texts);
  }

  void _onCreatePressed() {
    print(_texts);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Tur'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onCreatePressed,
        child: const Icon(Icons.add),
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