import 'package:flutter/material.dart';

class Medlemskartotek extends StatefulWidget {
  const Medlemskartotek({Key? key}) : super(key: key);

  @override
  _MedlemskartotekState createState() => _MedlemskartotekState();
}

class _MedlemskartotekState extends State<Medlemskartotek> {
  List<List<String>> data = [];

  final TextEditingController _navnController = TextEditingController();
  final TextEditingController _gmailController = TextEditingController();
  final TextEditingController _telefonController = TextEditingController();
  final TextEditingController _fuldeNavnController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Medlemskartotek'),
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 4 / 5,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Navn'),
                  Text('gmail'),
                  Text('telefon nummer'),
                  Text('fulde navn'),
                ],
              ),
              const Divider(),
              Expanded(
                child: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (BuildContext context, int index) {
                    final row = data[index];
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(row[0]),
                        Text(row[1]),
                        Text(row[2]),
                        Text(row[3]),
                      ],
                    );
                  },
                ),
              ),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextField(
                      controller: _navnController,
                      decoration: const InputDecoration(
                        hintText: 'Navn',
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      controller: _gmailController,
                      decoration: const InputDecoration(
                        hintText: 'gmail',
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      controller: _telefonController,
                      decoration: const InputDecoration(
                        hintText: 'telefon nummer',
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      controller: _fuldeNavnController,
                      decoration: const InputDecoration(
                        hintText: 'fulde navn',
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        data.add([
                          _navnController.text,
                          _gmailController.text,
                          _telefonController.text,
                          _fuldeNavnController.text,
                        ]);
                        _navnController.clear();
                        _gmailController.clear();
                        _telefonController.clear();
                        _fuldeNavnController.clear();
                      });
                    },
                    icon: const Icon(Icons.add),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}