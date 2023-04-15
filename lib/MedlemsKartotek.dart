import 'package:eksamesprojekt_kiwi_app/DatabaseConnection.dart';
import 'package:flutter/material.dart';

class Medlemskartotek extends StatefulWidget {
  const Medlemskartotek({Key? key}) : super(key: key);

  @override
  _MedlemskartotekState createState() => _MedlemskartotekState();

}

class _MedlemskartotekState extends State<Medlemskartotek> {
  List<List<String>> data = [];
  List<Map<String, dynamic>> _memberList = Database.getMemberList();
  final TextEditingController _navnController = TextEditingController();
  final TextEditingController _gmailController = TextEditingController();
  final TextEditingController _telefonController = TextEditingController();
  final TextEditingController _fuldeNavnController = TextEditingController();

  @override
  void initState() {
    loadMembers();
    super.initState();
  }

  Future<void> loadMembers() async {
    await Database.loadMembers();
    _memberList = Database.getMemberList();
  }

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
                  itemCount: _memberList.length,
                  itemBuilder: (BuildContext context, int index) {
                    final row = _memberList[index];
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(row["members"]["first-name"]),
                        Text(row["members"]["email"]),
                        Text(row["members"]["phone-number"].toString()),
                        Text(row["members"]["first-name"] + " "+ row["members"]["last-name"]),
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