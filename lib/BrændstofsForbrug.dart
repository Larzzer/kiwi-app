import 'package:flutter/material.dart';

class BraendstofsForbrug extends StatefulWidget {
  const BraendstofsForbrug({Key? key}) : super(key: key);

  @override
  _BraendstofsForbrugState createState() => _BraendstofsForbrugState();
}

class _BraendstofsForbrugState extends State<BraendstofsForbrug> {
  double _sliderValue = 50.0;
  final TextEditingController _textFieldController =
  TextEditingController();

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
              ),
              Text(_sliderValue.toStringAsFixed(0)),
              TextField(
                controller: _textFieldController,
                decoration: const InputDecoration(
                  hintText: 'eventuel commentar',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}