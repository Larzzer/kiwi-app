import 'package:eksamesprojekt_kiwi_app/DatabaseConnection.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BraendstofsForbrug extends StatefulWidget {
  const BraendstofsForbrug({Key? key}) : super(key: key);

  @override
  _BraendstofsForbrugState createState() => _BraendstofsForbrugState();
}

class _BraendstofsForbrugState extends State<BraendstofsForbrug> {
  double _sliderValue = 50.0;
  final TextEditingController _textFieldController = TextEditingController();
  late SharedPreferences _prefs;
  String _kommentar = '';



  Future<void> loadFuel() async {
    await Database.loadFuel();
    _sliderValue = (Database.getFuelLeft());
  }

  @override
  void initState() {
    loadFuel();
    super.initState();
    // Initialize SharedPreferences
    SharedPreferences.getInstance().then((prefs) {
      _prefs = prefs;
      // Load the saved kommentar, if any
      final kommentar = _prefs.getString('kommentar');
      if (kommentar != null) {
        setState(() {
          _kommentar = kommentar;
          _textFieldController.text = kommentar;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BrændstofsForbrug'),
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 4 / 5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Brændstof status/benzin i procent tilbage '),
              Slider(
                value: _sliderValue,
                min: 0.0,
                max: 100.0,
                onChanged: (value) {
                  setState(() {
                    _sliderValue = value;
                  });
                },
                onChangeEnd: (value) {
                  // This method will be called when the user stops dragging the slider
                  Database.executeSql("INSERT INTO fuel (\"fuel-left\") VALUES ('"+value.toString()+"');");
                },
              ),
              Text(_sliderValue.toStringAsFixed(0)),
              TextField(
                controller: _textFieldController,
                decoration: const InputDecoration(
                  hintText: 'eventuel commentar',
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // Save the text from the TextField to SharedPreferences
                  final kommentar = _textFieldController.text;
                  _prefs.setString('kommentar', kommentar);
                  // Update the _kommentar variable and clear the TextField
                  setState(() {
                    _kommentar = kommentar;
                  });
                },
                child: const Text('Gem kommentar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}